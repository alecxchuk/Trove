import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.logger.dart';
import 'package:trove/models/api_response.dart';
import 'package:trove/models/loan_history.dart';
import 'package:trove/models/loan_model.dart';
import 'package:trove/models/user_portfolio.dart';
import 'package:trove/services/app_services/dialog_service.dart';
import 'package:trove/services/app_services/snackbar_service.dart';
import 'package:trove/utils/constants/app_constants.dart';
import 'package:trove/utils/constants/app_strings.dart';
import 'package:trove/utils/enums.dart';
import 'package:trove/utils/extensions/string_extension.dart';

import '../../utils/api_handlers/api.dart';
import '../../utils/api_handlers/api_utils.dart';
import '../../utils/api_handlers/dio_interceptors.dart';
import '../../utils/api_handlers/failures.dart';

class TroveApi implements Api {
  final log = getLogger('ZuriApi');
  final dio = Dio();
  final _snackService = serviceLocator<SnackbarService>();
  final _dialogService = serviceLocator<DialogService>();

//  Future doThings() async {
//     print('dialog called');
//     var dialogResult = await _dialogService.showDialog(
//       title: 'Custom Title',
//       description: 'FilledStacks architecture rocks',
//     );
//     if (dialogResult.confirmed) {
//       print('User has confirmed');
//     } else {
//       print('User cancelled the dialog');
//     }
//   }

  _showDialog(String title, String message) async {
    print('dialog called');
    await _dialogService.showDialog(
      title: title,
      description: message,
    );
  }

  // HELPER METHOD TO SHOW FAILURE SNACKBAR
  Future showSnackbar(String message) async {
    await _snackService.showSnackbar(
        content: message, variant: SnackbarType.failure);
  }

  // HELPER METHOD FOR CATCHING DIO ERRORS
  catchError(e) {
    log.w('pop:${e.response!.data!['error']}');
    //(err.response?.data ?? err.message).toString()
    if (e.response!.data!['error'] == String) {
      _showDialog("Error", e.response!.data!['error']);
      // showSnackbar(
      //   e.response!.data!['error'],
      // );
    } else if (e.response!.data!['error'] != String) {
      // showSnackbar(
      //   e.response!.data!['message'] ??
      //       e.response!.data['error'] ??
      //       errorOccurred,
      // );
      _showDialog(
        "Error",
        e.response!.data!['message'] ??
            e.response!.data['error'] ??
            errorOccurred,
      );
    }
    log.w(e.toString());
    handleApiError(e);
  }

  // HELPER METHOD FOR CATCHING SOCKET ERRORS
  catchSocketError() {
    showSnackbar(checkInternetConnection);
  }

  StreamController<String> controller = StreamController.broadcast();
  TroveApi(baseUrl) {
    dio.interceptors.add(DioInterceptor());
    dio.options.sendTimeout = 60000;
    dio.options.receiveTimeout = 60000;
    dio.options.baseUrl = baseUrl;
    log.i('Troved Api constructed and DIO setup register');
  }

  Future<dynamic> get(
    String string, {
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    log.i('Making request to $string');
    try {
      final response = await dio.get(string.toString(),
          queryParameters: queryParameters,
          options: token == null
              ? null
              : Options(headers: {'Authorization': 'Bearer $token'}));

      log.i('Response from $string \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      catchError(e);
    } on SocketException {
      catchSocketError();
    }
  }

  Future<dynamic> post(
    String string, {
    required Map<String, dynamic> body,
    String? token,
  }) async {
    log.i('Making request to $string');
    try {
      final response = await dio.post(string,
          data: body,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      log.i('raw log: $response');
      log.i('Response from $string \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      catchError(e);
    } on SocketException {
      catchSocketError();
    }
  }

  Future<dynamic> put(
    String string, {
    required Map<String, dynamic> body,
    String? token,
  }) async {
    log.i('Making request to $string');
    try {
      final response = await dio.put(string.toString(),
          data: body,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      log.i('Response from $string \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      catchError(e);
    } on SocketException {
      catchSocketError();
    }
  }

  /// -------------------------------------------------------------------------------------------

  /// THE API SERVICES

  /// LOGIN FLOW
  @override
  Future<dynamic> login(
      {required String email, required String password, token}) async {
    return await post("$baseUrl$loginPath",
        body: {
          "email": email,
          "password": password,
        },
        token: token);
  }

  @override
  Future<dynamic> signUp(
      {String? firstname,
      String? lastname,
      String? phonenumber,
      required String email,
      required String password,
      String? bankName,
      String? bankUsername,
      bankAccountNumber,
      String? dateOfBirth}) async {
    return await post(
      "$baseUrl$signupPath",
      body: {
        "first_name": firstname ?? '',
        "last_name": lastname ?? '',
        "phonenumber": phonenumber ?? '',
        "email": email,
        "password": password,
        "bank_name": bankName ?? '',
        "bank_username": bankUsername ?? '',
        "bank_account_number": bankAccountNumber ?? '0000000000',
        "date_of_birth":
            dateOfBirth ?? DateFormat('dd/MM/yyyy').format(DateTime.now())
      },
    );
  }

  /// CHANGE USER PASSWORD
  @override
  Future changeUserPassworSd(String id, String oldPasswprd, String newPassword,
      String confirmPassword) async {
    return await post(
      "$baseUrl$changePasswordPath$id/",
      body: {
        "old_password": oldPasswprd,
        "new_password": newPassword,
        "confirm_new_password": confirmPassword
      },
    );
  }

  @override
  Future fetchLoanHistory(String id, String token) async {
    try {
      final res = await dio.get(
        '$baseUrl$loanHistoryPath$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      log.i(res.data);
      return (res.data?['data'] as List)
          .map((e) => LoanHistoryModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      log.w(e.toString());
      handleApiError(e);
    }
  }

  @override
  Future fetchUserPortfolio(String id, String token) async {
    try {
      final res = await dio.get(
        '$baseUrl$fetchPortfolioPath$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      log.i(res.data);
      return (res.data?['data'] as List)
          .map((e) => UserPortfolio.fromJson(e))
          .toList();
    } on DioError catch (e) {
      log.w(e.toString());
      handleApiError(e);
    }
    return [];
  }

  @override
  Future<List<LoanModel>> getActiveLoans(String id, String token) async {
    try {
      final res = await dio.get(
        '$baseUrl$activeLoansPath$id/',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      log.i(res.data);
      return (res.data?['data'] as List)
          .map((e) => LoanModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      log.w(e.toString());
      handleApiError(e);
    }
    return [];
  }

  @override
  Future<ApiResponse?> patch(String path,
      {Map<String, dynamic>? body, String? token}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future requestLoan(
      String id, String amount, String duration, String token) async {
    return await post("$baseUrl$requestLoanPath$id/",
        body: {
          "amount": amount,
          "duration": duration,
        },
        token: token);
  }

  @override
  Future<dynamic> updateUserInfo(
      String id,
      String firstname,
      String lastname,
      String phonenumber,
      String bankName,
      String bankUsername,
      bankAccountNumber,
      String dateOfBirth,
      String token) async {
    return await put("$baseUrl$updateUserPath$id/",
        body: {
          "first_name": firstname,
          "last_name": lastname,
          "phonenumber": phonenumber,
          "bank_name": bankName,
          "bank_username": bankUsername,
          "bank_account_number": bankAccountNumber,
          "date_of_birth": dateOfBirth
        },
        token: token);
  }

  /// Basically send get requests
  @override
  void sendGetRequest(endpoint) async {
    final response = await dio.get(baseUrl + endpoint);
    jsonDecode(response.data);
  }

  @override
  Future sendPostRequest(body, endpoint) async {
    try {
      final response = await dio.post(
        baseUrl + endpoint,
        data: json.encode(body),
      );

      final result = response.data;
      return result;
    } on DioError catch (e) {
      handleApiError(e);
    }
  }

  //!Adjust the patch function as needed
  @override
  Future sendPatchRequest(body, endpoint, userId) async {
    try {
      final response =
          await dio.patch(baseUrl + endpoint, data: json.encode(body));
      final result = response.data;
      return result;
    } on DioError catch (e) {
      handleApiError(e);
    }
  }

  @override
  Failure handleApiError(DioError e) {
    if (e.type == DioErrorType.cancel) {
      return InputFailure(errorMessage: e.message);
    } else if (e.type == DioErrorType.connectTimeout) {
      return NetworkFailure();
    } else if (e.type == DioErrorType.receiveTimeout) {
      return NetworkFailure();
    } else if (e.type == DioErrorType.sendTimeout) {
      return NetworkFailure();
    } else if (e.type == DioErrorType.response) {
      return ServerFailure(error: e.message);
    } else if (e.type == DioErrorType.other) {
      return UnknownFailure();
    } else {
      return UnknownFailure();
    }
  }
}

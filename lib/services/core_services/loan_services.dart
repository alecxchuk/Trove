import 'package:trove/models/loan_model.dart';
import 'package:trove/services/core_services/trove_api.dart';
import 'package:trove/utils/constants/app_constants.dart';

class LoanServices {
  //api
  final TroveApi _api = TroveApi(baseUrl);

  //StreamController<User> userController = StreamController<User>();

  //
  Future<List<LoanModel>> getLoanHistory(String id, String token) async {
    var res = await _api.fetchLoanHistory(id, token);

    if (res?.data['data'] == null) {
      return [];
    }
    return (res?.data?['data'] as List)
        .map((e) => LoanModel.fromJson(e))
        .toList();
  }

  Future<List<LoanModel>> getActiveLoans(String id, String token) async {
    var res = await _api.getActiveLoans(id, token);
    return res;
  }

  Future<bool> requestLoan(
      String id, String amount, String duration, String token) async {
    var response = await _api.requestLoan(id, amount, duration, token);

    var success = false;

    if (response?.statusCode == 200) {
      success = true;
      var map = Map<String, dynamic>.from(response?.data['data']);
      // _loan = LoanModel.fromJson(map);
      //userController.add(_user!);
    }

    return success;
  }
}

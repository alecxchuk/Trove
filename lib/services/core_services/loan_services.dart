import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trove/models/loan_history.dart';
import 'package:trove/models/loan_model.dart';
import 'package:trove/services/core_services/trove_api.dart';
import 'package:trove/utils/constants/app_constants.dart';

class LoanServices {
  //api
  final TroveApi _api = TroveApi(baseUrl);

  StreamController<List<LoanHistoryModel>> loanController =
      StreamController<List<LoanHistoryModel>>();
  List<LoanHistoryModel> initial = [];
  //
  Future<List<LoanHistoryModel>> getLoanHistory(String id, String token) async {
    List<LoanHistoryModel> res = await _api.fetchLoanHistory(id, token);

    // if (res?.data['data'] == null) {
    //   return [];
    // }
    // return (res?.data?['data'] as List)
    //     .map((e) => LoanModel.fromJson(e))
    //     .toList();

    if (res != []) {
      loanController.add(res);
    }

    return res;
  }

  Future<List<LoanModel>> getActiveLoans(String id, String token) async {
    var res = await _api.getActiveLoans(id, token);
    return res;
  }

  Future<Map<String, dynamic>> requestLoan(
      String id, String amount, String duration, String token) async {
    var response = await _api.requestLoan(id, amount, duration, token);

    var success = false;
    Map<String, dynamic>? map;
    if (response?.statusCode == 201) {
      success = true;
      map = Map<String, dynamic>.from(response?.data['data']);
      debugPrint('zzaaz $map');
      var _loan = LoanModel.fromJson(map);
      //userController.add(_user!);
    }

    return {'success': success, 'res': map};
  }
}

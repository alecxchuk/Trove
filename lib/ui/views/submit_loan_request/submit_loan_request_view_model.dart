import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/app_services/dialog_service.dart';
import 'package:trove/services/app_services/user_service.dart';
import 'package:trove/services/core_services/loan_services.dart';
import 'package:trove/services/navigation_service.dart';
import 'package:trove/ui/views/base_widget/base_view_model.dart';

class SubmitLoanViewModel extends BaseModel {
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

  final LoanServices _loanService = serviceLocator<LoanServices>();

  final UserService _userService = serviceLocator<UserService>();

  final DialogService _dialogService = serviceLocator<DialogService>();

  List<String> banks = ['Access Bank', 'Uba Bank', 'Zenith Bank'];

  String _selectedBank = 'Access Bank';
  String get selectedBank => _selectedBank;

  String get userId => _userService.userId;

  String get token => _userService.authToken;

  selectBank(String bank) {
    _selectedBank = bank;
    notifyListeners();
  }

  nToLoanSuccessful() {
    _navigationService.navigateTo(Routes.loanSuccessful);
    notifyListeners();
  }

  nToDashBoard() {
    _navigationService.navigateTo(Routes.navBarView);
    notifyListeners();
  }

  requestLoan(String amount, String duration) async {
    var res = await _loanService.requestLoan(userId, amount, duration, token);
    if (res['success']) {
      nToLoanSuccessful();
    } else {
      //Future.delayed(Duration(seconds: 5), () {
      nToDashBoard();
      //});
    }
    notifyListeners();
  }
}

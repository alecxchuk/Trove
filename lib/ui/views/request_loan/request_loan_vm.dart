import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/navigation_service.dart';

class RequestLoanViewModel with ChangeNotifier {
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

  double _loanAmount = 100;
  double get loanAmount => _loanAmount;

  double _loanDuration = 6;
  double get loanDuration => _loanDuration;

  double _interest = 0;
  double get interest => _interest;

  double get totalDue => loanAmount + interest;

  setLoanAmount(amount) {
    _loanAmount = amount;
    _setInterest();
    notifyListeners();
  }

  setLoanDuration(time) {
    _loanDuration = time;
    _setInterest();
    notifyListeners();
  }

  _setInterest() {
    if (_loanDuration < 10) {
      _interest = 0.1 * _loanAmount;
    } else {
      _interest = 0.2 * _loanAmount;
    }

    notifyListeners();
  }

  // Navigation to Sign up page
  nToSubmitLoan() {
    _navigationService.navigateTo(Routes.submitLoan,
        arguments: SubmitLoanArguments(
            loanAmount.toStringAsFixed(2),
            loanDuration.toStringAsFixed(0),
            interest.toStringAsFixed(2),
            totalDue.toStringAsFixed(2)));
    notifyListeners();
  }
}

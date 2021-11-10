import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/navigation_service.dart';

class SubmitLoanViewModel with ChangeNotifier {
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();
  List<String> banks = ['Access Bank', 'Uba Bank', 'Zenith Bank'];

  String _selectedBank = 'Access Bank';
  String get selectedBank => _selectedBank;

  selectBank(String bank) {
    _selectedBank = bank;
    notifyListeners();
  }

  nToLoanSuccessful() {
    _navigationService.navigateTo(Routes.loanSuccessful);
    notifyListeners();
  }
}

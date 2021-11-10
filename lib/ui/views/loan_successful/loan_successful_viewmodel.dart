import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/navigation_service.dart';

class LoanSuccessfulViewModel with ChangeNotifier {
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

  nToDashBoard() {
    _navigationService.navigateTo(Routes.navBarView);
    notifyListeners();
  }
}

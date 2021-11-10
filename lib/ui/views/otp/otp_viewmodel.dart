import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/navigation_service.dart';

class OtpViewModel with ChangeNotifier {
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

  // Navigation to dashboard
  nToDashboard() {
    _navigationService.navigateTo(Routes.navBarView);
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/models/user_model.dart';
import 'package:trove/services/app_services/local_storage_service.dart';
import 'package:trove/services/app_services/user_service.dart';
import 'package:trove/services/core_services/authentication_service.dart';
import 'package:trove/services/core_services/trove_api.dart';
import 'package:trove/services/navigation_service.dart';
import 'package:trove/ui/views/base_widget/base_view_model.dart';
import 'package:trove/utils/constants/app_constants.dart';
import 'package:trove/utils/constants/storage_keys.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();
  final _storageService = serviceLocator<SharedPreferenceLocalStorage>();
  final _userService = serviceLocator<UserService>();
  final _authenticationService = serviceLocator<AuthenticationService>();

  final TroveApi _api = TroveApi(baseUrl);

  // Navigation to dashboard
  nToDashboard() {
    _navigationService.navigateTo(Routes.navBarView);
    notifyListeners();
  }

  // Navigation to Sign up page
  nToSignup() {
    _navigationService.navigateTo(Routes.signupView);
    notifyListeners();
  }

  // Navigation to dashboard
  nToCompleteProfile() {
    _navigationService.navigateTo(Routes.completeProfile);
    notifyListeners();
  }

  login(String email, String password) async {
    setBusy(true);
    var success = await _authenticationService.login(email, password);
    // var response = await _api.login(email: email, password: password);
    // //nToDashboard();
    // print('qqq:$response');
    // //saving user details to storage on request success
    // if (response?.statusCode == 201) {
    //   debugPrint('lola ${response.data['data']['userDetails']['id']}');
    //   debugPrint('lolaas ${response.data['data']['token']}');
    //   _storageService.setString(
    //     StorageKeys.currentSessionToken,
    //     response?.data['data']['token'],
    //   );
    //   _storageService.setString(
    //     StorageKeys.currentUserId,
    //     response?.data['data']['userDetails']['id'],
    //   );
    //   _storageService.setString(
    //     StorageKeys.currentUserEmail,
    //     response?.data['data']['userDetails']['email'],
    //   );
    //   var map =
    //       Map<String, dynamic>.from(response?.data['data']['userDetails']);
    //   final userModel = User.fromJson(map);
    //   _userService.setUserDetails(userModel);
    //   debugPrint('lolaas ${_userService.userEmail}');

    if (success) {
      nToDashboard();
    }

    //}
    setBusy(false);
  }
}

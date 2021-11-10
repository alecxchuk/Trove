import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/app_services/dialog_service.dart';
import 'package:trove/services/app_services/local_storage_service.dart';
import 'package:trove/services/app_services/snackbar_service.dart';
import 'package:trove/services/core_services/trove_api.dart';
import 'package:trove/services/navigation_service.dart';
import 'package:trove/ui/views/base_widget/base_view_model.dart';
import 'package:trove/utils/constants/app_constants.dart';
import 'package:trove/utils/constants/app_strings.dart';
import 'package:trove/utils/constants/storage_keys.dart';
import 'package:trove/utils/enums.dart';

class SignupViewModel extends BaseModel {
  final storage = serviceLocator<SharedPreferenceLocalStorage>();
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();
  final _snackService = serviceLocator<SnackbarService>();
  final _dialogService = serviceLocator<DialogService>();

  //Api
  final TroveApi _api = TroveApi(baseUrl);
  // Navigation to dashboard
  nToDashboard() {
    _navigationService.navigateTo(Routes.navBarView);
    notifyListeners();
  }

  // Navigation to login page
  nToLogin() {
    _navigationService.navigateTo(Routes.loginView);
    notifyListeners();
  }

  nToOtp() {
    _navigationService.navigateTo(Routes.otpView);
    notifyListeners();
  }

  signup(String email, String password) async {
    setBusy(true);
    // Api call
    var response = await _api.signUp(email: email, password: password);
    print('xxxzz:$response');
    if (response?.statusCode == 201) {
      //_snackService.showSnackbar(content: signupMessage);

      storage.setString(StorageKeys.currentUserEmail, email);
      nToLogin();
    } else {
      // _snackService.showSnackbar(
      //     content: signupMessage, variant: SnackbarType.failure);
      setBusy(false);
    }
  }

  Future doThings() async {
    print('dialog called');
    var dialogResult = await _dialogService.showDialog();
    print('dialog closed');
  }
}

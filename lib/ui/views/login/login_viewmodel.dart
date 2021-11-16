import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/app_services/user_service.dart';
import 'package:trove/services/core_services/authentication_service.dart';
import 'package:trove/services/navigation_service.dart';
import 'package:trove/ui/views/base_widget/base_view_model.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();
  final _userService = serviceLocator<UserService>();
  final _authenticationService = serviceLocator<AuthenticationService>();

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

  // Navigation to complete profile
  nToCompleteProfile() {
    _navigationService.navigateTo(Routes.completeProfile);
    notifyListeners();
  }

  login(String email, String password) async {
    setBusy(true);
    var res = await _authenticationService.login(email, password);

    if (res['success'] == true && res['verified'] == true) {
      String token = res['token'];
      _userService.setUserDetails(_authenticationService.user, token);
      nToDashboard();
    } else {
      nToCompleteProfile();
    }

    setBusy(false);
  }
}

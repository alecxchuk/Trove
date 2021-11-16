import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/app_services/user_service.dart';
import 'package:trove/services/navigation_service.dart';
import 'package:trove/ui/views/base_widget/base_view_model.dart';

class ProfileVm extends BaseModel {
  final _userService = serviceLocator<UserService>();
  final _navigationService = serviceLocator<NavigationService>();

  nToLogin() {
    _navigationService.popAndPush(Routes.loginView);
    notifyListeners();
  }

  logout() {
    _userService.clearData();
    nToLogin();
    notifyListeners();
  }
}

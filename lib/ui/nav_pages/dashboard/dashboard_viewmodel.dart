import 'dart:async';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/app_services/user_service.dart';
import 'package:trove/services/core_services/portfolio_service.dart';
import 'package:trove/services/navigation_service.dart';
import 'package:trove/ui/views/base_widget/base_view_model.dart';

class DashboardViewModel extends BaseModel {
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

  final _userService = serviceLocator<UserService>();
  final PortfolioService _portfolioService = serviceLocator<PortfolioService>();
  int _index = 1;
  int get index => _index;

  // Navigation to request loan
  nToRequestLoan() {
    _navigationService.navigateTo(Routes.requestLoan);
    notifyListeners();
  }

  init() async {
    // TODO
    setBusy(true);
    await _portfolioService.fetchUserPortfolio(
        _userService.userId, _userService.authToken);
    setBusy(false);
    Timer.periodic(const Duration(seconds: 2), (Timer t) {
      final isLastIndex = index == 2 - 1;

      _index = isLastIndex ? 0 : index + 1;
    });
    notifyListeners();
  }
}

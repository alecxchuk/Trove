import 'package:trove/app/app.locator.dart';
import 'package:trove/services/app_services/user_service.dart';
import 'package:trove/services/core_services/loan_services.dart';
import 'package:trove/ui/views/base_widget/base_view_model.dart';

class LoanActivityVm extends BaseModel {
  final _userService = serviceLocator<UserService>();

  final _loanService = serviceLocator<LoanServices>();

  init() async {
    await _loanService.getLoanHistory(
        _userService.userDetails!.id!, _userService.authToken);
  }
}

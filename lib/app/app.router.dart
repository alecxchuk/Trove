import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trove/ui/nav_pages/dashboard/dashboard.dart';
import 'package:trove/ui/nav_pages/loan_activity/loan_activity.dart';
import 'package:trove/ui/nav_pages/nav_bar/nav_bar.dart';
import 'package:trove/ui/nav_pages/profile_page/profile_page.dart';
import 'package:trove/ui/views/complete_profile/complete_profile_page.dart';
import 'package:trove/ui/views/loan_successful/loan_successful.dart';
import 'package:trove/ui/views/login/login.dart';
import 'package:trove/ui/views/my_assets/my_assets.dart';
import 'package:trove/ui/views/otp/otp_view.dart';
import 'package:trove/ui/views/recover_password/recover_password.dart';
import 'package:trove/ui/views/request_loan/request_a_loan.dart';
import 'package:trove/ui/views/signup/signup.dart';
import 'package:trove/ui/views/splashview/splashview.dart';
import 'package:trove/ui/views/submit_loan_request/submit_loan_request.dart';

class Routes {
  // This file contains all the routing constants used within the app
  static const String splashView = '/';
  static const String loginView = '/login';
  static const String signupView = '/register';
  static const String recoverPasswordView = '/recover-password';
  static const String otpView = '/otp';
  static const String dashboard = '/dashboard';
  static const String navBarView = '/navbar';
  static const String requestLoan = '/request-loan';
  static const String submitLoan = '/submit-loan';
  static const String loanSuccessful = 'loan-success';
  static const String profilePage = 'profile-page';
  static const String loanActivity = 'loan-activity';
  static const String completeProfile = 'complete-profile';
  static const String myAssets = 'my-assets';
}

class AppRouter {
  // Router(this.context);
  // BuildContext context;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final UserProvider userProvider = Provider.of<UserProvider>(context);
    // userProvider.isLogged();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.signupView:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case Routes.recoverPasswordView:
        return MaterialPageRoute(builder: (_) => const RecoverPassword());
      case Routes.otpView:
        return MaterialPageRoute(builder: (_) => Otp());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case Routes.navBarView:
        return MaterialPageRoute(builder: (_) => const NavBar());
      case Routes.requestLoan:
        return MaterialPageRoute(builder: (_) => RequestLoan());
      case Routes.submitLoan:
        var args = settings.arguments as SubmitLoanArguments;
        return MaterialPageRoute(
            builder: (_) => SubmitLoan(
                loanAmount: args.loanAmount,
                loanDuration: args.loanDuration,
                totalDue: args.totalDue,
                interest: args.interest));
      case Routes.loanSuccessful:
        return MaterialPageRoute(builder: (_) => LoanSuccessful());
      case Routes.profilePage:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case Routes.loanActivity:
        return MaterialPageRoute(builder: (_) => const LoanActivity());
      case Routes.completeProfile:
        return MaterialPageRoute(builder: (_) => CompleteProfilePage());
      // case Routes.myAssets:
      //   return MaterialPageRoute(builder: (_) => MyAssets());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

class SubmitLoanArguments {
  final String loanAmount;
  final String loanDuration;
  final String interest;
  final String totalDue;

  SubmitLoanArguments(
      this.loanAmount, this.loanDuration, this.interest, this.totalDue);
}

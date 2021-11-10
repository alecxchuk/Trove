import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/managers/snackbar_manager.dart';
import 'package:trove/models/loan_model.dart';
import 'package:trove/models/user_portfolio.dart';
import 'package:trove/services/core_services/loan_services.dart';
import 'package:trove/services/core_services/portfolio_service.dart';
import 'package:trove/ui/views/complete_profile/complete_profile_page_viewmodel.dart';
import 'package:trove/ui/views/request_loan/request_loan_vm.dart';
import 'package:trove/utils/enums.dart';

import 'managers/dialog.dart';
import 'models/loan_history.dart';
import 'models/user_model.dart';
import 'services/connectivity_service.dart';
import 'services/core_services/authentication_service.dart';
import 'services/navigation_service.dart';
import 'ui/nav_pages/dashboard/dashboard_viewmodel.dart';
import 'ui/views/loan_successful/loan_successful_viewmodel.dart';
import 'ui/views/login/login_viewmodel.dart';
import 'ui/views/otp/otp_viewmodel.dart';
import 'ui/views/signup/signup_viewmodel.dart';
import 'ui/views/submit_loan_request/submit_loan_request_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider(create: (_) => RequestLoanViewModel()),
      // ChangeNotifierProvider(create: (_) => CompleteProfileViewModel()),
      // ChangeNotifierProvider(create: (_) => LoginViewModel()),
      // ChangeNotifierProvider(create: (_) => SignupViewModel()),
      // ChangeNotifierProvider(create: (_) => OtpViewModel()),
      ChangeNotifierProvider(create: (_) => DashboardViewModel()),
      // ChangeNotifierProvider(create: (_) => LoanSuccessfulViewModel()),
      // ChangeNotifierProvider(create: (_) => SubmitLoanViewModel()),
      // ChangeNotifierProvider(create: (_) => RequestLoanViewModel()),
      StreamProvider<ConnectivityStatus>(
        create: (BuildContext context) => serviceLocator<ConnectivityService>()
            .connectionChange, // ConnectivityService().connectionStatusController.stream,
        initialData: ConnectivityStatus.offline,
      ),
      StreamProvider<User>(
        initialData: User.initial(),
        create: (BuildContext context) =>
            serviceLocator<AuthenticationService>().userController.stream,
      ),
      StreamProvider<List<LoanHistoryModel>>(
        initialData: LoanServices().initial,
        create: (BuildContext context) =>
            serviceLocator<LoanServices>().loanController.stream,
      ),
      StreamProvider<List<UserPortfolio>>(
        initialData: PortfolioService().initial,
        create: (BuildContext context) =>
            serviceLocator<PortfolioService>().userController.stream,
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: serviceLocator<NavigationService>().navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashView,
      onGenerateRoute: AppRouter.generateRoute,
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(
            child: widget!,
          ),
        ),
      ),
    );
  }
}

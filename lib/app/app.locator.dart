import 'package:get_it/get_it.dart';
import 'package:trove/services/app_services/dialog_service.dart';
import 'package:trove/services/app_services/local_storage_service.dart';
import 'package:trove/services/app_services/snackbar_service.dart';
import 'package:trove/services/app_services/user_service.dart';
import 'package:trove/services/connectivity_service.dart';
import 'package:trove/services/core_services/authentication_service.dart';
import 'package:trove/services/core_services/loan_services.dart';
import 'package:trove/services/core_services/portfolio_service.dart';
import 'package:trove/services/core_services/prodile_service.dart';
import 'package:trove/services/navigation_service.dart';
import 'package:trove/ui/nav_pages/dashboard/dashboard_viewmodel.dart';
import 'package:trove/ui/nav_pages/loan_activity/loan_activity_vm.dart';
import 'package:trove/ui/nav_pages/profile_page/profile_vm.dart';
import 'package:trove/ui/views/complete_profile/complete_profile_page_viewmodel.dart';
import 'package:trove/ui/views/loan_successful/loan_successful_viewmodel.dart';
import 'package:trove/ui/views/login/login_viewmodel.dart';
import 'package:trove/ui/views/otp/otp_viewmodel.dart';
import 'package:trove/ui/views/request_loan/request_loan_vm.dart';
import 'package:trove/ui/views/signup/signup_viewmodel.dart';
import 'package:trove/ui/views/splashview/splash_vm.dart';
import 'package:trove/ui/views/submit_loan_request/submit_loan_request_view_model.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  serviceLocator.registerFactory<CompleteProfileViewModel>(
      () => CompleteProfileViewModel());
  serviceLocator.registerFactory<LoginViewModel>(() => LoginViewModel());
  serviceLocator.registerFactory<SignupViewModel>(() => SignupViewModel());
  serviceLocator.registerFactory<OtpViewModel>(() => OtpViewModel());
  serviceLocator
      .registerFactory<DashboardViewModel>(() => DashboardViewModel());

  serviceLocator.registerFactory<LoanSuccessfulViewModel>(
      () => LoanSuccessfulViewModel());
  serviceLocator
      .registerFactory<RequestLoanViewModel>(() => RequestLoanViewModel());
  serviceLocator
      .registerFactory<SubmitLoanViewModel>(() => SubmitLoanViewModel());
  serviceLocator.registerFactory<LoanActivityVm>(() => LoanActivityVm());
  serviceLocator.registerFactory<SplashVm>(() => SplashVm());
  serviceLocator.registerFactory<ProfileVm>(() => ProfileVm());

  serviceLocator.registerLazySingleton(() => NavigationService());
  serviceLocator.registerLazySingleton(() => ConnectivityService());

  serviceLocator.registerLazySingleton(() => DialogService());
  serviceLocator.registerLazySingleton(() => SnackbarService());
  serviceLocator.registerLazySingleton(() => UserService());
  serviceLocator.registerLazySingleton(() => AuthenticationService());
  serviceLocator.registerLazySingleton(() => ProfileService());
  serviceLocator.registerLazySingleton(() => LoanServices());
  serviceLocator.registerLazySingleton(() => PortfolioService());

  final sharedPreferenceLocalStorage =
      await SharedPreferenceLocalStorage.getInstance();
  serviceLocator.registerSingleton(sharedPreferenceLocalStorage);

  //serviceLocator.registerFactory<ApiService>(() => ApiService());
}

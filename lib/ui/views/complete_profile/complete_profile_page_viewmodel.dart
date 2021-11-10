import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/app_services/user_service.dart';
import 'package:trove/services/core_services/prodile_service.dart';
import 'package:trove/services/navigation_service.dart';
import 'package:trove/ui/views/base_widget/base_view_model.dart';

class CompleteProfileViewModel extends BaseModel {
  final _userService = serviceLocator<UserService>();

  final _profileService = serviceLocator<ProfileService>();
  final _navigationService = serviceLocator<NavigationService>();

  List<String> banks = ['Access Bank', 'Uba Bank', 'Zenith Bank'];

  String _bank = 'Access Bank';
  String get bank => _bank;

  String _gender = 'Female';
  String get gender => _gender;

  bool _showDatePicker = false;
  bool get showDatePicker => _showDatePicker;

  String _selectedDate = 'dd/mm/yyyy';
  String get selectedDate => _selectedDate;

  int _currentStep = 0;
  int get currentStep => _currentStep;

  String get token => _userService.authToken;

  setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  toggleDatePickerVisibility() {
    debugPrint('adfn');
    _showDatePicker = !_showDatePicker;
    notifyListeners();
  }

  setStep(step) {
    _currentStep = step;
    notifyListeners();
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  selectDate(String date) {
    _selectedDate = convertDateTimeDisplay(date);
    debugPrint(_selectedDate);
    notifyListeners();
  }

  selectBank(String bank) {
    _bank = bank;
    notifyListeners();
  }

  String _userId() {
    return _userService.userId;
  }

  nToDashboard() {
    _navigationService.navigateTo(Routes.navBarView);
  }

  Future<bool> updateProfile(firstname, lastname, phonenumber, bankName,
      bankUsername, bankAccountNumber, dateOfBirth) async {
    setBusy(true);
    String id = _userId();

    var success = await _profileService.updateProfile(
        id,
        firstname,
        lastname,
        phonenumber,
        bankName,
        bankUsername,
        bankAccountNumber,
        dateOfBirth,
        token);

    if (success) {
      var user = _profileService.user;
      _userService.setUserDetails(user);
    }
    setBusy(false);
    return success;
  }
}

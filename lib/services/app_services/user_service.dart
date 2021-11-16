//On login or signup the user service is used to save all the user details
import 'dart:convert';

import 'package:trove/app/app.locator.dart';
import 'package:trove/models/user_model.dart';
import 'package:trove/services/app_services/local_storage_service.dart';
import 'package:trove/utils/constants/storage_keys.dart';

///This class dont do anything special than calling the local storage
///And returning the data that is saved, you can choose to use it or
///get the data to local storage yourself
class UserService {
  bool? get hasUser => null;
  final _sharedPrefs = serviceLocator<SharedPreferenceLocalStorage>();

  //All this are the current user details to be used
  String _bankName = '';
  String __bankAccountNumber = '';
  String _bankUsername = '';
  String _firstName = '';
  String _lastName = '';
  String _authToken = '';
  String _userId = '';
  String _userEmail = '';

  ///This will give you null because organization data has not been added
  User? userModel;

  ///From the organization side bar set the current organissation Id
  ///and get it anywhere in the app using these getter
  String get bankName {
    _bankName = _sharedPrefs.getString(StorageKeys.bankName) ?? '';
    //You can perform other function before returning
    return _bankName;
  }

  String get bankAccountNumber {
    __bankAccountNumber =
        _sharedPrefs.getString(StorageKeys.bankAccountNumber) ?? '';
    //You can perform other function before returning
    return __bankAccountNumber;
  }

  String get bankUsername {
    _bankUsername = _sharedPrefs.getString(StorageKeys.bankUsername) ?? '';
    //You can perform other function before returning
    return _bankUsername;
  }

  String get lastName {
    _lastName = _sharedPrefs.getString(StorageKeys.lastName) ?? '';
    //You can perform other function before returning
    return _lastName;
  }

  String get firstName {
    _firstName = _sharedPrefs.getString(StorageKeys.firstName) ?? '';
    //You can perform other function before returning
    return _firstName;
  }

  void setUserDetails(User user, [String? _authToken]) {
    final val = jsonEncode(user.toMap());
    _sharedPrefs.setString(StorageKeys.currentUserModel, val);
    _sharedPrefs.setString(StorageKeys.currentSessionToken, _authToken ?? '');
  }

  ///Get the token on app launch and to know if the user has
  ///formerly been loggen in. Show the home page instead of login view
  String get authToken {
    _authToken = _sharedPrefs.getString(StorageKeys.currentSessionToken) ?? '';
    //You can perform other function before returning
    return _authToken;
  }

  String get userId {
    _userId = _sharedPrefs.getString(StorageKeys.currentUserId) ?? '';
    //You can perform other function before returning
    return _userId;
  }

  String get memberId {
    _userId = _sharedPrefs.getString(StorageKeys.idInOrganization) ?? '';
    //You can perform other function before returning
    return _userId;
  }

  String get userEmail {
    _userEmail = _sharedPrefs.getString(StorageKeys.currentUserEmail) ?? '';
    //You can perform other function before returning
    return _userEmail;
  }

  User? get userDetails {
    final res = _sharedPrefs.getString(StorageKeys.currentUserModel);
    if (res == null) {
      return null;
    }
    return User.fromJson(jsonDecode(res));
  }

  void setUserAndToken({
    required String? authToken,
    required String? userId,
    required String? userEmail,
  }) {
    //TODO: throw error for null parameters
    _authToken = authToken ?? '';
    _userId = userId ?? '';
    _userEmail = userEmail ?? '';

    _sharedPrefs.setString(StorageKeys.currentUserEmail, _userEmail);
    _sharedPrefs.setString(StorageKeys.currentSessionToken, _authToken);
    _sharedPrefs.setString(StorageKeys.currentUserId, _userId);
  }

  void clearData() {
    _sharedPrefs.clearStorage();
  }
}

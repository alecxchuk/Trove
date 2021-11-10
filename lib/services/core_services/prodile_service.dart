import 'dart:async';

import 'package:trove/models/user_model.dart';
import 'package:trove/services/core_services/trove_api.dart';
import 'package:trove/utils/constants/app_constants.dart';

class ProfileService {
  final TroveApi _api = TroveApi(baseUrl);

  StreamController<User> userController = StreamController<User>();

  User? _user;
  User get user => _user!;

  Future<bool> updateProfile(
      String id,
      String firstname,
      String lastname,
      String phonenumber,
      String bankName,
      String bankUsername,
      String bankAccountNumber,
      String dateOfBirth,
      String token) async {
    var fetchedUser = await _api.updateUserInfo(
        id,
        firstname,
        lastname,
        phonenumber,
        bankName,
        bankUsername,
        bankAccountNumber,
        dateOfBirth,
        token);

    var hasUser = false;

    if (fetchedUser?.statusCode == 201) {
      hasUser = true;
      var map = Map<String, dynamic>.from(fetchedUser?.data['data']);
      _user = User.fromJson(map);
      userController.add(_user!);
    }

    return hasUser;
  }
}

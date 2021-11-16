import 'dart:async';

import 'package:trove/models/user_model.dart';
import 'package:trove/services/core_services/trove_api.dart';
import 'package:trove/utils/constants/app_constants.dart';

class AuthenticationService {
  final TroveApi _api = TroveApi(baseUrl);

  StreamController<User> userController = StreamController<User>();

  User? _user;
  User get user => _user!;

  /// Login
  Future<Map<String, dynamic>> login(String email, String password) async {
    var fetchedUser = await _api.login(email: email, password: password);

    var hasUser = fetchedUser != null;
    Map<String, dynamic> res = {};

    if (fetchedUser?.statusCode == 201) {
      var map =
          Map<String, dynamic>.from(fetchedUser?.data['data']['userDetails']);
      _user = User.fromJson(map);
      userController.add(_user!);

      res = {
        'success': hasUser,
        'verified': _user!.firstName!.isNotEmpty,
        'data': _user,
        'token': fetchedUser?.data['data']['token']
      };
    }

    return res;
  }
}

import 'dart:async';

import 'package:trove/models/user_model.dart';
import 'package:trove/services/core_services/trove_api.dart';
import 'package:trove/utils/constants/app_constants.dart';

class AuthenticationService {
  final TroveApi _api = TroveApi(baseUrl);

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(String email, String password) async {
    var fetchedUser = await _api.login(email: email, password: password);

    var hasUser = fetchedUser != null;

    if (fetchedUser?.statusCode == 201) {
      var map =
          Map<String, dynamic>.from(fetchedUser?.data['data']['userDetails']);
      final userModel = User.fromJson(map);
      userController.add(userModel);
    }

    return hasUser;
  }
}

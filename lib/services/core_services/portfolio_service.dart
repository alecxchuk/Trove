import 'dart:async';

import 'package:trove/models/user_portfolio.dart';
import 'package:trove/services/core_services/trove_api.dart';
import 'package:trove/utils/constants/app_constants.dart';

class PortfolioService {
  final TroveApi _api = TroveApi(baseUrl);

  List<UserPortfolio> initial = [];
  StreamController<List<UserPortfolio>> userController =
      StreamController<List<UserPortfolio>>();

  Future<List<UserPortfolio>> fetchUserPortfolio(
      String? id, String token) async {
    var res = await _api.fetchUserPortfolio(id!, token);

    if (res.isNotEmpty) {
      userController.add(res);
    }
    return res;
  }
}

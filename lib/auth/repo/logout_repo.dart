import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/logout_model.dart';
import '../../core/helper/network_utils.dart';
import '../../core/extensions/string.dart';

class LogoutRepo {
  static Future<LogoutModel?> logout(context) async {
    final util = NetworkUtil();

    var response = await util.post(
      'logout',
      context: context,
    );
    if (response == null) {
      return null;
    }
    if (response.statusCode! >= 500) {
      throw LaravelException(
          '${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}');
    }

    var model = LogoutModel.fromJson(response.data);

    return model;
  }
}

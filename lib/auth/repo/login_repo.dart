import 'package:dio/dio.dart';

import '../../core/helper/network_utils.dart';
import '../model/register_model.dart';
import '../model/login_model.dart';

class LoginRepo {
  static Future<UserAuthModel?> loginUser(
    context, {
    required Map<String, dynamic> body,
  }) async {
    final _util = NetworkUtil();

    var response = await _util.post(
      'login',
      context: context,
      withHeader: true,
      body: FormData.fromMap(body),
    );
    if (response == null) {
      return null;
    }
    var model = UserAuthModel.fromJson(response.data);

    return model;
  }
}

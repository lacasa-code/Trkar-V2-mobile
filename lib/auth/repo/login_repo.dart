import 'package:dio/dio.dart';

import '../../core/helper/network_utils.dart';
import '../model/login_model.dart';

class LoginRepo {
  static Future<LoginModel?> loginUser(
    context, {
    required Map<String, dynamic> body,
  }) async {
    final _util = NetworkUtil();

    var response = await _util.post(
      'user/login',
      context: context,
      withHeader: true,
      body: FormData.fromMap(body),
    );
    if (response == null) {
      return null;
    }
    var model = LoginModel.fromJson(response.data);

    return model;
  }
}

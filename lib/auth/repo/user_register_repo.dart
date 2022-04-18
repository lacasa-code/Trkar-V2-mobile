import 'package:dio/dio.dart';

import '../model/register_model.dart';
import '../../core/helper/network_utils.dart';

class UserRegisterRepo {
  static Future<UserRegisterModel?> registerUser(
    context, {
    required Map<String, dynamic> body,
  }) async {
    final _util = NetworkUtil();

    var response = await _util.post(
      'user/register',
      context: context,
      withHeader: true,
      body: FormData.fromMap(body),
    );
    if (response == null) {
      return null;
    }
    var model = UserRegisterModel.fromJson(response.data);
    return model;
  }
}

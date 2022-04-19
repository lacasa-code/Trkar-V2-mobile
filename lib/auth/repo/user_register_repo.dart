import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/register_model.dart';
import '../../core/helper/network_utils.dart';

class UserRegisterRepo {
  static Future<UserAuthModel?> registerUser(
    context, {
    required Map<String, dynamic> body,
  }) async {
    final _util = NetworkUtil();

    var response = await _util.post(
      'register',
      context: context,
      withHeader: true,
      body: FormData.fromMap(body),
    );
    if (response == null) {
      return null;
    }
    dynamic data = response.data.runtimeType == String
        ? jsonDecode(response.data)
        : response.data;
    var model = UserAuthModel.fromJson(data);
    return model;
  }
}

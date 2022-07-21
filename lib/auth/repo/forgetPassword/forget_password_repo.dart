import 'dart:developer';

import '../../model/confirm_code_model.dart';
import '../../../core/helper/network_utils.dart';

class ForgetPasswordRepo {
  static Future<ConfirmCodeModel?> forgetPassword(
    context, {
    required String email,
  }) async {
    final util = NetworkUtil();

    log('http://trkar-v2.lacasacode.com/api/forget/password/$email');
    var response = await util.get(
      'forget/password/${email.trim()}',
      context: context,
    );
    if (response == null) {
      return null;
    }

    var model = ConfirmCodeModel.fromJson(response.data);

    return model;
  }
}

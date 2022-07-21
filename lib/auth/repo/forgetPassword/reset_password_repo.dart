import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/laravel_exception.dart';

import '../../model/confirm_code_model.dart';
import '../../../core/helper/network_utils.dart';
import '../../../core/extensions/string.dart';

class ResetPasswordRepo {
  static Future<ConfirmCodeModel?> reset(
    context, {
    required String email,
    required Map<String, dynamic> body,
  }) async {
    final util = NetworkUtil();
    log('resetPasswordUrl=> ${'${Helper.userTypeToVerification == 'customer' ? '' : 'vendor/'}reset/password/$email'}');
    var response = await util.post(
      '${Helper.userTypeToVerification == 'customer' ? '' : 'vendor/'}reset/password/$email',
      body: FormData.fromMap(body),
      context: context,
    );

    if (response == null) {
      return null;
    }
    if ((response.statusCode ?? 0) >= 500) {
      throw LaravelException(
        '${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}',
      );
    }

    var model = ConfirmCodeModel.fromJson(response.data);

    return model;
  }
}

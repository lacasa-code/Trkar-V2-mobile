import 'package:dio/dio.dart';
import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/update_user_profile_model.dart';
import '../../core/helper/network_utils.dart';
import '../../core/extensions/string.dart';

class UpdateUserPasswordRepo {
  static Future<UpdateUserProfileModel?> updatePassword(context,
      {required Map<String, dynamic> body}) async {
    final util = NetworkUtil();
    var response = await util.post(
      'update/password',
      context: context,
      body: FormData.fromMap(body),
    );
    if (response == null) {
      return null;
    }
    if (response.statusCode! >= 500) {
      throw LaravelException(
        '${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}',
      );
    }
    var model = UpdateUserProfileModel.fromJson(response.data);

    return model;
  }
}

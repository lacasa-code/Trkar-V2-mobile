import 'package:dio/dio.dart';
import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/add_product_tag_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/network_utils.dart';

class AddProductTagRepo {
  static Future<AddProductTagModel?> addTag(
    context, {
    required Map<String, dynamic> body,
  }) async {
    final util = NetworkUtil();

    var response = await util.post(
      'create/product/tag',
      context: context,
      body: FormData.fromMap(
        body,
      ),
    );

    if (response == null) {
      return null;
    }
    if (response.statusCode == 404 || (response.statusCode ?? 0) >= 500) {
      throw LaravelException(
        '${'something_wrong'.translate} \nSTATUS_CODE: ${response.statusCode}',
      );
    }
    try {
      var model = AddProductTagModel.fromJson(response.data);

      return model;
    } catch (err) {
      throw LaravelException(
        '${'something_wrong'.translate} \n${err.toString()}',
      );
    }
  }
}

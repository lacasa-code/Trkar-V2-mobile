import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/add_product_compatible_models_model.dart';
import '../../../core/helper/network_utils.dart';
import '../../../core/helper/laravel_exception.dart';
import '../../../core/extensions/string.dart';

class AddProductCompatibleModelsRepo {
  static Future<AddProductCompatibleModelsModel?> addCompatibleModels(
    context, {
    required Map<String, dynamic> body,
  }) async {
    log('compatibleModelsBody=> $body');
    final util = NetworkUtil();

    var response = await util.post(
      'create/product/comp',
      context: context,
      body: FormData.fromMap(body),
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
      var model = AddProductCompatibleModelsModel.fromJson(response.data);

      return model;
    } catch (e) {
      throw LaravelException(
        '${'something_wrong'.translate} \n${e.toString()}}',
      );
    }
  }
}

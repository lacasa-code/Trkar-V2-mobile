import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/create_product_model.dart';
import '../../../core/helper/network_utils.dart';
import '../../../core/extensions/string.dart';

class CreateProductRepo {
  static Future<CreateProductModel?> createNewProduct(
    context, {
    required Map<String, dynamic> body,
    int? productId,
  }) async {
    log('createProductData=>$body');
    final util = NetworkUtil();

    var response = await util.post(
      productId == null ? 'create/product' : 'update/product/$productId',
      context: context,
      body: FormData.fromMap(body),
    );
    if (response == null) {
      return null;
    }

    try {
      var model = CreateProductModel.fromJson(response.data);

      return model;
    } catch (e) {
      throw LaravelException(
          '${'something_wrong'.translate} \n${e.toString()}');
    }
  }
}

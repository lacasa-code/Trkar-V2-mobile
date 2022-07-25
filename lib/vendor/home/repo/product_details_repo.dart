import 'dart:developer';

import '../model/product_details_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/laravel_exception.dart';
import '../../../core/helper/network_utils.dart';

class ProductDetailsRepo {
  static Future<ProductDetailsModel?> getProductDetails(
    context, {
    int? productId,
  }) async {
    final util = NetworkUtil();

    var response = await util.get(
      'product/details/$productId',
      context: context,
    );
    if (response == null) {
      return null;
    }
    if (response.statusCode == 404 || (response.statusCode ?? 0) >= 500) {
      log('message fromSTATUS_CODE ${response.statusCode}');
      throw LaravelException(
        '${'something_wrong'.translate} \nSTATUS_CODE: ${response.statusCode}',
      );
    }
    try {
      var model = ProductDetailsModel.fromJson(response.data);
      return model;
    } catch (e) {
      log('message fromError ${e.toString()}');

      throw LaravelException(
        '${'something_wrong'.translate} \n${e.toString()}',
      );
    }
  }
}

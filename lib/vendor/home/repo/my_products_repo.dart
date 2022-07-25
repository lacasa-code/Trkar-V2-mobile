import 'dart:developer';

import '../model/my_products_model.dart';
import '../../../core/helper/network_utils.dart';
import '../../../core/helper/laravel_exception.dart';
import '../../../core/extensions/string.dart';

class MyProductsRepo {
  static Future<MyProductsModel?> getMyProducts(
    context,
  ) async {
    final util = NetworkUtil();

    var response = await util.get(
      'vendor/product',
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
      var model = MyProductsModel.fromJson(response.data);
      return model;
    } catch (e) {
      log('message fromError ${e.toString()}');

      throw LaravelException(
        '${'something_wrong'.translate} \n${e.toString()}',
      );
    }
  }
}

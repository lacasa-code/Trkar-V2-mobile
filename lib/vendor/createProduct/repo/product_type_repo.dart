import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/product_type_model.dart';
import '../../../core/helper/network_utils.dart';
import '../../../core/extensions/string.dart';

class ProductTypeRepo {
  static Future<ProductTypeModel?> getProductsType(context) async {
    final util = NetworkUtil();

    var response = await util.get(
      'product/types',
      context: context,
    );
    if (response == null) {
      return null;
    }

    try {
      var model = ProductTypeModel.fromJson(response.data);
      return model;
    } catch (e) {
      throw LaravelException(
        'something_wrong'.translate,
      );
    }
  }
}

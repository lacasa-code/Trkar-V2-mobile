import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/categories_model.dart';
import '../../core/helper/network_utils.dart';
import '../../core/extensions/string.dart';

class CategoriesRepo {
  static Future<CategoriesModel?> getCategories(
    context, {
    bool allCategories = false,
  }) async {
    final util = NetworkUtil();

    var response = await util.get(
      allCategories ? 'categories' : 'main/categories',
      context: context,
    );
    if (response == null) {
      return null;
    }
    if (response.statusCode! >= 500) {
      throw LaravelException(
        '${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}',
      );
    }
    var model = CategoriesModel.fromJson(response.data);
    return model;
  }
}

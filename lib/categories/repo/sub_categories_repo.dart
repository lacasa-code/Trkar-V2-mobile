import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/sub_categories_model.dart';
import '../../core/helper/network_utils.dart';
import '../../core/extensions/string.dart';

class SubCategoriesRepo {
  static Future<SubCategoriesModel?> getSubCategories(
    context,
    {parentId,}
  ) async {
    final util = NetworkUtil();

    var response = await util.get(
      'subcategories/$parentId',
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
    var model = SubCategoriesModel.fromJson(response.data);
    return model;
  }
}

import '../model/parent_of_sub_category_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/laravel_exception.dart';
import '../../../core/helper/network_utils.dart';

class ParentOfSubCategoryRepo {
  static Future<ParentsOfSubCategoryModel?> getParentOfSubCategory(
    context, {
    int? subcategoryId,
  }) async {
    final utils = NetworkUtil();

    var response = await utils.get(
      'parents/$subcategoryId',
      context: context,
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
      var model = ParentsOfSubCategoryModel.fromJson(response.data);

      return model;
    } catch (e) {
      throw LaravelException(
        '${'something_wrong'.translate} \n${e.toString()}',
      );
    }
  }
}

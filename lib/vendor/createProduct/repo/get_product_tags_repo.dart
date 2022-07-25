import '../model/get_product_tags_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/laravel_exception.dart';
import '../../../core/helper/network_utils.dart';

class GetProductTagsRepo {
  static Future<GetProductTagsModel?> getProductTagsModel(
    context, {
    int? productId,
  }) async {
    final utils = NetworkUtil();

    var response = await utils.get(
      'product/tag/$productId',
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
      var model = GetProductTagsModel.fromJson(response.data);

      return model;
    } catch (e) {
      throw LaravelException(
        '${'something_wrong'.translate} \n${e.toString()}',
      );
    }
  }
}

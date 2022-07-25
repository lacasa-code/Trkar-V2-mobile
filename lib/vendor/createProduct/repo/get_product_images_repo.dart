import '../../../core/helper/laravel_exception.dart';
import '../model/get_product_images_model.dart';
import '../../../core/helper/network_utils.dart';
import '../../../core/extensions/string.dart';

class GetProductImagesRepo {
  static Future<GetProductImagesModel?> getProductImages(
    context, {
    int? productId,
  }) async {
    final util = NetworkUtil();

    var response = await util.get(
      'update/product/$productId',
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
      var model = GetProductImagesModel.fromJson(response.data);
      return model;
    } catch (e) {
      throw LaravelException(
        '${'something_wrong'.translate} \n${e.toString()}',
      );
    }
  }
}

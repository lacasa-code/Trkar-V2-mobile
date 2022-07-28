import '../model/delete_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/laravel_exception.dart';
import '../../../core/helper/network_utils.dart';

class DeleteProductRepo {
  static Future<DeleteModel?> deleteProductById(
    context, {
    int? productId,
  }) async {
    final util = NetworkUtil();
    var response = await util.post(
      'delete/product/$productId',
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
      var model = DeleteModel.fromJson(response.data);

      return model;
    } catch (e) {
      throw LaravelException(
        '${'something_wrong'.translate} \n${e.toString()}',
      );
    }
  }
}

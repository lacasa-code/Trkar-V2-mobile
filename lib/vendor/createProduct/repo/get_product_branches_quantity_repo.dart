import '../../../core/helper/network_utils.dart';
import '../model/get_product_branches_quantity_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/laravel_exception.dart';

class GetProductBranchesQuantityRepo {
  static Future<GetProductBranchesQuantityModel?> getQuantity(
    context, {
    int? productId,
  }) async {
    final util = NetworkUtil();

    var response = await util.get(
      'product/qt/$productId',
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
      var model = GetProductBranchesQuantityModel.fromJson(response.data);

      return model;
    } catch (e) {
      throw LaravelException(
        '${'something_wrong'.translate} \n${e.toString()}',
      );
    }
  }
}

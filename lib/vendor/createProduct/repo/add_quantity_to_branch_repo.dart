import 'package:dio/dio.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import '../../../core/extensions/string.dart';

import '../model/add_quantity_to_branch_model.dart';
import '../../../core/helper/network_utils.dart';

class AddQuantityToBranchRepo {
  static Future<AddQuantityToBranchModel?> addQuantity(
    context, {
    required Map<String, dynamic> body,
    int? quantityId,
  }) async {
    final util = NetworkUtil();

    var response = await util.post(
      quantityId != null
          ? 'update/product/qt/$quantityId'
          : 'create/product/qt',
      context: context,
      body: FormData.fromMap(body),
    );

    if (response == null) {
      return null;
    }
    if (response.statusCode == 404 || (response.statusCode ?? 0) >= 500) {
      throw LaravelException(
          '${'something_wrong'.translate} \nSTATUS_CODE: ${response.statusCode}');
    }
    try {
      var model = AddQuantityToBranchModel.fromJson(response.data);

      return model;
    } catch (error) {
      throw LaravelException(
        '${'something_wrong'.translate} \n${error.toString()}',
      );
    }
  }
}

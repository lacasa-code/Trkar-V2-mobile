import 'package:dio/dio.dart';

import '../model/store_additional_image_model.dart';

import '../../../core/extensions/string.dart';
import '../../../core/helper/network_utils.dart';
import '../../../core/helper/laravel_exception.dart';

class StoreAdditionalProductImagesRepo {
  static Future<StoreAdditionalProductImagesModel?> storeImages(
    context, {
    required Map<String, dynamic> body,
  }) async {
    final util = NetworkUtil();
    var response = await util.post(
      'create/product/img',
      context: context,
      body: FormData.fromMap(
        body,
      ),
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
      var model = StoreAdditionalProductImagesModel.fromJson(response.data);

      return model;
    } catch (error) {
      throw LaravelException(
        '${'something_wrong'.translate} \n${error.toString()}',
      );
    }
  }
}

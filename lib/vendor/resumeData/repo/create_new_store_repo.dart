import 'package:dio/dio.dart';

import '../../../core/helper/network_utils.dart';
import '../model/create_store_model.dart';

class CreateNewStoreRepo {
  static Future<CreateStoreModel?> createNewStore(
    context, {
    required Map<String, dynamic> body,
  }) async {
    final util = NetworkUtil();

    var response = await util.post(
      'create/store',
      context: context,
      body: FormData.fromMap(
        body,
      ),
    );

    if (response == null) {
      return null;
    }

    var model = CreateStoreModel.fromJson(response.data);

    return model;
  }
}

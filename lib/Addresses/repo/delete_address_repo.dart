import 'package:dio/dio.dart';

import '../model/delete_address_model.dart';
import '../../core/helper/network_utils.dart';

class DeleteAddressRepo {
  static Future<DeleteAddressModel?> deleteAddress(
    context, {
    required Map<String, dynamic> body,
  }) async {
    final _util = NetworkUtil();

    var response = await _util.post(
      'addresses/delete',
      context: context,
      withHeader: true,
      body: FormData.fromMap(body),
    );

    if (response == null) {
      return null;
    }

    var model = DeleteAddressModel.fromJson(response.data);

    return model;
  }
}

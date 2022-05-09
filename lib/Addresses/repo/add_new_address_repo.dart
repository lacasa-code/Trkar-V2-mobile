import 'package:dio/dio.dart';

import '../model/add_new_address_model.dart';
import '../../core/helper/network_utils.dart';

class AddOrUpgradeAddressRepo {
  static Future<AddNewAddressModel?> addNewAddress(
    context, {
    required Map<String, dynamic> body,
    bool create = true,
  }) async {
    final _util = NetworkUtil();

    var response = await _util.post(
    create?  'addresses/create':'addresses/update',
      context: context,
      withHeader: true,
      body: FormData.fromMap(body),
    );

    if (response == null) {
      return null;
    }

    var model = AddNewAddressModel.fromJson(response.data);

    return model;
  }
}

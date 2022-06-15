import 'package:dio/dio.dart';

import '../../core/helper/network_utils.dart';
import '../model/vendor_register_model.dart';

class VendorLoginRepo {
  static Future<VendorAuthModel?> loginVendor(
    context, {
    required Map<String, dynamic> body,
  }) async {
    final _util = NetworkUtil();

    var response = await _util.post(
      'vendor/login',
      context: context,
      withHeader: true,
      body: FormData.fromMap(body),
    );
    if (response == null) {
      return null;
    }
    var model = VendorAuthModel.fromJson(response.data);

    return model;
  }
}

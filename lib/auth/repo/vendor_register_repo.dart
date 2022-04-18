import 'package:dio/dio.dart';

import '../model/vendor_register_model.dart';
import '../../core/helper/network_utils.dart';

class VendorRegisterRepo {
  static Future<VendorRegisterModel?> registerVendor(
    context, {
    required Map<String, dynamic> body,
  }) async {
    final _util = NetworkUtil();

    var response = await _util.post(
      'vendor/register',
      context: context,
      withHeader: true,
      body: FormData.fromMap(body),
    );
    if (response == null) {
      return null;
    }
    var model = VendorRegisterModel.fromJson(response.data);
    return model;
  }
}

import 'dart:convert';

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
    dynamic data = response.data.runtimeType == String
        ? jsonDecode(response.data)
        : response.data;
    var model = VendorRegisterModel.fromJson(data);
    return model;
  }
}

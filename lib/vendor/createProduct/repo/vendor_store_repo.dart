import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/vendor_store_model.dart';
import '../../../core/helper/network_utils.dart';
import '../../../core/extensions/string.dart';

class VendorStoreRepo {
  static Future<VendorStoreModel?> getStore(context) async {
    final util = NetworkUtil();

    var response = await util.get(
      'vendor/store',
      context: context,
    );

    if (response == null) {
      return null;
    }

    try {
      var model = VendorStoreModel.fromJson(response.data);

      return model;
    } catch (e) {
      throw LaravelException('something_wrong'.translate);
    }
  }
}

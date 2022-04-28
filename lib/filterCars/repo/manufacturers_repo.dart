import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/manufacturers_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/network_utils.dart';

class ManufacturersRepo {
  static Future<ManufacturersModel?> getManufacturer(
    context,
  ) async {
    final util = NetworkUtil();

    var response = await util.get(
      'manufacturers',
      context: context,
    );

    if (response == null) {
      return null;
    }
    if (response.statusCode! >= 500) {
      throw LaravelException('${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}');
    }
    var model = ManufacturersModel.fromJson(response.data);

    return model;
  }
}

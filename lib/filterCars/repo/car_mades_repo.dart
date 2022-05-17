import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/car_mades_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/network_utils.dart';

class CarMadesRepo {
  static Future<CarMadesModel?> getCarMades(
    context, {
    categoryId,
    required bool isEnglish,
  }) async {
    final util = NetworkUtil();

    var response = await util.get(
      categoryId != null ? 'category/car/mades/$categoryId' : 'car/mades',
      context: context,
      specificLangCode: isEnglish ? 'en' : null,
    );

    if (response == null) {
      return null;
    }
    if (response.statusCode! >= 500) {
      throw LaravelException(
          '${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}');
    }
    var model = CarMadesModel.fromJson(response.data);

    return model;
  }
}

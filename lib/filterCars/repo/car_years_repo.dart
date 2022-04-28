import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/car_years_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/network_utils.dart';

class CarYearsRepo {
  static Future<CarYearsModel?> getCarYears(
    context,
  ) async {
    final util = NetworkUtil();

    var response = await util.get(
      'car/years',
      context: context,
    );

    if (response == null) {
      return null;
    }
    if (response.statusCode! >= 500) {
      throw LaravelException('${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}');
    }
    var model = CarYearsModel.fromJson(response.data);

    return model;
  }
}

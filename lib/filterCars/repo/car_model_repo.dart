import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/cars_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/network_utils.dart';

class CarModelsRepo {
  static Future<CarsModel?> getCarModels(
    context,
  ) async {
    final util = NetworkUtil();

    var response = await util.get(
      'car/model',
      context: context,
    );

    if (response == null) {
      return null;
    }
    if (response.statusCode! >= 500) {
      throw LaravelException('${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}');
    }
    var model = CarsModel.fromJson(response.data);

    return model;
  }
}

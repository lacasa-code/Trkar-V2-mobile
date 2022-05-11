import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/car_engine_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/network_utils.dart';

class CarEnginesRepo {
  static Future<CarEngineModel?> getCarEngine(context, {carModelId}) async {
    final util = NetworkUtil();

    var response = await util.get(
      carModelId == null ? 'car/engine' : 'model/car/engines/$carModelId',
      context: context,
    );

    if (response == null) {
      return null;
    }
    if (response.statusCode! >= 500) {
      throw LaravelException(
          '${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}');
    }
    var model = CarEngineModel.fromJson(response.data);

    return model;
  }
}

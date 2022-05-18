import '../../core/helper/network_utils.dart';
import '../model/car_mades_from_vin_model.dart';

class CarMadesFromVinRepo {
  static Future<CarMadesFromVinModel?> getCarMadesName(
    context, {
    required String vinNumber,
  }) async {
    final util = NetworkUtil();
    var response = await util.get(
      'vin/$vinNumber',
      context: context,
    );
    if (response == null) {
      return null;
    }
    try {
      var model = CarMadesFromVinModel.fromJson(response.data);
      return model;
    } catch (error) {
      return null;
    }
  }
}

import '../model/city_model.dart';
import '../../core/helper/network_utils.dart';

class CityRepo {
  static Future<CityModel?> getCities(
    context, {
    dynamic countryId,
  }) async {
    final _util = NetworkUtil();
    var response = await _util.get(
      'cities/$countryId',
      context: context,
    );
    if (response == null) {
      return null;
    }
    var model = CityModel.fromJson(response.data);

    return model;
  }
}

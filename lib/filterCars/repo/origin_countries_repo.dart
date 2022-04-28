import '../model/original_countries_model.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/laravel_exception.dart';
import '../../../core/helper/network_utils.dart';

class OriginalCountriesRepo {
  static Future<OriginalCountriesModel?> getOriginalCountries(
    context,
  ) async {
    final util = NetworkUtil();

    var response = await util.get(
      'original/countries',
      context: context,
    );

    if (response == null) {
      return null;
    }
    if (response.statusCode! >= 500) {
      throw LaravelException(
          '${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}');
    }
    var model = OriginalCountriesModel.fromJson(response.data);

    return model;
  }
}

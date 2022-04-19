import '../model/country_model.dart';
import '../../core/helper/network_utils.dart';

class CountryRepo {
  static Future<CountryModel?> getCountries(context) async {
    final _util = NetworkUtil();
    var response = await _util.get(
      'countries',
      context: context,
    );
    if (response == null) {
      return null;
    }
    var model = CountryModel.fromJson(response.data);

    return model;
  }
}

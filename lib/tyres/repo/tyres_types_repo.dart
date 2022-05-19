import '../model/tyres_types_model.dart';
import '../../core/helper/network_utils.dart';

class TyresTypesRepo {
  static Future<TyresTypesModel?> getTyresTypes(
    context,
  ) async {
    final util = NetworkUtil();

    var response = await util.get(
      'tyre/types',
      context: context,
    );
    if (response == null) {
      return null;
    }
    if (response.statusCode == 500) {
      return null;
    }

    var model = TyresTypesModel.fromJson(response.data);

    return model;
  }
}

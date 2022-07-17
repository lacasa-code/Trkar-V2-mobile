import '../model/store_type_model.dart';
import '../../../core/helper/network_utils.dart';

class StoreTypesRepo {
  static Future<StoresTypeModel?> storeTypes(context) async {
    final util = NetworkUtil();

    var response = await util.get(
      'store/types',
      context: context,
    );
    if (response == null) {
      return null;
    }
    var model = StoresTypeModel.fromJson(response.data);

    return model;
  }
}

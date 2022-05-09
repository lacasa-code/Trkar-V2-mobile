import '../model/my_addresses_model.dart';
import '../../core/helper/network_utils.dart';

class MyAddressesRepo {
  static Future<MyAddressesModel?> getMyAddresses(context) async {
    final _util = NetworkUtil();

    var response = await _util.get(
      'addresses',
      context: context,
      withHeader: true,
    );
    if (response == null) {
      return null;
    }

    var model = MyAddressesModel.fromJson(response.data);

    return model;
  }
}

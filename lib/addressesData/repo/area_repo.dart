import '../model/area_model.dart';
import '../../core/helper/network_utils.dart';

class AreaRepo {
  static Future<AreaModel?> getAreas(
    context, {
    dynamic cityId,
  }) async {
    final _util = NetworkUtil();
    var response = await _util.get(
      'areas/$cityId',
      context: context,
    );
    if (response == null) {
      return null;
    }
    var model = AreaModel.fromJson(response.data);

    return model;
  }
}

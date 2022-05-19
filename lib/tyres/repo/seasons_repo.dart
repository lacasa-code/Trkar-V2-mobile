import '../../core/helper/network_utils.dart';
import '../model/seasons_model.dart';

class SeasonsRepo {
  static Future<SeasonsModel?> getSeasons(
    context, {
    tabId,
  }) async {
    final util = NetworkUtil();

    var response = await util.get(
      'seasons',
      context: context,
    );

    if (response == null) {
      return null;
    }

    var model = SeasonsModel.fromJson(response.data);

    return model;
  }
}

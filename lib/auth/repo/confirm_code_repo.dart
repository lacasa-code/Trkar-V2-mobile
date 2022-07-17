import '../model/confirm_code_model.dart';
import '../../core/helper/network_utils.dart';

class ConfirmCodeRepo {
  static Future<ConfirmCodeModel?> confirm(
    context, {
    required String queryParam,
  }) async {
    final util = NetworkUtil();

    var response = await util.post(
      'verify/mobile/$queryParam',
      context: context,
    );

    if (response == null) {
      return null;
    }

    var model = ConfirmCodeModel.fromJson(response.data);

    return model;
  }
}

import '../../core/helper/helper.dart';
import '../model/confirm_code_model.dart';
import '../../core/helper/network_utils.dart';

class EmailVerificationRepo {
  static Future<ConfirmCodeModel?> verifyEmail(
    context, {
    required String queryParam,
  }) async {
    final util = NetworkUtil();

    var response = await util.get(
      '${Helper.userTypeToVerification == 'customer' ? '' : 'vendor/'}verifiy/email/$queryParam',
      context: context,
    );

    if (response == null) {
      return null;
    }

    var model = ConfirmCodeModel.fromJson(response.data);

    return model;
  }
}

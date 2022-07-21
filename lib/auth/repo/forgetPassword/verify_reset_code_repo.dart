import '../../model/confirm_code_model.dart';
import '../../../core/helper/network_utils.dart';

class VerifyResetCodeRepo {
  static Future<ConfirmCodeModel?> verifyCode(
    context, {
    required String email,
    required String code,
  }) async {
    final util = NetworkUtil();

    var response = await util.get(
      'verifiy/reset/code/$code/$email',
      context: context,
    );

    if (response == null) {
      return null;
    }

    var model = ConfirmCodeModel.fromJson(response.data);

    return model;
  }
}

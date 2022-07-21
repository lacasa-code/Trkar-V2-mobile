import 'package:trkar/core/helper/helper.dart';

import '../model/confirm_code_model.dart';
import '../../core/helper/network_utils.dart';

class ResendEmailVerificationRepo {
  static Future<ConfirmCodeModel?> resend(
    context, {
    required String queryParam,
    bool isResend = false,
  }) async {
    final util = NetworkUtil();

    var response = await util.post(
      '${Helper.userTypeToVerification == 'customer' ? '' : 'vendor/'}resend/email/$queryParam',
      context: context,
    );

    if (response == null) {
      return null;
    }

    var model = ConfirmCodeModel.fromJson(response.data);

    return model;
  }
}

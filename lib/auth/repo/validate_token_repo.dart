import '../model/validate_token_model.dart';
import '../../core/helper/network_utils.dart';

class ValidateTokenRepo {
  static Future<ValidateTokenModel?> validateToken(context) async {
    final _util = NetworkUtil();
    var response = await _util.get(
      'isValidToken',
      context: context,
      withHeader: true,
    );
    if (response == null) {
      return null;
    }

    var model = ValidateTokenModel.fromJson(response.data);

    return model;
  }
}

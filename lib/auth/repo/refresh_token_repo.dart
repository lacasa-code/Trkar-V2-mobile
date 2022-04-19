import '../model/register_model.dart';
import '../../core/helper/network_utils.dart';

class RefreshTokenRepo {
  static Future<UserAuthModel?> refreshToken(context) async {
    final _util = NetworkUtil();
    var response = await _util.post(
      'isValidToken',
      context: context,
      withHeader: true,
    );
    if (response == null) {
      return null;
    }

    var model = UserAuthModel.fromJson(response.data);

    return model;
  }
}

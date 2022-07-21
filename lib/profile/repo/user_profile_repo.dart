import 'package:trkar/core/helper/helper.dart';

import '../model/user_profile_model.dart';
import '../../core/helper/network_utils.dart';

class UserProfileRepo {
  static Future<UserProfileModel?> getProfile(context) async {
    final _util = NetworkUtil();
    var response = await _util.get(
      '${Helper.isVendorLoggedIn ? 'vendor/' : ''}userProfile',
      context: context,
    );
    if (response == null) {
      return null;
    }

    var model = UserProfileModel.fromJson(response.data);

    return model;
  }
}

import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/store_branchs_model.dart';
import '../../../core/helper/network_utils.dart';
import '../../../core/extensions/string.dart';

class BranchesRepo {
  static Future<StoreBranchesModel?> getBranches(
    context, {
    required int storeId,
  }) async {
    final util = NetworkUtil();

    var response = await util.get(
      'store/branchs/$storeId',
      context: context,
    );

    if (response == null) {
      return null;
    }

    try {
      var model = StoreBranchesModel.fromJson(response.data);

      return model;
    } catch (e) {
      throw LaravelException('something_wrong'.translate);
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trkar/core/helper/laravel_exception.dart';

import '../model/categories_model.dart';
import '../../core/helper/network_utils.dart';
import '../../core/extensions/string.dart';

class MainCategoryWithChildrenRepo {
  static Future<CategoriesModel?> getMainCategories(
    context,
  ) async {
    final util = NetworkUtil();

    var response = await util.get(
      'main/childrens/categories',
      context: context,
    );
    if (response == null) {
      return null;
    }
    if (response.statusCode! >= 500) {
      throw LaravelException(
        '${'something_wrong'.translate} \n STATUS_CODE : ${response.statusCode}',
      );
    }
    try {
      var model = CategoriesModel.fromJson(response.data);
      return model;
    } catch (error) {
      if(kDebugMode){

      Fluttertoast.showToast(
        msg: '${'something_wrong'.translate} \n ${error.toString()}',
      );
      }
      throw LaravelException(
        '${'something_wrong'.translate} \n ${error.toString()}',
      );
    }
  }
}

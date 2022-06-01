import 'dart:developer';

import '../model/attributes_model.dart';
import '../../core/helper/network_utils.dart';

class AttributesRepo {
  static Future<AttributesModel?> getAttributeByParentId(
    context, {
    required String path,
    parentId,
    typeId,
  }) async {
    log(
      'tyre/$path${typeId == null ? '' : '/$typeId'}${parentId == null ? '' : '/$parentId'}',
    );
    final util = NetworkUtil();
    var response = await util.get(
      'tyre/$path${typeId == null ? '' : '/$typeId'}${parentId == null ? '' : '/$parentId'}',
      context: context,
    );
    if (response == null) {
      return null;
    }
    if (response.statusCode == 500) {
      return null;
    }
    var model = AttributesModel.fromJson(response.data);

    return model;
  }
}

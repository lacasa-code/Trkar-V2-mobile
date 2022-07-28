import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_images_picker/flutter_images_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heic_to_jpg/heic_to_jpg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trkar/auth/model/register_model.dart';
import 'package:trkar/auth/model/vendor_register_model.dart';

import './app_localization.dart';
import 'package:flutter/material.dart';

class Helper {
  static String get appBaseUrl => 'http://trkar-v2.lacasacode.com';
  static String get storageDomainUrl =>
      'http://trkar-v2.lacasacode.com/storage/';
  static String get currentLanguage => localization.currentLanguage.toString();
  static Alignment get appAlignment =>
      currentLanguage == 'ar' ? Alignment.centerRight : Alignment.centerLeft;
  static TextDirection get appDirection =>
      currentLanguage == 'ar' ? TextDirection.rtl : TextDirection.ltr;

  static TextDirection get reversedAppDirection =>
      currentLanguage != 'ar' ? TextDirection.rtl : TextDirection.ltr;
  static UserAuthModel? get currentUser => GetStorage().hasData('user')
      ? UserAuthModel.fromJson(jsonDecode(GetStorage().read<String>('user')!))
      : null;
  static VendorAuthModel? get currentVendor => GetStorage().hasData('vendor')
      ? VendorAuthModel.fromJson(
          jsonDecode(GetStorage().read<String>('vendor')!))
      : null;
  static bool get isLoggedIn => currentUser != null;
  static bool get isVendorLoggedIn => currentVendor != null;
  static bool get isValidToken =>
      GetStorage().hasData('expires_in') &&
      DateTime.parse(GetStorage().read('expires_in')).isAfter(DateTime.now());
  static Future<void> storeNewUserData(
    UserAuthModel authModel,
  ) async {
    await GetStorage().write(
      'user',
      jsonEncode(
        authModel.toJson(),
      ),
    );
    log('activationCode ${currentUser?.data?.activationCode}');
    var tokenExpiresDate = DateTime.now().add(
      Duration(milliseconds: authModel.expiresIn ?? 0),
    );
    await GetStorage().write(
      'expires_in',
      tokenExpiresDate.toIso8601String(),
    );
  }

  static Future<void> storeNewVendorData(
    VendorAuthModel authModel,
  ) async {
    await GetStorage().write(
      'vendor',
      jsonEncode(
        authModel.toJson(),
      ),
    );
    // var tokenExpiresDate = DateTime.now().add(
    //   Duration(milliseconds: authModel.data. ?? 0),
    // );
    // await GetStorage().write(
    //   'expires_in',
    //   tokenExpiresDate.toIso8601String(),
    // );
  }

  static Future<void> clearVendorData() async {
    var getStorage = GetStorage();
    await getStorage.remove(
      'vendor',
    );

    // await getStorage.remove(
    //   'expires_in',
    // );
  }

  static Future<void> clearUserData() async {
    var getStorage = GetStorage();
    await getStorage.remove(
      'user',
    );

    await getStorage.remove(
      'expires_in',
    );
  }

  static String _userTypeToVerification = '';
  static String get userTypeToVerification => _userTypeToVerification;

  static void setUserTypeToVerification(String newUserType) {
    _userTypeToVerification = newUserType;
  }

  static Future<List<File>> selectImages({
    int imageCount = 2,
  }) async {
    var pickedImages =
        await FlutterImagesPicker.pickImages(maxImages: imageCount);

    if (pickedImages.isEmpty) {
      return [];
    }

    return pickedImages
        .map(
          (e) => File(
            e.path,
          ),
        )
        .toList();
  }

  static Future<File> compressAndGetFile(
    File pickedFile,
  ) async {
    File file = pickedFile;
    try {
      var store = await getApplicationDocumentsDirectory();
      CompressFormat format = CompressFormat.png;
      log('heicYes $format');
      var imageFormat = file.path.split('/').last.split('.').last.toLowerCase();
      if (imageFormat == 'heic') {
        log('heicYes');
        String convertedPath =
            (await getTemporaryDirectory()).path + '/${DateTime.now()}.jpg';
        var newPath =
            await HeicToJpg.convert(file.path, jpgPath: convertedPath);
        file = File(newPath ?? '');
      }
      imageFormat = file.path.split('/').last.split('.').last.toLowerCase();
      log('newFormat $imageFormat');
      switch (imageFormat) {
        case 'jpg':
          format = CompressFormat.jpeg;
          break;
        case 'jpeg':
          format = CompressFormat.jpeg;
          break;
        case 'png':
          format = CompressFormat.png;
          break;
        case 'heic':
          format = CompressFormat.heic;
          break;
        case 'webp':
          format = CompressFormat.webp;
          break;
        default:
      }
      log('format $format imageFormat $imageFormat');
      var result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        store.path + file.path.split('/').last,
        quality: 88,
        format: format,
      );

      return result ?? file;
    } catch (e) {
      if (kDebugMode) {
        Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.red,
        );
      }
      return file;
    }
  }
}

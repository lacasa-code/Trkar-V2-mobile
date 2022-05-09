import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:trkar/auth/model/register_model.dart';

import './app_localization.dart';
import 'package:flutter/material.dart';

class Helper {
  static String get appBaseUrl => 'http://trkar-v2.lacasacode.com';
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
  static bool get isLoggedIn => currentUser != null;
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
    var tokenExpiresDate = DateTime.now().add(
      Duration(milliseconds: authModel.expiresIn ?? 0),
    );
    await GetStorage().write(
      'expires_in',
      tokenExpiresDate.toIso8601String(),
    );
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
}


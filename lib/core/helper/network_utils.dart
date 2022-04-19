import 'dart:developer';
import 'dart:io';

import 'package:dio/adapter.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trkar/core/helper/helper.dart';
import './navigator.dart';
import '../../splash/view/splash_screen.dart';
// import 'helper.dart';

class NetworkUtil {
  // ignore: prefer_final_fields
  static NetworkUtil _instance = NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  Dio dio = Dio();

  Future<Response?> get(
    String url, {
    @required BuildContext? context,
    Map? headers,
    bool withHeader = true,
  }) async {
    Response? response;

    try {
      dio.options.baseUrl = "http://trkar-v2.lacasacode.com/api/";
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      response = await dio.get(url,
          options: Options(
              headers: withHeader
                  ? {
                      if (Helper.currentUser != null) ...{
                        HttpHeaders.authorizationHeader:
                            'Bearer ${Helper.currentUser!.accessToken}',
                      },
                      // HttpHeaders.contentTypeHeader: 'application/json',
                      // HttpHeaders.acceptHeader: 'application/json',
                      'lang': Helper.currentLanguage,
                    }
                  : headers == null
                      ? null
                      : headers as Map<String, dynamic>));
    } on DioError catch (e) {
      log('Error is : ${e.message}');
      response = e.response;

      // var prefs = context.read(sharedPreferences).prefs;
      // var _prefs = prefs;
      // if (e.response != null) {
      //   if (e.response.statusCode >= 500) {
      //     log('ssgggdsdsdsd yup');

      //     await N.replaceAll(
      //       const SplashScreen(),
      //     );
      //     log('ssgggdsdsdsd yup');
      //     await _prefs.clear().then((value) => log('done'));
      //     Phoenix.rebirth(context);
      //   }
      //   response = e.response;
      //   log("response bbb: " + e.response.toString());
      // } else {}
    }
    return response == null ? null : handleResponse(response, context);
  }

  Future<Response?> post(String url,
      {@required BuildContext? context,
      Map? headers,
      FormData? body,
      bool withHeader = true,
      encoding}) async {
    Response? response;

    dio.options.baseUrl = "http://trkar-v2.lacasacode.com/api/";

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    try {
      response = await dio.post(url,
          data: body,
          options: Options(
              headers: withHeader
                  ? {
                      if (Helper.currentUser != null) ...{
                        HttpHeaders.authorizationHeader:
                            'Bearer ${Helper.currentUser!.accessToken}',
                      },
                      // HttpHeaders.contentTypeHeader: 'application/json',
                      // HttpHeaders.acceptHeader: 'application/json',
                      'lang': Helper.currentLanguage,
                    }
                  : headers == null
                      ? null
                      : headers as Map<String, dynamic>,
              requestEncoder: encoding));
    } on DioError catch (e) {
      log(' from post ${e.error} + message ${e.message}');
      if (e.response != null) {
        log('response : => ${e.response?.data}');
        response = e.response;
      }
      // var prefs = context.read(sharedPreferences).prefs;

      // var _prefs = prefs;
      // if (e.response != null) {
      //   if (e.response.statusCode >= 500) {
      //     log('ssdsdsdsd yup');
      //     await N.replaceAll(
      //       const SplashScreen(),
      //     );
      //     await _prefs.clear().then((value) => log('done'));
      //     Phoenix.rebirth(context);
      //   }
      //   response = e.response;
      //   log("response bb: " + e.response.toString());
      // } else {}
    }
    return response == null ? null : handleResponse(response, context);
  }

  Future<Response?> handleResponse(
      Response response, BuildContext? context) async {
    final int? statusCode = response.statusCode;
    log("response: ..." + response.toString());
    if (response.statusCode! >= 500 || response.data['success'] != null) {
      log('ssdsdsdsd yup');
      if ((response.data['message'] as String)
          .toLowerCase()
          .contains('token')) {
        await GetStorage().remove('user');
        Phoenix.rebirth(context!);
        NavigationService.pushAndRemoveUntil(
          page: const SplashScreen(),
          predicate: (_) => false,
        );
        return null;
      }
    }
    // Future.delayed(const Duration(milliseconds: 1), () async {
    //   var _prefs = context.read(sharedPreferences).prefs;
    //   if (response.statusCode >= 500 || response.data['success'] != null) {
    //     log('ssdsdsdsd yup');
    //     if ((response.data['message'] as String)
    //         .toLowerCase()
    //         .contains('token')) {
    //       await _prefs.remove('user').then((value) => log('done'));
    //       Phoenix.rebirth(context);
    //       N.replaceAll(
    //         const SplashScreen(),
    //       );
    //       return;
    //     }
    //   }
    // });
    if (statusCode! >= 200 && statusCode < 300) {
      return response;
    } else {
      return response;
    }
  }
}

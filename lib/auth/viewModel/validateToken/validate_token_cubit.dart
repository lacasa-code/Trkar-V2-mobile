import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/tab/view/tab_screen.dart';
import '../../repo/validate_token_repo.dart';
import '../../repo/refresh_token_repo.dart';

part 'validate_token_state.dart';

class ValidateTokenCubit extends Cubit<ValidateTokenState> {
  ValidateTokenCubit() : super(ValidateTokenInitial());
  Future<void> validateToken(
    BuildContext context, {
    bool isUserToken = false,
  }) async {
    log('message top');
    var validateTokenData = await ValidateTokenRepo.validateToken(
      context,
      isUserToken: isUserToken,
    );
    log('message after $isUserToken vendor null=> ${Helper.currentVendor == null}');

    if (validateTokenData == null) {
      log('message null');
      validateToken(context);
      return;
    }

    if ((Helper.isLoggedIn || Helper.isVendorLoggedIn) &&
        validateTokenData.status == false) {
      log('NotValidToken');
      isUserToken
          ? await Helper.clearUserData()
          : await Helper.clearVendorData();

      context.router.pushAndPopUntil(
        const TabRoute(),
        predicate: (_) => false,
      );
      return;
    }
    if ((Helper.isLoggedIn && Helper.currentUser?.code == 402) ||
        (Helper.isVendorLoggedIn && Helper.currentVendor?.code == 402)) {
      Fluttertoast.showToast(
        msg: 'verification_required'.translate,
      );
      Helper.setUserTypeToVerification(
        isUserToken ? 'customer' : 'vendor',
      );
      log(
        isUserToken
            ? Helper.currentUser?.data?.email ?? ''
            : Helper.currentVendor?.data?.email ?? '',
      );
      context.router.pushAndPopUntil(
        EmailVerificationRouter(
          email: isUserToken
              ? Helper.currentUser?.data?.email ?? ''
              : Helper.currentVendor?.data?.email ?? '',
          resendCode: true,
        ),
        predicate: (_) => false,
      );
    } else {
      context.router.pushAndPopUntil(
        isUserToken ? const TabRoute() : const VendorHomeRouter(),
        predicate: (_) => false,
      );
    }
    // NavigationService.pushReplacementAll(
    //   page: TabScreen.routeName,
    // );
  }

  Future<void> refreshToken(context) async {
    var refreshTokenData = await RefreshTokenRepo.refreshToken(context);
    if (refreshTokenData == null) {
      return;
    }

    if (refreshTokenData.status == true) {
      await Helper.storeNewUserData(refreshTokenData);
    }
  }
}

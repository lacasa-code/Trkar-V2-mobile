import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:trkar/auth/view/login_screen.dart';
import 'package:trkar/core/components/custom_new_dialog.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/tab/view/tab_screen.dart';
import '../../repo/validate_token_repo.dart';
import '../../repo/refresh_token_repo.dart';

part 'validate_token_state.dart';

class ValidateTokenCubit extends Cubit<ValidateTokenState> {
  ValidateTokenCubit() : super(ValidateTokenInitial());
  Future<void> validateToken(context) async {
    log('message top');
    var validateTokenData = await ValidateTokenRepo.validateToken(context);
    log('message after');

    if (validateTokenData == null) {
      log('message null');
      NavigationService.pushReplacementAll(
        page: LoginScreen.routeName,
      );
      return;
    }

    if (validateTokenData.data == true) {
      log('message ntrue');
      await CustomDialog().showWarningDialog(
        context: context,
        msg: 'network'.translate,
        btnOnPress: () {},
      );
      validateToken(context);
    } else {
      if (Helper.isLoggedIn) {
        await Helper.clearUserData();
      }
      NavigationService.pushReplacementAll(
        page: TabScreen.routeName,
      );
    }
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

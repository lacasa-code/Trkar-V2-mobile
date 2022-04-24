import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trkar/auth/repo/logout_repo.dart';
import 'package:trkar/core/components/custom_new_dialog.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../../../core/extensions/string.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  final _dialog = CustomDialog();
  Future<void> logOut(BuildContext context) async {
    emit(LogoutLoading());

    try {
      var logoutData = await LogoutRepo.logout(context);
      if (logoutData == null) {
        emit(LogoutNetworlError());
        _dialog.showWarningDialog(
          context: context,
          msg: 'network'.translate,
          btnOnPress: () {},
        );
        return;
      }
      if (logoutData.status == true) {
        await Helper.clearUserData();

        Phoenix.rebirth(context);
        NavigationService.pushReplacementAll(page: '/');
      } else {
        _dialog.showWarningDialog(
          msg: logoutData.message ?? 'something_wrong'.translate,
          btnOnPress: () {},
          context: context,
        );
        emit(LogoutError());
      }
    } on LaravelException catch (error) {
      _dialog.showWarningDialog(
        msg: error.exception,
        btnOnPress: () {},
        context: context,
      );
      emit(LogoutError());
    }
  }
}

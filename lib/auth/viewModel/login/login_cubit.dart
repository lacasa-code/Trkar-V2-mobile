import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trkar/core/components/custom_new_dialog.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/home_screen.dart';
import 'package:trkar/tab/view/tab_screen.dart';
import '../../../core/extensions/string.dart';
import '../../repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(context) async {
    FocusManager.instance.primaryFocus?.unfocus();

    var dialog = CustomDialog();
    var validate = formKey.currentState!.validate();

    if (!validate) {
      return;
    }
    emit(LoginLoading());

    var loginData = await LoginRepo.loginUser(
      context,
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
    if (loginData == null) {
      dialog.showWarningDialog(
        context: context,
        btnOnPress: () {},
        msg: 'network'.translate,
      );
      emit(LoginNetworkError());
      return;
    }
    if (loginData.status == true) {
      Fluttertoast.showToast(
        msg: loginData.message ?? '',
      );
      await Helper.storeNewUserData(loginData);
      NavigationService.push(
        page: TabScreen.routeName,
      );
      emit(LoginDone());
    } else {
      var errorMessage = '';
      if (loginData.erroressages != null) {
        loginData.erroressages?.forEach((key, value) {
          if (value.isNotEmpty) {
            errorMessage.isEmpty
                ? errorMessage += value.first
                : errorMessage += '\n ${value.first}';
          }
        });
      } else {
        errorMessage = loginData.message ?? '';
      }
      dialog.showWarningDialog(
        context: context,
        msg: errorMessage,
        btnOnPress: () {},
      );
      emit(LoginError());
    }
  }

  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  String? emailValidator(String? v) {
    if (v!.isEmpty) {
      return 'email_required'.translate;
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(v)) {
      return 'invalid_email'.translate;
    }
    return null;
  }

  String? passwordValidator(String? v) {
    if (v!.isEmpty) {
      return 'password_required'.translate;
    }
    return null;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}

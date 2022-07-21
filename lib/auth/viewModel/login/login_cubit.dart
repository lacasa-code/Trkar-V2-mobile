import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trkar/auth/view/widgets/auth_choose_type_dialog.dart';
import 'package:trkar/core/components/custom_new_dialog.dart';
import 'package:trkar/core/components/result_dialog.dart';
import 'package:trkar/core/helper/helper.dart';
import '../../../core/router/router.gr.dart';
import '../../../core/extensions/string.dart';
import '../../repo/login_repo.dart';
import '../../repo/vendor_login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    required bool isUserRegistered,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    var validate = formKey.currentState!.validate();

    if (!validate) {
      return;
    }
    isUserRegistered ? _loginUser(context) : _loginVendor(context);
  }

  Future<void> _loginUser(BuildContext context) async {
    var dialog = CustomDialog();

    emit(LoginLoading());

    var loginData = await LoginRepo.loginUser(
      context,
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
    if (loginData == null) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: 'network'.translate,
        ),
      );
      emit(LoginNetworkError());
      return;
    }
    if (loginData.status == true) {
      Fluttertoast.showToast(
        msg: loginData.message ?? '',
      );
      await Helper.storeNewUserData(loginData);
      context.router.pushAndPopUntil(
        const TabRoute(),
        predicate: (_) => false,
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
      if (loginData.code == 402) {
        await Helper.storeNewUserData(loginData);
        emit(LoginError());
        Helper.setUserTypeToVerification(
          'customer',
        );
        Fluttertoast.showToast(
          msg: loginData.message ?? '',
        );
        context.router.pushAndPopUntil(
          EmailVerificationRouter(
            email: loginData.data?.email ?? '',
            resendCode: true,
          ),
          predicate: (r) => false,
        );
        return;
      }
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.error,
          message: errorMessage,
        ),
      );
      emit(LoginError());
    }
  }

  Future<void> _loginVendor(BuildContext context) async {
    emit(LoginLoading());

    var loginData = await VendorLoginRepo.loginVendor(
      context,
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
    if (loginData == null) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: 'network'.translate,
        ),
      );
      emit(LoginNetworkError());
      return;
    }
    if (loginData.status == true) {
      Fluttertoast.showToast(
        msg: loginData.message ?? '',
      );
      await Helper.storeNewVendorData(loginData);
      context.router.pushAndPopUntil(
        const VendorHomeRouter(),
        predicate: (_) => false,
      );
      emit(LoginDone());
    } else {
      if (loginData.code == 402) {
        await Helper.storeNewVendorData(loginData);
        emit(LoginError());
        Helper.setUserTypeToVerification('vendor');
        Fluttertoast.showToast(
          msg: loginData.message ?? '',
        );
        context.router.pushAndPopUntil(
          EmailVerificationRouter(
            email: loginData.data?.email ?? '',
            resendCode: true,
          ),
          predicate: (r) => false,
        );
        return;
      }
      var errorMessage = '';
      if (loginData.errorMessages != null) {
        if (loginData.errorMessages?.username != null) {
          errorMessage += loginData.errorMessages!.username!.first;
        }
        if (loginData.errorMessages?.email != null) {
          errorMessage +=
              '${errorMessage.isNotEmpty ? '\n ' : ''}${loginData.errorMessages!.email!.first}';
        }
        if (loginData.errorMessages?.password != null) {
          errorMessage +=
              '${errorMessage.isNotEmpty ? '\n ' : ''}${loginData.errorMessages!.password!.first}';
        }
      } else {
        errorMessage = loginData.message ?? '';
      }
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.error,
          message: errorMessage,
        ),
      );
      emit(LoginError());
    }
  }

  bool _securePassword = true;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool get securePassword => _securePassword;

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

  void changeVisibility() {
    _securePassword = !_securePassword;
    emit(VisibilityChanged());
  }
}

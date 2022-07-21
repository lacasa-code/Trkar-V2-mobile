import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import 'package:trkar/core/router/router.gr.dart';

import '../../../core/components/result_dialog.dart';
import '../../repo/forgetPassword/reset_password_repo.dart';
import '../../../core/extensions/string.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({
    required this.emailAddress,
  }) : super(ResetPasswordInitial());
  final String emailAddress;

  final formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();

  Future<void> resetPassword(BuildContext context) async {
    var validate = formKey.currentState?.validate() ?? false;
    if (!validate) {
      return;
    }
    emit(ResetPasswordLoading());
    try {
      var resetPasswordData = await ResetPasswordRepo.reset(
        context,
        email: emailAddress,
        body: {
          'password': passwordController.text,
        },
      );
      if (resetPasswordData == null) {
        emit(ResetPasswordError());
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: 'network'.translate,
          ),
        );
        return;
      }
      if (resetPasswordData.status == true) {
        Fluttertoast.showToast(
          msg: resetPasswordData.message ?? '',
        );
        context.router.pushAndPopUntil(
          const LoginRouter(),
          predicate: (r) => false,
        );
      } else {
        emit(ResetPasswordError());
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: resetPasswordData.message ?? '',
          ),
        );
        return;
      }
    } on LaravelException catch (error) {
      emit(ResetPasswordError());
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: error.exception,
        ),
      );
      return;
    }
  }

  String? passwordValidator(String? v) {
    if (v!.isEmpty) {
      return 'password_required'.translate;
    }
    if (!v.contains(
        RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
      return 'invalid_password'.translate;
      // return "You must use letters, numbers and symbols, uppercase letters";
    }
    return null;
  }

  String? passwordConfirmationValidator(String? v) {
    if (v!.isEmpty) {
      return 'password_confirmation_required'.translate;
    }
    if (passwordController.text.isNotEmpty && (passwordController.text != v)) {
      return 'password_mismatch'.translate;
    }
    return null;
  }
}

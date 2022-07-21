import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import '../../../core/components/result_dialog.dart';
import '../../../core/extensions/string.dart';
import 'package:auto_route/auto_route.dart';
import '../../../core/router/router.gr.dart';
import '../../repo/forgetPassword/verify_reset_code_repo.dart';
import '../../repo/forgetPassword/forget_password_repo.dart';

part 'verify_reset_code_state.dart';

class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  VerifyResetCodeCubit({
    required this.emailAddress,
  }) : super(VerifyResetCodeInitial());
  final String emailAddress;

  Future<void> verifyCode(
    BuildContext context,
  ) async {
    var validate = formKey.currentState?.validate() ?? false;
    if (!validate) {
      return;
    }
    emit(VerifyResetCodeLoading());
    var confirmCodeData = await VerifyResetCodeRepo.verifyCode(
      context,
      email: emailAddress,
      code: codeController.text,
    );
    if (confirmCodeData == null) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: 'network'.translate,
        ),
      );

      emit(VerifyResetCodeError());
      return;
    }
    if (confirmCodeData.status == true) {
      emit(VerifyResetCodeDone());
      Fluttertoast.showToast(
        msg: confirmCodeData.message ?? '',
      );
      context.router.replace(
        ResetPasswordRouter(
          emailAddress: emailAddress,
        ),
      );
    } else {
      emit(VerifyResetCodeError());

      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: confirmCodeData.message ?? 'something_wrong'.translate,
        ),
      );
    }
  }

  Future<void> resendCode(
    BuildContext context,
  ) async {
    log('resend');
    var resendCodeData = await ForgetPasswordRepo.forgetPassword(
      context,
      email: emailAddress,
    );
    if (resendCodeData == null) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: 'network'.translate,
        ),
      );

      return;
    }
    if (resendCodeData.status == true) {
      Fluttertoast.showToast(
        msg: resendCodeData.message ?? '',
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: resendCodeData.message ?? 'something_wrong'.translate,
        ),
      );
    }
  }

  final formKey = GlobalKey<FormState>();
  var codeController = TextEditingController();

  String? verificationCodeValidate(String? value) {
    if (value!.isEmpty) {
      return 'verification_code_required'.translate;
    }
    if (value.length < 4) {
      return 'invalid_verification_code'.translate;
    }
    return null;
  }
}

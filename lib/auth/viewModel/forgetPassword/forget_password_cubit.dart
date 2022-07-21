import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trkar/core/components/result_dialog.dart';
import 'package:trkar/core/router/router.gr.dart';

import '../../repo/forgetPassword/forget_password_repo.dart';
import '../../../core/extensions/string.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  Future<void> forgetPassword(BuildContext context) async {
    var validate = formKey.currentState?.validate() ?? false;

    if (!validate) {
      return;
    }

    emit(ForgetPasswordLoading());
    var forgetPasswordData = await ForgetPasswordRepo.forgetPassword(
      context,
      email: emailController.text.trim(),
    );
    if (forgetPasswordData == null) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: 'network'.translate,
        ),
      );
      return;
    }
    if (forgetPasswordData.status == true) {
      emit(ForgetPasswordDone());
      Fluttertoast.showToast(
        msg: forgetPasswordData.message ?? '',
      );
      context.router.push(
        ForgetPasswordVerificationRouter(
          email: emailController.text,
        ),
      );
    } else {
      emit(ForgetPasswordError());
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: forgetPasswordData.message ?? '',
        ),
      );
    }
  }

  String? emailValidator(String? v) {
    if (v!.isEmpty) {
      return 'email_required'.translate;
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(v)) {
      return 'invalid_email'.translate;
    }
    return null;
  }
}

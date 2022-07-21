import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:trkar/auth/repo/resend_email_repo.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../../core/components/result_dialog.dart';
import '../../repo/email_verfication_repo.dart';
import '../../../core/extensions/string.dart';

part 'verify_email_state.dart';

class VerifyMyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyMyEmailCubit({
    required this.emailAddress,
  }) : super(VerifyEmailInitial());
  final String emailAddress;

  Future<void> verifyCode(
    BuildContext context,
  ) async {
    var validate = formKey.currentState?.validate() ?? false;
    if (!validate) {
      return;
    }

    emit(VerifyEmailLoading());
    var confirmCodeData = await EmailVerificationRepo.verifyEmail(
      context,
      queryParam: '${codeController.text}/$emailAddress',
    );
    if (confirmCodeData == null) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: 'network'.translate,
        ),
      );

      emit(VerifyEmailError());
      return;
    }
    if (confirmCodeData.status == true) {
      Fluttertoast.showToast(
        msg: confirmCodeData.message ?? '',
      );
      var isUser = Helper.userTypeToVerification == 'customer';

      if (isUser) {
        var currentUser = Helper.currentUser;
        currentUser?.code = 200;
        await Helper.storeNewUserData(currentUser!);
        log('activationCode ${Helper.currentUser?.data?.activationCode}');
      } else {
        var currentVendor = Helper.currentVendor;
        log('activationCode ${currentVendor?.data?.activationCode}');
        currentVendor?.code = 200;
        await Helper.storeNewVendorData(currentVendor!);
      }
      context.router.pushAndPopUntil(
        isUser ? const TabRoute() : const VendorHomeRouter(),
        predicate: (r) => false,
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: confirmCodeData.message ?? 'something_wrong'.translate,
        ),
      );
    }
  }

  Future<void> resend(
    BuildContext context,
  ) async {
    var confirmCodeData = await ResendEmailVerificationRepo.resend(
      context,
      queryParam: emailAddress,
    );
    if (confirmCodeData == null) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: 'network'.translate,
        ),
      );

      return;
    }
    if (confirmCodeData.status == true) {
      Fluttertoast.showToast(
        msg: confirmCodeData.message ?? '',
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: confirmCodeData.message ?? 'something_wrong'.translate,
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

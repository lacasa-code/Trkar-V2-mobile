import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trkar/core/components/result_dialog.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../../core/extensions/string.dart';

import '../../repo/confirm_code_repo.dart';

part 'confirm_code_state.dart';

class ConfirmCodeCubit extends Cubit<ConfirmCodeState> {
  ConfirmCodeCubit({
    required this.phoneNumber,
  }) : super(ConfirmCodeInitial());
  final String phoneNumber;

  Future<void> verifyCode(
    BuildContext context,
  ) async {
    var validate = formKey.currentState?.validate() ?? false;
    if (!validate) {
      return;
    }
    emit(ConfirmCodeLoading());
    var confirmCodeData = await ConfirmCodeRepo.confirm(
      context,
      queryParam: '${codeController.text}/$phoneNumber',
    );
    if (confirmCodeData == null) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: 'network'.translate,
        ),
      );

      emit(ConfirmCodeError());
      return;
    }
    if (confirmCodeData.status == true) {
      Fluttertoast.showToast(
        msg: confirmCodeData.message ?? '',
      );
      context.router.pushAndPopUntil(
        const ResumeDataRouter(),
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

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trkar/core/components/custom_new_dialog.dart';
import '../../../core/extensions/string.dart';
import '../../repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(context) async {
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
    if (loginData.statusCode == 200) {
      Fluttertoast.showToast(
        msg: loginData.message ?? '',
      );
      emit(LoginDone());
    } else {
      dialog.showWarningDialog(
        context: context,
        msg: loginData.message ?? '',
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

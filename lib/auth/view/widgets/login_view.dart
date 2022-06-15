import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/auth/viewModel/login/login_cubit.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/core/components/or_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/core/themes/themes.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
    this.isCustomerRegister = true,
  }) : super(key: key);
  final bool isCustomerRegister;

  @override
  Widget build(BuildContext context) {
    var loginCubit = context.read<LoginCubit>();
    final formKey = GlobalKey<FormState>();
    log('$isCustomerRegister ');

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BoxHelper(
              height: 30,
            ),
            RegisterField(
              hintText: 'email',
              controller: loginCubit.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: loginCubit.emailValidator,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return RegisterField(
                  hintText: 'password',
                  obsecureText: loginCubit.securePassword,
                  controller: loginCubit.passwordController,
                  validator: loginCubit.passwordValidator,
                  suffixIcon: IconButton(
                    icon: Icon(
                      loginCubit.securePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      loginCubit.changeVisibility();
                      // setState(() {

                      // });
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      context.router.push(
                        const ForgetPasswordRouter(),
                      );
                    },
                    child: Text(
                      'forgot_password'.translate,
                      style: MainTheme.subTextStyle.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const BoxHelper(
              height: 10,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orangeAccent,
                    ),
                  );
                }
                return RegisterButton(
                  title: 'login',
                  onPressed: () => loginCubit.login(
                    context,
                    formKey,
                    isUserRegistered: isCustomerRegister,
                  ),
                  // onPressed: () => loginCubit.login(context),
                  color: Colors.orangeAccent,
                  radius: 10,
                );
              },
            ),
            const OrWidget(),
            RegisterButton(
              title: 'create_new_acc',
              onPressed: () {
                // NavigationService.push(
                //   page: ChooseUserTypeScreen.routeName,
                // );
                context.router.push(
                  const ChooseTypeRouter(),
                );
              },
              color: Colors.deepOrange,
              radius: 10,
            ),
          ],
        ),
      ),
    );
  }
}

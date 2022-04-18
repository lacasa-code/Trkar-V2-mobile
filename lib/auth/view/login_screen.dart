import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/auth/viewModel/login/login_cubit.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/core/themes/themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit loginCubit;
  @override
  void initState() {
    loginCubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('lan ${Helper.currentLanguage}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: loginCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BoxHelper(
                height: 80,
              ),
              Image.asset(
                'assets/icons/trkarLogoWhite.png',
                // alignment: Al,
              ),
              const BoxHelper(
                height: 30,
              ),
              RegisterField(
                hintText: 'email',
                controller: loginCubit.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: loginCubit.emailValidator,
              ),
              RegisterField(
                hintText: 'password',
                obsecureText: true,
                controller: loginCubit.passwordController,
                validator: loginCubit.passwordValidator,
              ),
              const BoxHelper(
                height: 20,
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
                    onPressed: () => loginCubit.login(context),
                    color: Colors.orangeAccent,
                    radius: 10,
                  );
                },
              ),
              const OrWidget(),
              RegisterButton(
                title: 'create_new_acc',
                onPressed: () => loginCubit.login(context),
                color: Colors.deepOrange,
                radius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrWidget extends StatelessWidget {
  const OrWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'or'.translate,
              style: MainTheme.subTextStyleBold,
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

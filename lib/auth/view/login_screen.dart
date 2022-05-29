import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/auth/viewModel/login/login_cubit.dart';
import 'package:trkar/core/components/or_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/core/themes/themes.dart';
import '../../core/extensions/string.dart';

class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit loginCubit;
  var securePassword = true;
  @override
  void initState() {
    loginCubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Visibility(
          visible: Navigator.canPop(context),
          child: IconButton(
            onPressed: () {
              context.router.pop();
            },
            color: Colors.black,
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      ),
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
                obsecureText: securePassword,
                controller: loginCubit.passwordController,
                validator: loginCubit.passwordValidator,
                suffixIcon: IconButton(
                  icon: Icon(
                    securePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      securePassword = !securePassword;
                    });
                  },
                ),
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
                    onPressed: () => loginCubit.login(context),
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
      ),
    );
  }
}

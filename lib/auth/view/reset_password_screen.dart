import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/auth/view/widgets/header_widget.dart';
import 'package:trkar/auth/viewModel/resetPassword/reset_password_cubit.dart';
import 'package:trkar/core/components/circle_widget.dart';
import 'package:trkar/core/components/loader_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:auto_route/auto_route.dart';

class ResetPasswordScreen extends StatefulWidget implements AutoRouteWrapper {
  const ResetPasswordScreen({
    Key? key,
    required this.emailAddress,
  }) : super(key: key);
  final String emailAddress;

  static const routeName = '/reset_password';

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(
        emailAddress: emailAddress,
      ),
      child: this,
    );
  }
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var securePassword = true;
  var securePasswordConfirmation = true;
  late ResetPasswordCubit resetPasswordCubit;

  @override
  void initState() {
    resetPasswordCubit = context.read<ResetPasswordCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            color: Theme.of(context).iconTheme.color,
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Form(
                key: resetPasswordCubit.formKey,
                child: Column(
                  children: [
                    const BoxHelper(
                      height: 80,
                    ),
                    SvgPicture.asset(
                      'assets/icons/svg/login-logo.svg',
                      // alignment: Al,
                    ),
                    const BoxHelper(
                      height: 25,
                    ),
                    // const HeaderWidget(
                    //   title: 'forget_password',
                    // ),
                    Text(
                      'reset_password'.translate,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: ScreenUtil().setSp(18),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const BoxHelper(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${'enter_your'.translate} ',
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      fontSize: ScreenUtil().setSp(18),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          TextSpan(
                            text: 'new_password'.translate,
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontSize: ScreenUtil().setSp(18),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),

                    const BoxHelper(
                      height: 20,
                    ),
                    RegisterField(
                      prefixWithDivider: true,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      thinBorder: true,
                      hintText: 'password',
                      validator: resetPasswordCubit.passwordValidator,
                      controller: resetPasswordCubit.passwordController,
                      obsecureText: securePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          securePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            securePassword = !securePassword;
                          });
                        },
                      ),
                    ),
                    RegisterField(
                      prefixWithDivider: true,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      thinBorder: true,
                      hintText: 'password_confirmation',
                      controller:
                          resetPasswordCubit.passwordConfirmationController,
                      validator:
                          resetPasswordCubit.passwordConfirmationValidator,
                      obsecureText: securePasswordConfirmation,
                      suffixIcon: IconButton(
                        icon: Icon(
                          securePasswordConfirmation
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            securePasswordConfirmation =
                                !securePasswordConfirmation;
                          });
                        },
                      ),
                    ),
                    const BoxHelper(
                      height: 80,
                    ),
                    BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                      builder: (context, state) {
                        if (state is ResetPasswordLoading) {
                          return const LoaderWidget();
                        }
                        return SizedBox(
                          height: ScreenUtil().setHeight(55),
                          child: RegisterButton(
                            title: 'confirm',
                            radius: 10,
                            onPressed: () =>
                                resetPasswordCubit.resetPassword(context),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(310),
            right: -ScreenUtil().setWidth(445),
            bottom: ScreenUtil().setHeight(245),
            left: 0,
            child: const CircleWidget(),
          ),
          Positioned(
            top: ScreenUtil().setHeight(445),
            left: -ScreenUtil().setWidth(430),
            bottom: ScreenUtil().setHeight(120),
            right: 0,
            child: const CircleWidget(),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trkar/auth/view/widgets/auth_footer_widget.dart';
import 'package:trkar/auth/viewModel/login/login_cubit.dart';
import 'package:trkar/core/components/circle_widget.dart';
import 'package:trkar/core/components/result_dialog.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/core/components/loader_widget.dart';

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

    return Stack(
      children: [
        Positioned(
          top: ScreenUtil().setHeight(130),
          right: -ScreenUtil().setWidth(440),
          bottom: ScreenUtil().setHeight(235),
          left: 0,
          child: CircleWidget(),
        ),
        Positioned(
          top: ScreenUtil().setHeight(290),
          left: -ScreenUtil().setWidth(440),
          bottom: ScreenUtil().setHeight(80),
          right: 0,
          child: CircleWidget(),
        ),
        SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BoxHelper(
                  height: 30,
                ),
                RegisterField(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  prefixWithDivider: true,
                  thinBorder: true,
                  hintText: 'email',
                  controller: loginCubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: loginCubit.emailValidator,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return RegisterField(
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      prefixWithDivider: true,
                      thinBorder: true,
                      hintText: 'password',
                      obsecureText: loginCubit.securePassword,
                      controller: loginCubit.passwordController,
                      validator: loginCubit.passwordValidator,
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginCubit.securePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
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
                          Helper.setUserTypeToVerification(
                            isCustomerRegister ? 'customer' : 'vendor',
                          );
                          context.router.push(
                            const ForgetPasswordRouter(),
                          );
                        },
                        child: Text(
                          'forgot_password'.translate,
                          style:
                              Theme.of(context).textTheme.headline3?.copyWith(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(13),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                const BoxHelper(
                  height: 40,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const LoaderWidget();
                    }
                    return SizedBox(
                      height: ScreenUtil().setHeight(55),
                      child: RegisterButton(
                        title: 'login',
                        onPressed: () => loginCubit.login(
                          context,
                          formKey,
                          isUserRegistered: isCustomerRegister,
                        ),

                        // onPressed: () => loginCubit.login(context),
                        color: Colors.orangeAccent,
                        radius: 10,
                      ),
                    );
                  },
                ),

                AuthFooterText(
                  userType: isCustomerRegister ? 0 : 1,
                ),
                // const OrWidget(),
                // RegisterButton(
                //   title: 'create_new_acc',
                //   onPressed: () {
                //     // NavigationService.push(
                //     //   page: ChooseUserTypeScreen.routeName,
                //     // );
                //     context.router.push(
                //       const ChooseTypeRouter(),
                //     );
                //   },
                //   color: Colors.deepOrange,
                //   radius: 10,
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

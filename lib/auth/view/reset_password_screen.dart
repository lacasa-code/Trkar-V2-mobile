import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/auth/view/widgets/header_widget.dart';
import 'package:trkar/core/components/circle_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/router/router.gr.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/reset_password';

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var securePassword = true;
  var securePasswordConfirmation = true;

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
                  SizedBox(
                    height: ScreenUtil().setHeight(55),
                    child: RegisterButton(
                      title: 'confirm',
                      radius: 10,
                      onPressed: () {
                        context.router.pushAndPopUntil(
                          const SplashRouter(),
                          predicate: (_) => false,
                        );
                      },
                    ),
                  ),
                ],
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

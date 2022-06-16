import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/auth/view/widgets/header_widget.dart';
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
      body: SingleChildScrollView(
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
                height: 50,
              ),
              const HeaderWidget(
                title: 'forget_password',
              ),
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       TextSpan(
              //         text: 'dont_worry'.translate,
              //         style: Theme.of(context).textTheme.bodyText2,
              //       ),
              //       TextSpan(),
              //     ],
              //   ),
              // ),

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
                    securePassword ? Icons.visibility_off : Icons.visibility,
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
                      securePasswordConfirmation = !securePasswordConfirmation;
                    });
                  },
                ),
              ),
              const BoxHelper(
                height: 30,
              ),
              RegisterButton(
                title: 'save',
                radius: 10,
                onPressed: () {
                  context.router.pushAndPopUntil(
                    SplashRouter(),
                    predicate: (_) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trkar/auth/view/widgets/header_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart'
;
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
              Image.asset(
                'assets/icons/trkarLogoWhite.png',
                // alignment: Al,
              ),
              const BoxHelper(
                height: 50,
              ),
              const HeaderWidget(
                title: 'forget_password',
              ),
              const BoxHelper(
                height: 20,
              ),
              RegisterField(
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
               context.router.pushAndPopUntil(SplashRouter(), predicate: (_)=>false,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

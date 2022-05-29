import 'package:flutter/material.dart';
import 'package:trkar/auth/view/email_verfication_screen.dart';
import 'package:trkar/auth/view/widgets/header_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/router/router.gr.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forget_password';

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //     'forget_password'.translate,
      //   ),
      // ),
      body: SingleChildScrollView(
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
              footer: 'enter_email',
            ),
            const RegisterField(
              hintText: 'email',
            ),
            const BoxHelper(
              height: 10,
            ),
            RegisterButton(
              title: 'send_message',
              onPressed: () {
                context.router.pushAndPopUntil(
                  EmailVerficationRouter(stateOfVerfication: 2),
                  predicate: (_) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

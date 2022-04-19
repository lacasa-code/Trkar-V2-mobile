import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trkar/auth/view/reset_password_screen.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/themes/themes.dart';
import '../../core/components/sized_box_helper.dart';
import '../../core/extensions/string.dart';

class EmailVerficationScreen extends StatefulWidget {
  const EmailVerficationScreen({
    Key? key,
    this.stateOfVerfication = 0,
  }) : super(key: key);
  final int stateOfVerfication;
  static const routeName = '/email_verfication';

  @override
  _EmailVerficationScreenState createState() => _EmailVerficationScreenState();
}

class _EmailVerficationScreenState extends State<EmailVerficationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'email_verfication_desc'.translate,
              style: MainTheme.headerStyle4,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: PinCodeTextField(
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                pinTheme: PinTheme(
                  inactiveColor: const Color(0xffa3a3a3),
                  activeColor: const Color(0xffa3a3a3),
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                ),
                appContext: context,
                length: 6,
                onChanged: (v) {},
                onCompleted: (v) {
                  var arg = ModalRoute.of(context)?.settings.arguments;

                  NavigationService.pushReplacementAll(
                    page: arg == 1 ? ResetPasswordScreen.routeName : '/',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/core/themes/themes.dart';
import '../../core/components/sized_box_helper.dart';
import '../../core/extensions/string.dart';

class EmailVerficationScreen extends StatefulWidget {
  const EmailVerficationScreen({
    Key? key,
    this.stateOfVerfication = 0,
    this.phoneNumber,
  }) : super(key: key);

  ///0 => customer_register 1=> vendor_register .. 2=> reset
  final int stateOfVerfication;
  final String? phoneNumber;
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
            child: widget.stateOfVerfication == 1
                ? Column(
                    children: [
                      Text(
                        'phone_verfication_header'.translate,
                        style: MainTheme.headerStyle4
                            .copyWith(fontSize: ScreenUtil().setSp(16)),
                        textAlign: TextAlign.center,
                      ),
                      const BoxHelper(
                        height: 10,
                      ),
                      Text(
                        '${'phone_verfication_body'.translate} : \n ${widget.phoneNumber?.replaceRange(0, 6, '*****')}',
                        style: MainTheme.headerStyle4.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: ScreenUtil().setSp(13),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Text(
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
                  // TODO : check if there argument in auto_route
                  // var arg = ModalRoute.of(context)?.settings.arguments;
                  context.router.pushAndPopUntil(
                      widget.stateOfVerfication == 1
                          ? const ResetPasswordRouter()
                          : const SplashRouter(),
                      predicate: (_) => false);
                  // NavigationService.pushReplacementAll(
                  //   page: arg == 1 ? ResetPasswordScreen.routeName : '/',
                  // );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

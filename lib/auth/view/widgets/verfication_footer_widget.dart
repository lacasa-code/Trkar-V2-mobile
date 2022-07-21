import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/auth/view/widgets/auth_choose_type_dialog.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../../core/extensions/string.dart';

class VerificationFooterText extends StatelessWidget {
  const VerificationFooterText({
    Key? key,
    required this.onResendPressed,
  }) : super(key: key);
  final void Function() onResendPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: '${'didnt_get_code'.translate} ',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  log('reg');
                  onResendPressed();
                },
              text: 'resend_code'.translate.toTitleCase,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: ScreenUtil().setSp(15),
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

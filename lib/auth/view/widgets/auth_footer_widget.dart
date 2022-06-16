import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/auth/view/widgets/auth_choose_type_dialog.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../../core/extensions/string.dart';

class AuthFooterText extends StatelessWidget {
  const AuthFooterText({
    Key? key,
    this.isLogin = true,
  }) : super(key: key);
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  '${(isLogin ? 'dont_have_acc' : 'have_acc').translate.toTitleCase} ',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (!isLogin) {
                    context.router.pop();
                    return;
                  }
                  showDialog(
                    context: context,
                    builder: (c) => AuthChooseTypeDialog(
                      isLogin: false,
                      onVendorButtonPressed: () {
                        context.router.pop();
                        context.router.push(
                          RegisterRouter(userType: 1),
                        );
                      },
                      onCustomerButtonPressed: () {
                        context.router.pop();

                        context.router.push(
                          RegisterRouter(userType: 0),
                        );
                      },
                    ),
                  );
                },
              text: (!isLogin ? 'login' : 'create_acc').translate.toTitleCase,
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

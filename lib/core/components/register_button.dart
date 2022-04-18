import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'sized_box_helper.dart';

import '../themes/themes.dart';
import '../extensions/media_query.dart';
import '../extensions/string.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.removePadding = false,
    this.icon,
    this.color,
    this.radius = 30,
  }) : super(key: key);
  final String title;
  final void Function() onPressed;
  final bool removePadding;
  final Widget? icon;
  final Color? color;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: removePadding
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        width: context.width,
        height: ScreenUtil().setHeight(50),
        child: ElevatedButton.icon(
          icon: icon ?? const BoxHelper(),
          label: FittedBox(
            child: Text(
              title.translate,
              style: MainTheme.buttonStyle,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                color ?? Theme.of(context).primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

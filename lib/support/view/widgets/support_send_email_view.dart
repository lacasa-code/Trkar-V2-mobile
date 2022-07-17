import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/themes/screen_utility.dart';
import '../.../../../../core/extensions/string.dart';

class SupportSendEmailView extends StatelessWidget {
  const SupportSendEmailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: ScreenUtil().radius(35),
            backgroundColor: MainStyle.lightOrangColor,
            child: Icon(
              Icons.email_outlined,
              color: MainStyle.darkOrangeColor,
              size: ScreenUtil().radius(35),
            ),
          ),
          const BoxHelper(
            height: 7,
          ),
          Text(
            'send_us_email'.translate,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontSize: ScreenUtil().setSp(15),
                  fontWeight: FontWeight.bold,
                ),
          ),
          const BoxHelper(
            height: 7,
          ),
          Text(
            'info@trkar.com',
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontSize: ScreenUtil().setSp(15),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

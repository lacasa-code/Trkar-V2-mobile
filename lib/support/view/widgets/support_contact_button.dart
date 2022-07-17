import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/core/themes/screen_utility.dart';
import '../../../core/extensions/string.dart';

class SupportContactButton extends StatelessWidget {
  const SupportContactButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.leadingSvgName,
  }) : super(key: key);
  final void Function() onPressed;
  final String title;
  final String leadingSvgName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: MainStyle.lightOrangColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: MainStyle.deepOrangColor,
          ),
        ),
        child: ListTile(
          leading: SvgPicture.asset(
            'assets/icons/svg/$leadingSvgName.svg',
            width: ScreenUtil().setWidth(30),
          ),
          title: Text(
            title.translate,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.bold,
                ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: ScreenUtil().radius(15),
          ),
        ),
      ),
    );
  }
}

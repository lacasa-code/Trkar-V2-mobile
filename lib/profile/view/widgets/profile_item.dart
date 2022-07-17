import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/themes/screen_utility.dart';

import '../../../core/extensions/string.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    @required this.onPressed,
    required this.title,
    this.svgPictureName,
    this.icons,
    this.showForwardIcon = true,
  }) : super(key: key);
  final void Function()? onPressed;
  final String title;
  final String? svgPictureName;
  final IconData? icons;
  final bool showForwardIcon;
  @override
  Widget build(BuildContext context) {
    // assert(icons == null && svgPictureName == null,
    //     'either icons or svgPictureName mustn\'t be null');
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: InkWell(
        onTap: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(horizontal: 0),
          leading: svgPictureName != null
              ? SvgPicture.asset(
                  'assets/icons/svg/$svgPictureName.svg',
                  // color: Colors.black,
                  // color: Colors.red,
                  alignment: Alignment.center,
                )
              : Icon(
                  icons,
                  color: Colors.black,
                ),
          title: Text(
            title.translate,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Visibility(
            visible: showForwardIcon,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).primaryIconTheme.color,
              size: ScreenUtil().radius(15),
            ),
          ),
        ),
      ),
    );
  }
}

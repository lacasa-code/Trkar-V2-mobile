import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/helper/helper.dart';

import '../../../core/extensions/string.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    @required this.onPressed,
    required this.title,
    required this.icons,
    this.showDivider = true,
  }) : super(key: key);
  final void Function()? onPressed;
  final String title;
  final IconData icons;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: ListTile(
            leading: Icon(
              icons,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              title.translate,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
        ),
        Visibility(
          visible: showDivider,
          child: const Divider(
            thickness: 1.1,
            // color: Colors.black,
          ),
        ),
      ],
    );
  }
}

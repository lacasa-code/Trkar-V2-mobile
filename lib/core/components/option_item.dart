import 'package:flutter/material.dart';

import '../extensions/string.dart';
import '../../../core/themes/screen_utility.dart';
import '../../../core/themes/themes.dart';
import 'sized_box_helper.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    Key? key,
    required this.icons,
    required this.onPressed,
    required this.title,
    this.showDivider = true,
  }) : super(key: key);
  final String title;
  final dynamic icons;
  final void Function() onPressed;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                icons.runtimeType == String
                    ? ImageIcon(
                        AssetImage(
                          icons,
                        ),
                        color: MainStyle.darkGreyColor,
                      )
                    : Icon(
                        icons,
                        color: MainStyle.darkGreyColor,
                      ),
                const BoxHelper(
                  width: 10,
                ),
                Text(
                  title.translate,
                  style: MainTheme.headerStyle4,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            thickness: 2,
            color: MainStyle.darkGreyColor,
          ),
      ],
    );
  }
}

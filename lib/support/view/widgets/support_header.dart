import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/extensions/string.dart';
import 'package:trkar/core/components/sized_box_helper.dart';


class SupportHeader extends StatelessWidget {
  const SupportHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/svg/support.svg',
          ),
          const BoxHelper(
            height: 15,
          ),
          Text(
            'how_can_help'.translate,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
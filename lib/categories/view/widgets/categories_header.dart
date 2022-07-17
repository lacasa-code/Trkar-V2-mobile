import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/extensions/string.dart';


class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    Key? key,
    required this.isGrid,
    required this.onPressed,
    required this.title,
  }) : super(key: key);
  final bool isGrid;
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.translate,
            style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/svg/${isGrid ? 'grid' : 'list'}-categories.svg',
            ),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}



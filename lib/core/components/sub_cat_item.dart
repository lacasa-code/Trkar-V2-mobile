import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/helper/helper.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({
    Key? key,
    this.title,
    this.imagePath,
  }) : super(key: key);
  final String? imagePath;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: ScreenUtil().setWidth(100),
      child: Column(
        children: [
          Image.network(
            Helper.storageDomainUrl + (imagePath ?? ''),
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(100),
            errorBuilder: (_, __, ___) => Image.asset(
              'assets/images/301.png',
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(100),
            ),
          ),
          Text(
            title ?? 'Cat Name',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

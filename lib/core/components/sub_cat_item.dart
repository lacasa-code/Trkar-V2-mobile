import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Column(
      children: [
        Image.asset(
          'assets/images/301.png',
          height: ScreenUtil().setHeight(100),
          width: ScreenUtil().setWidth(100),
        ),
        const Text(
          'Cat Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

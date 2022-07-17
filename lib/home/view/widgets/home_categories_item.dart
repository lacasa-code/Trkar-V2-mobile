import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
    Key? key,
    this.imagePath,
    this.title,
    this.onTap,
  }) : super(key: key);
  final String? title;
  final String? imagePath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeInImage(
                placeholder: const AssetImage(
                  'assets/icons/trkarLogoWhite.png',
                ),
                image: NetworkImage(imagePath ?? ''),
                width: ScreenUtil().setWidth(100),
                height: ScreenUtil().setHeight(100),
                fit: BoxFit.cover,
                imageErrorBuilder: (_, __, st) {
                  log('$st');

                  return Image.asset(
                    'assets/icons/trkarLogoWhite.png',
                    width: ScreenUtil().setWidth(75),
                    height: ScreenUtil().setHeight(75),
                    // width: context.width * 0.25,

                    // height: context.height * 0.1,
                    // alignment: Al,
                  );
                },
              ),
              // const BoxHelper(
              //   width: 10,
              // ),
              // const BoxHelper(
              //   height: 15,
              // ),
              SizedBox(
                width: ScreenUtil().setWidth(200),
                child: Text(
                  title ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

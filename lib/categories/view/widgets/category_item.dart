import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/helper/helper.dart';

import '../../../core/extensions/media_query.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    @required this.onPressed,
    @required this.categoryName,
    @required this.categoryImage,
  }) : super(key: key);
  final void Function()? onPressed;
  final String? categoryName;
  final String? categoryImage;

  @override
  Widget build(BuildContext context) {
    var isImageAvailable = true;
    return StatefulBuilder(builder: (context, setState) {
      return InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: context.height * 0.23,
                width: context.width * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: isImageAvailable
                        ? NetworkImage(
                            '$categoryImage',
                          )
                        : const AssetImage(
                            'assets/images/cars.jpeg',
                          ) as ImageProvider,
                    fit: BoxFit.cover,
                    onError: (obj, stack) {
                      setState(() {
                        isImageAvailable = false;
                      });
                    },
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: context.height * 0.05,
                    width: double.infinity,
                    color: Colors.black45,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      '$categoryName',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(13)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

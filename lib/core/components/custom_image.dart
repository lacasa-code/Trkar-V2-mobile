import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    this.pickedImage,
    this.networkImage,
    this.onRemoved,
  }) : super(key: key);
  final File? pickedImage;
  final String? networkImage;

  final void Function()? onRemoved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: pickedImage == null
                ? Image.network(
                    networkImage!,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/icons/edit_note.png',
                      height: ScreenUtil().setHeight(75),
                      width: ScreenUtil().setWidth(75),
                      fit: BoxFit.cover,
                    ),
                    fit: BoxFit.cover,
                    height: ScreenUtil().setHeight(75),
                    width: ScreenUtil().setWidth(75),
                  )
                : Image.file(
                    pickedImage!,
                    fit: BoxFit.cover,
                    height: ScreenUtil().setHeight(75),
                    width: ScreenUtil().setWidth(75),
                  ),
          ),
          Positioned(
            top: -ScreenUtil().setHeight(5),
            right: -ScreenUtil().setHeight(5),
            left: -ScreenUtil().setHeight(5),
            child: Visibility(
              visible: onRemoved != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: onRemoved,
                    child: CircleAvatar(
                      radius: ScreenUtil().radius(10),
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: ScreenUtil().radius(13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

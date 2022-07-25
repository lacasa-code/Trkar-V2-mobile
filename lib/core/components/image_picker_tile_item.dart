import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/vendor/createProduct/model/product_images_model.dart';
import '../themes/screen_utility.dart';
import '../../../core/extensions/string.dart';
import 'custom_image.dart';
import 'sized_box_helper.dart';

class ImagePickerTileItem extends StatelessWidget {
  const ImagePickerTileItem({
    Key? key,
    this.title,
    this.optionalTitle,
    this.headerTextSize,
    this.normalText = false,
    required this.onPickImagePressed,
    required this.onRemoved,
    required this.images,
  }) : super(key: key);
  final String? title;
  final String? optionalTitle;
  final num? headerTextSize;
  final bool normalText;
  final void Function() onPickImagePressed;
  final void Function(int) onRemoved;
  final List<ProductImagesModel> images;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                // horizontal: 15,
                // vertical: 5,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title?.translate ?? '',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: ScreenUtil().setSp(headerTextSize ?? 12),
                        fontWeight: !normalText && headerTextSize != null
                            ? FontWeight.bold
                            : null,
                      ),
                ),
                Visibility(
                  visible: images.isNotEmpty,
                  child: InkWell(
                    onTap: onPickImagePressed,
                    child: Row(
                      children: [
                        Text(
                          'add_more'.translate,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: ScreenUtil().setSp(15),
                                    color: Theme.of(context).primaryColor,
                                    fontWeight:
                                        !normalText && headerTextSize != null
                                            ? FontWeight.bold
                                            : null,
                                  ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                          ),
                          color: Theme.of(context).primaryColor,
                          iconSize: ScreenUtil().setSp(15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: MainStyle.lightGreyColor,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(
              // horizontal: 15,
              vertical: 10,
            ),
            padding: const EdgeInsets.symmetric(
              // horizontal: 15,
              vertical: 20,
            ),
            child: images.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        images.length,
                        (index) => CustomImage(
                          onRemoved: () {
                            log('delete');
                            onRemoved(index);
                          },
                          pickedImage: images[index].pickedFile,
                          networkImage: images[index].networkImage,
                        ),
                      ).toList(),
                    ),
                  )
                : Row(
                    children: [
                      InkWell(
                        onTap: onPickImagePressed,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            // vertical: 5,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: MainStyle.newGreyColor,
                                size: ScreenUtil().setSp(15),
                              ),
                              const BoxHelper(
                                width: 5,
                              ),
                              Text(
                                'pick_images'.translate,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MainStyle.newGreyColor,
                                  fontSize: ScreenUtil().setSp(15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}

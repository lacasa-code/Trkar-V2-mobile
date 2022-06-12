import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/option_item.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import '../../../../core/themes/screen_utility.dart';
import '../../../../core/themes/themes.dart';
import 'package:auto_route/auto_route.dart';

class MyProductWidget extends StatelessWidget {
  const MyProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: ,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: MainStyle.lightGreyColor,
          width: 0.5,
        ),
        color: MainStyle.lightSilverColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(width: 0.5, color: MainStyle.darkGreyColor)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(
                'assets/images/profile_cover.jpg',
                height: ScreenUtil().setHeight(70),
                width: ScreenUtil().setWidth(80),
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Image.asset(
                  'assets/images/profile_cover.jpg',
                  height: ScreenUtil().setHeight(70),
                  width: ScreenUtil().setWidth(80),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const BoxHelper(
            width: 10,
          ),
          SizedBox(
            width: ScreenUtil().setWidth(210),
            child: Builder(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Title',
                        style: MainTheme.headerStyle4,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (_) => ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    topLeft: Radius.circular(25),
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      OptionItem(
                                        title: 'edit',
                                        icons: 'assets/icons/edit_note.png',
                                        onPressed: () {
                                          context.router.pop();
                                        },
                                      ),
                                      OptionItem(
                                        title: 'delete',
                                        icons: Icons.delete_outline,
                                        onPressed: () {
                                          context.router.pop();
                                        },
                                        showDivider: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.more_horiz,
                          color: MainStyle.darkGreyColor,
                        ),
                      ),
                    ],
                  ),
                  const BoxHelper(
                    height: 5,
                  ),
                  Text(
                    '${Random().nextInt(2000)} EGP',
                    style: MainTheme.headerStyle3,
                    textAlign: TextAlign.start,
                  ),
                  const BoxHelper(
                    height: 5,
                  ),
                  Text(
                    'ProductDescription ProductDescription ProductDescription ProductDescription ProductDescription ProductDescription',
                    style: MainTheme.subTextStyleLite,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    children: [
                      // ProductFeatures(
                      //   title: product?.views ?? '15',
                      //   icons: Icons.visibility_outlined,
                      // ),
                      // const BoxHelper(
                      //   width: 5,
                      // ),
                      // ProductFeatures(
                      //   title:
                      //       product?.contactsCount?.length.toString() ?? '13',
                      //   icons: Icons.call,
                      // ),
                      // const BoxHelper(
                      //   width: 5,
                      // ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/helper/helper.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    @required this.onPressed,
    @required this.categoryName,
    @required this.categoryImage,
    this.isListView = false,
  }) : super(key: key);
  final void Function()? onPressed;
  final String? categoryName;
  final String? categoryImage;
  final bool isListView;

  @override
  Widget build(BuildContext context) {
    log('image is =>$categoryImage');
    return InkWell(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        margin: isListView
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            : null,
        elevation: 4,
        child: Padding(
          padding: isListView
              ? const EdgeInsets.symmetric(vertical: 10, horizontal: 15)
              : EdgeInsets.zero,
          child: isListView
              ? ListTile(
                  leading: Image.network(
                    Helper.storageDomainUrl + (categoryImage ?? ''),
                    fit: BoxFit.cover,
                    width: ScreenUtil().setWidth(55),
                    errorBuilder: (_, __, ___) => Image.asset(
                      'assets/images/cars.jpeg',
                    ),
                  ),
                  title: Text(
                    categoryName ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      Helper.storageDomainUrl + (categoryImage ?? ''),
                      fit: BoxFit.cover,
                      // width: double.infinity,
                      height: ScreenUtil().setHeight(100),
                      errorBuilder: (_, __, ___) => Image.asset(
                        'assets/images/cars.jpeg',
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: ScreenUtil().setWidth(120),
                            child: Text(
                              categoryName ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                    // InkWell(
                    //   child: ListTile(
                    //       // leading: Image.network(
                    //       //   categoryImage ?? '',
                    //       //   fit: BoxFit.cover,
                    //       //   width: ScreenUtil().setWidth(55),
                    //       //   errorBuilder: (_, __, ___) => Image.asset(
                    //       //     'assets/images/cars.jpeg',
                    //       //   ),
                    //       // ),
                    //       // title: Text(
                    //       //   categoryName ?? '',
                    //       //   overflow: TextOverflow.ellipsis,
                    //       //   style: const TextStyle(
                    //       //     color: Colors.black,
                    //       //     fontWeight: FontWeight.bold,
                    //       //   ),
                    //       // ),
                    //       // trailing: const Icon(
                    //       //   Icons.arrow_forward_ios,
                    //       //   color: Colors.black,
                    //       // ),
                    //       ),

                    //   // child: Padding(
                    //   //   padding: const EdgeInsets.symmetric(
                    //   //     horizontal: 5,
                    //   //     vertical: 5,
                    //   //   ),
                    //   //   child: Card(
                    //   //     shape: RoundedRectangleBorder(
                    //   //       borderRadius: BorderRadius.circular(25),
                    //   //     ),
                    //   //     elevation: 8,
                    //   //     child: ClipRRect(
                    //   //       borderRadius: BorderRadius.circular(25),
                    //   //       child: Container(
                    //   //         height: context.height * 0.23,
                    //   //         width: context.width * 0.45,
                    //   //         decoration: BoxDecoration(
                    //   //           image: DecorationImage(
                    //   //             image: isImageAvailable
                    //   //                 ? NetworkImage(
                    //   //                     '$categoryImage',
                    //   //                   )
                    //   //                 : const AssetImage(
                    //   //                     'assets/images/cars.jpeg',
                    //   //                   ) as ImageProvider,
                    //   //             fit: BoxFit.cover,
                    //   //             onError: (obj, stack) {
                    //   //               setState(() {
                    //   //                 isImageAvailable = false;
                    //   //               });
                    //   //             },
                    //   //           ),
                    //   //         ),
                    //   //         child: Align(
                    //   //           alignment: Alignment.bottomCenter,
                    //   //           child: Container(
                    //   //             height: context.height * 0.05,
                    //   //             width: double.infinity,
                    //   //             color: Colors.black45,
                    //   //             padding:
                    //   //                 const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    //   //             child: Text(
                    //   //               '$categoryName',
                    //   //               textAlign: TextAlign.start,
                    //   //               overflow: TextOverflow.ellipsis,
                    //   //               style: TextStyle(
                    //   //                   color: Colors.white,
                    //   //                   fontSize: ScreenUtil().setSp(13)),
                    //   //             ),
                    //   //           ),
                    //   //         ),
                    //   //       ),
                    //   //     ),
                    //   //   ),
                    //   // ),
                    // ),
                    // Visibility(
                    //   visible: showDivider,
                    //   child: const Divider(
                    //     thickness: 1.1,
                    //     // color: Colors.black,
                    //   ),
                    // ),
                  ],
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    Key? key,
    this.imagePath,
  }) : super(key: key);
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: ScreenUtil().setWidth(170),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                imagePath ?? 'assets/icons/trkarLogoWhite.png',
                width: ScreenUtil().setWidth(80),
                height: ScreenUtil().setHeight(80),
                fit: BoxFit.cover,
              ),
              const BoxHelper(
                width: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(240),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Article Number: 2324',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        const BoxHelper(
                          height: 10,
                        ),
                        const Text(
                          'ProductName',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // color: Colors.black54,
                          ),
                        ),
                        const BoxHelper(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'SR32',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const BoxHelper(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red,
                                      ),
                                      // shape: RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(10),
                                      // ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 2,
                                      ),

                                      child: const Text(
                                        '37%',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'SR60',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(17),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Helper.appAlignment,
                              child: const Card(
                                elevation: 5,
                                color: Colors.blue,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const BoxHelper(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

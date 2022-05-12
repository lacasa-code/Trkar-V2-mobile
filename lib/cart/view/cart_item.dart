import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    this.imagePath,
  }) : super(key: key);
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    var quantity = 1;
    var isFav = false;
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
              Column(
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                      icon: Icon(
                        isFav == true ? Icons.star : Icons.star_border,
                        color: isFav == true
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      imagePath ?? 'assets/icons/trkarLogoWhite.png',
                      width: ScreenUtil().setWidth(80),
                      height: ScreenUtil().setHeight(80),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
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
                                      padding: const EdgeInsets.symmetric(
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
                            StatefulBuilder(builder: (context, setState) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (quantity == 1) {
                                        return;
                                      }
                                      setState(() {
                                        quantity--;
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: ScreenUtil().radius(15),
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      '$quantity',
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: RegisterField(
                                  //     keyboardType: TextInputType.phone,
                                  //     formatters: [
                                  //       FilteringTextInputFormatter
                                  //           .digitsOnly,
                                  //     ],
                                  //     removePadding: true,
                                  //     thinBorder: true,
                                  //   ),
                                  //   // flex: 2,
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: ScreenUtil().radius(15),
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ].reversed.toList(),
                              );
                            }),
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

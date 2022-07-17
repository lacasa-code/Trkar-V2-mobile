import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/sized_box_helper.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    this.imagePath,
    this.canAddToCart = true,
  }) : super(key: key);
  final String? imagePath;
  final bool canAddToCart;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: ScreenUtil().setWidth(170),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffF3F4F5),
                    width: 2,
                  ),
                  left: BorderSide(
                    color: Color(0xffF3F4F5),
                    width: 2,
                  ),
                  right: BorderSide(
                    color: Color(0xffF3F4F5),
                    width: 2,
                  ),
                ),
              ),
              child: Image.asset(
                imagePath ?? 'assets/images/oil3.jpg',
                width: double.infinity,
                height: ScreenUtil().setHeight(150),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // const BoxHelper(
          //   height: 10,
          // ),
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Article Number: 2324',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const BoxHelper(
                    height: 10,
                  ),
                  const Text(
                    'ProductName',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.black45,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SR32',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                      Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: Colors.red,
                        label: const Text(
                          '37% OFF',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const Text(
                  //   'SR60',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // const BoxHelper(
                  //   height: 10,
                  // ),
                  Visibility(
                    visible: canAddToCart,
                    child: SizedBox(
                      width: ScreenUtil().setWidth(135),
                      height: ScreenUtil().setHeight(52),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: RegisterButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          radius: 14,
                          title: 'add_to_cart',
                          onPressed: () {},
                        ),
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

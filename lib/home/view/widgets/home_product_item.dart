import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/sized_box_helper.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({
    Key? key,
    this.imagePath,
  }) : super(key: key);
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().setWidth(170),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  imagePath ?? 'assets/images/oil3.jpg',
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(150),
                  fit: BoxFit.cover,
                ),
              ),
              const BoxHelper(
                height: 10,
              ),
              const Text(
                'Article Number: 2324',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
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
                children: [
                  const Text(
                    'SR32',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                  const BoxHelper(
                    width: 10,
                  ),
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.red,
                    label: const Text(
                      '37%',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                'SR60',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const BoxHelper(
                height: 10,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(135),
                child: const Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
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

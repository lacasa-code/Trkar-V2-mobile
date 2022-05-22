import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../../core/extensions/string.dart';

class CarAccessoriesScreen extends StatefulWidget {
  const CarAccessoriesScreen({Key? key}) : super(key: key);
  static const routeName = '/car-accessories';

  @override
  State<CarAccessoriesScreen> createState() => _CarAccessoriesScreenState();
}

class _CarAccessoriesScreenState extends State<CarAccessoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            NavigationService.goBack();
          },
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'car_accessories'.translate,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                'car_accessories_header'.translate,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                'car_accessories_body'.translate,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

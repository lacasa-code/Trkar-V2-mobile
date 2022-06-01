import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/components/home_product_item.dart';
import '../../../core/extensions/string.dart';

class RecentlyViewedProductsView extends StatelessWidget {
  const RecentlyViewedProductsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Helper.appAlignment,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'recently_viewed'.translate,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(15),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3,
                (index) => ProductItem(
                  imagePath: 'assets/images/oil${index + 1}.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

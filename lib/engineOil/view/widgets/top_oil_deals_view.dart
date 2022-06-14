import 'package:flutter/material.dart';
import 'package:trkar/core/components/home_product_item.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import '../../../core/extensions/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TopOilDealsView extends StatelessWidget {
  const TopOilDealsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'top_oil_deals'.translate,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Text(
            'top_oil_deals_body'.translate,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const BoxHelper(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              6,
              (index) => const ProductItem(),
            ),
          ),
        ),
      ],
    );
  }
}

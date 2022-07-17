import 'package:flutter/material.dart';
import 'package:trkar/core/components/home_product_item.dart';
import 'package:trkar/core/components/section_header_item.dart';
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
        SectionHeaderItem(
          title: 'top_oil_deals'.translate,
          onViewAllPressed: () {},
          showViewAll: true,
        ),
        Wrap(
          children: List.generate(
            6,
            (index) => const ProductItem(),
          ),
        ),
      ],
    );
  }
}

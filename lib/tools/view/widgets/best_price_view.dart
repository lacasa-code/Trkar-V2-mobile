import 'package:flutter/material.dart';
import 'package:trkar/core/components/home_product_item.dart';
import '../../../core/extensions/string.dart';
import '../../../core/components/sized_box_helper.dart';


class BestPriceView extends StatelessWidget {
  const BestPriceView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BoxHelper(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'tools_best_price'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'tools_best_price_desc'.translate,
            ),
          ),
          const BoxHelper(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: List.generate(
                8,
                (index) => const ProductItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

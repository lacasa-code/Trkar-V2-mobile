import 'package:flutter/material.dart';
import 'package:trkar/core/components/home_product_item.dart';
import '../../../core/extensions/string.dart';
import '../../../core/components/sized_box_helper.dart';



class PopularToolsView extends StatelessWidget {
  const PopularToolsView({
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
              'popular_tools'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/extensions/string.dart';
import 'package:trkar/core/components/home_product_item.dart';
import 'package:trkar/core/components/sized_box_helper.dart';


class TopFiltersSellers extends StatelessWidget {
  const TopFiltersSellers({
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
              'top_sellers_filters'.translate,
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

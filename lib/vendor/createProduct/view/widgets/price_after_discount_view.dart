import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/vendor/createProduct/viewModel/createProduct/create_product_cubit.dart';

import '../../../../core/components/sized_box_helper.dart';
import '../../../../core/extensions/string.dart';
import 'create_product_price_view.dart';

class CreateProductPriceAfterDiscountTile extends StatelessWidget {
  const CreateProductPriceAfterDiscountTile({
    Key? key,
    required this.createProductCubit,
  }) : super(key: key);
  final CreateProductCubit createProductCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BoxHelper(
          height: 10,
        ),
        Text(
          'price_after_discount'.translate,
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(15),
              ),
        ),
        const BoxHelper(
          height: 10,
        ),
        CreateProductPriceField(
          maxLength: 2,
          validation: createProductCubit.priceAfterDiscountValidate,
          controller: createProductCubit.priceAfterDiscountController,
          suffixText: '%',
        ),
      ],
    );
  }
}

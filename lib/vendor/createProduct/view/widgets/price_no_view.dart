import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/register_field.dart';
import '../../../../core/components/sized_box_helper.dart';
import '../../../../core/extensions/string.dart';


class ProductNoView extends StatelessWidget {
  const ProductNoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BoxHelper(
          height: 10,
        ),
        Text(
          'product_no'.translate,
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(15),
              ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: const [
              Expanded(
                child: RegisterField(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  removePadding: true,
                ),
              ),
              BoxHelper(
                width: 10,
              ),
              Expanded(
                child: RegisterField(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  removePadding: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
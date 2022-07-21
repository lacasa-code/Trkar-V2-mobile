import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/components/sized_box_helper.dart';
import '../../../core/extensions/string.dart';

class PaymentMethodEmptyView extends StatelessWidget {
  const PaymentMethodEmptyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BoxHelper(
          height: 150,
        ),
        SvgPicture.asset(
          'assets/icons/svg/payment-method.svg',
        ),
        const BoxHelper(
          height: 10,
        ),
        Text(
          'payment_method'.translate,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(18),
              ),
        ),
        const BoxHelper(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'payment_method_body'.translate,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: ScreenUtil().setSp(14),
                ),
          ),
        ),
      ],
    );
  }
}

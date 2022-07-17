import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/string.dart';


class OnlinePayment extends StatelessWidget {
  const OnlinePayment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'online_payment'.translate.toTitleCase,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: 1,
            onChanged: (v) {},
            title: const Text(
              'MyFatoorah',
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: 1,
            onChanged: (v) {},
            title: const Text(
              'Hyper Pay',
            ),
          ),
        ],
      ),
    );
  }
}


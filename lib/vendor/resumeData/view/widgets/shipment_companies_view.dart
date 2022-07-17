import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/string.dart';

class ShipmentCompaniesView extends StatelessWidget {
  const ShipmentCompaniesView({
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
              'shipment_companies'.translate.toTitleCase,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'shipment_companies_helper'.translate.toCapitalized(),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
              ),
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: 1,
            onChanged: (v) {},
            title: const Text(
              'Marine Logistic',
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: 1,
            onChanged: (v) {},
            title: const Text(
              'DHL',
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: 1,
            onChanged: (v) {},
            title: const Text(
              'MSC',
            ),
          ),
        ],
      ),
    );
  }
}

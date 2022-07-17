import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/map_dialog.dart';
import '../../../../core/extensions/string.dart';

class ShipmentRecipetLocationView extends StatelessWidget {
  const ShipmentRecipetLocationView({
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
              'shipment_recipet_location'.translate.toTitleCase,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'shipment_recipet_location_helper'.translate.toCapitalized(),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
              ),
            ),
          ),
          MapDialog(
            onPickedLocation: (v, a) {},
            thinBorder: true,
            showOKButton: false,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/components/register_field.dart';
import '../../../core/components/sized_box_helper.dart';
import '../../../core/extensions/string.dart';



class ExpiryDateFieldView extends StatelessWidget {
  const ExpiryDateFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        height: ScreenUtil().setHeight(50),
        child: Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(60),
                  child: RegisterField(
                    removePadding: true,
                    keyboardType: TextInputType.phone,
                    noLocalHintText: 'YY',
                    textAlign: TextAlign.center,
                    maxLength: 2,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    thinBorder: true,
                  ),
                ),
                const BoxHelper(
                  width: 15,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(60),
                  child: RegisterField(
                    textAlign: TextAlign.center,
                    removePadding: true,
                    keyboardType: TextInputType.phone,
                    noLocalHintText: 'MM',
                    maxLength: 2,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    thinBorder: true,
                  ),
                ),
              ],
            ),
            const BoxHelper(
              width: 20,
            ),
            Text(
              'expiry_date'.translate,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

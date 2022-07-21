import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/sized_box_helper.dart';
import '../../../core/themes/screen_utility.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    Key? key,
    this.isCancelled = false,
  }) : super(key: key);
  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/oil3.jpg',
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(80),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const BoxHelper(
              width: 10,
            ),
            SizedBox(
              width: ScreenUtil().setWidth(200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Double coin',
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: ScreenUtil().setSp(13),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const BoxHelper(
                    height: 5,
                  ),
                  Text(
                    'Apr 14.2022',
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: ScreenUtil().setSp(13),
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const BoxHelper(
                    height: 5,
                  ),
                  Text(
                    'Order Code: OFP20-TOONTV',
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: ScreenUtil().setSp(13),
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const BoxHelper(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: MainStyle.lightGreyColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          isCancelled ? 'Cancelled' : 'Completed',
                          style: TextStyle(
                            color: isCancelled ? Colors.red : Color(0xff2326A0),
                            fontSize: ScreenUtil().setSp(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

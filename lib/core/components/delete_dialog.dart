import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extensions/string.dart';
import './register_button.dart';
import './sized_box_helper.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    Key? key,
    required this.onDeleted,
  }) : super(key: key);
  final void Function() onDeleted;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/svg/vendor/delete.svg',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'delete'.translate,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: ScreenUtil().setSp(16),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'delete_confirm'.translate,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: ScreenUtil().setSp(15),
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            const BoxHelper(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(55),
                  width: ScreenUtil().setWidth(125),
                  child: RegisterButton(
                    color: Colors.red,
                    radius: 12,
                    title: 'delete',
                    isDeleteButton: true,
                    removeElevation: true,
                    onPressed: () {
                      AutoRouter.of(context).pop();
                      onDeleted();
                    },
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(55),
                  width: ScreenUtil().setWidth(125),
                  child: RegisterButton(
                    color: Colors.white,
                    isDeleteButton: true,
                    radius: 12,
                    title: 'cancel',
                    removeElevation: true,
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extensions/string.dart';
import './register_button.dart';
import './sized_box_helper.dart';

enum ResultType {
  success,
  failed,
  error,
  none,
}

class ResultDialog extends StatelessWidget {
  const ResultDialog({
    Key? key,
    this.message,
    required this.resultType,
  }) : super(key: key);
  final ResultType resultType;
  final String? message;

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
            if (resultType != ResultType.none) ...[
              Visibility(
                visible: resultType != ResultType.none,
                child: SvgPicture.asset(
                  'assets/icons/svg/${resultType.name}.svg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  resultType.name.translate,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                message ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: ScreenUtil().setSp(13)),
              ),
            ),
            const BoxHelper(
              height: 15,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(55),
              width: ScreenUtil().setWidth(125),
              child: RegisterButton(
                color: resultType == ResultType.success ||
                        resultType == ResultType.none
                    ? null
                    : Colors.red,
                radius: 12,
                title: 'ok',
                onPressed: () {
                  AutoRouter.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

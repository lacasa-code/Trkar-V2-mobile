import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/register_field.dart';
import '../../../core/extensions/string.dart';

class FormFieldTileItem extends StatelessWidget {
  const FormFieldTileItem({
    Key? key,
    this.title,
    this.maxLines = 1,
    this.keyboardType,
    this.isDescription = false,
    this.optionalTitle,
    this.hintText,
    this.enabled = true,
  }) : super(key: key);
  final String? title;
  final String? optionalTitle;
  final int? maxLines;
  final bool isDescription;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              // vertical: 5,
            ),
            child: optionalTitle != null
                ? RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$optionalTitle ',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: ScreenUtil().setSp(13),
                                  ),
                        ),
                        TextSpan(
                          text: '(${'optional'.translate})',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: ScreenUtil().setSp(12),
                                    color: Colors.black54,
                                  ),
                        ),
                      ],
                    ),
                  )
                : Text(
                    title ?? '',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: ScreenUtil().setSp(13),
                          // fontWeight: FontWeight.bold,
                        ),
                  ),
          ),
          RegisterField(
            enabled: enabled,
            maxLines: maxLines,
            keyboardType: keyboardType,
            labelText: hintText,
          ),
          Visibility(
            visible: isDescription,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                // vertical: 5,
              ),
              child: Text(
                'description_helper'.translate,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: ScreenUtil().setSp(12),
                      // fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

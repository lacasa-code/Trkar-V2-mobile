import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/register_field.dart';
import '../../../../core/components/sized_box_helper.dart';
import '../../../../core/extensions/string.dart';

class CreateProductFieldTile extends StatelessWidget {
  const CreateProductFieldTile({
    Key? key,
    required this.title,
    this.maxLines = 1,
    this.validator,
    this.controller,
    this.keyboardType,
    this.formatter,
    this.maxLength,
    this.extraOptions,
  }) : super(key: key);
  final String title;
  final int maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? formatter;
  final String? extraOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BoxHelper(
          height: 10,
        ),
        Row(
          children: [
            Text(
              title.translate.toTitleCase,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(15),
                  ),
            ),
            const BoxHelper(
              width: 5,
            ),
            Visibility(
              visible: extraOptions != null,
              child: Text(
                '(${extraOptions?.translate.toTitleCase})',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(15),
                    ),
              ),
            ),
          ],
        ),
        const BoxHelper(
          height: 10,
        ),
        RegisterField(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 10, vertical: maxLines > 1 ? 10 : 0),
          removePadding: true,
          maxLines: maxLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          formatters: formatter,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }
}

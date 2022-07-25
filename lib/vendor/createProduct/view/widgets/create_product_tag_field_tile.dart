import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:trkar/core/components/register_tags_field.dart';

import '../../../../core/components/sized_box_helper.dart';
import '../../../../core/extensions/string.dart';

class CreateProductTagFieldTile extends StatelessWidget {
  const CreateProductTagFieldTile({
    Key? key,
    required this.title,
    this.validator,
    this.controller,
    this.extraOptions,
    this.initialValues,
  }) : super(key: key);
  final String title;
  final TextfieldTagsController? controller;
  final String? Function(String?)? validator;
  final List<String>? initialValues;
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
        RegisterTagsField(
          removePadding: true,
          // contentPadding:
          //     const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          initialTags: initialValues,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }
}

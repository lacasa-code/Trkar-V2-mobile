import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/multiselect_dropdown_widget.dart';

import '../../../../core/components/searchable_dropdown_widget.dart';
import '../../../../core/components/sized_box_helper.dart';
import '../../../../core/extensions/string.dart';
import '../../../../core/themes/screen_utility.dart';

class CreateProductMultiSelectDropdownTile extends StatelessWidget {
  const CreateProductMultiSelectDropdownTile({
    Key? key,
    required this.title,
    required this.values,
    required this.onChanged,
    required this.enabled,
    this.validator,
    this.isOptional = false,
    this.initialValues = const [],
  }) : super(key: key);
  final List<String> values;
  final String title;
  final bool enabled;
  final void Function(List<String>?) onChanged;
  final bool isOptional;
  final String Function(List<String>?)? validator;
  final List<String> initialValues;

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
              title.translate,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(13),
                  ),
            ),
            const BoxHelper(
              width: 5,
            ),
            Visibility(
              visible: isOptional,
              child: Text(
                '(${'optional'.translate})',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(13),
                    color: MainStyle.lightGreyColor),
              ),
            ),
          ],
        ),
        const BoxHelper(
          height: 5,
        ),
        MultiSelectDropdownWidget(
          enabled: enabled,
          removePadding: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          values: values,
          labelText: title.translate,
          validator: validator,
          onChanged: onChanged,
          initialValue: initialValues,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './searchable_dropdown_widget.dart';
import '../extensions/string.dart';

class DropDownTileView extends StatelessWidget {
  const DropDownTileView({
    Key? key,
    required this.title,
    required this.values,
    this.selectedValue,
    required this.onChanged,
    this.removePadding = true,
  }) : super(key: key);
  final String title;
  final List<String> values;
  final int? selectedValue;
  final bool removePadding;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 5, horizontal: removePadding ? 0 : 15),
          child: Text(
            title.translate,
            style: TextStyle(
              color: Colors.black,
              // fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
        SearchableDropDownWidget(
          removePadding: removePadding,
          selectedValueIndex: selectedValue,
          thinBorder: true,
          values: values,
          labelText: title,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

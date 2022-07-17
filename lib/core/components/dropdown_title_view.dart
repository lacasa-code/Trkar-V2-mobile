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
    this.enabled = true,
    this.removePadding = true,
    this.dropdownKey,
  }) : super(key: key);
  final String title;
  final List<String> values;
  final String? selectedValue;
  final bool removePadding;
  final bool enabled;
  final void Function(String?)? onChanged;
  final GlobalKey<FormFieldState>? dropdownKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: EdgeInsets.symmetric(
        //       vertical: 5, horizontal: removePadding ? 0 : 15),
        //   child: Text(
        //     title.translate,
        //     style: TextStyle(
        //       color: Colors.black,
        //       // fontWeight: FontWeight.bold,
        //       fontSize: ScreenUtil().setSp(14),
        //     ),
        //   ),
        // ),
        SearchableDropDownWidget(
          removePadding: removePadding,
          initialValue: selectedValue,
          enabled: enabled,
          thinBorder: true,
          values: values,
          labelText: title,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

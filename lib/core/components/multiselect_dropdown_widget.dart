import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/screen_utility.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class MultiSelectDropdownWidget extends StatelessWidget {
  const MultiSelectDropdownWidget({
    Key? key,
    this.selectedValueIndex,
    this.values,
    this.selectedItems,
    this.validator,
    this.onChanged,
    this.labelText,
    this.thinBorder = true,
    this.enabled = true,
    this.removePadding = false,
    this.initialValue = const [],
    this.mode = Mode.MENU,
    this.contentPadding,
  }) : super(key: key);
  final int? selectedValueIndex;
  final List<String>? values;
  final List<String>? selectedItems;
  final String Function(List<String>?)? validator;
  final void Function(List<String>)? onChanged;
  final String? labelText;
  final bool thinBorder;
  final bool enabled;
  final bool removePadding;
  final List<String> initialValue;
  final Mode mode;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: removePadding
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: DropdownSearch<String>.multiSelection(
        showSelectedItems: true,
        validator: validator,
        showSearchBox: true,
        dropdownBuilder: (c, v) => Wrap(
          children: List.generate(
              v.length,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Chip(
                        backgroundColor: Theme.of(context).primaryColor,
                        label: Text(
                          v[index],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  )),
        ),
        dropdownSearchDecoration: InputDecoration(
          enabled: enabled,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          fillColor: Colors.white,
          filled: true,
          labelText: labelText,
          labelStyle: TextStyle(
            color:
                thinBorder ? MainStyle.lightGreyColor : MainStyle.darkGreyColor,
          ),
          helperStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color:
                thinBorder ? MainStyle.lightGreyColor : MainStyle.darkGreyColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
            borderSide: BorderSide(
              width: thinBorder ? 1 : 2,
              color: thinBorder
                  ? MainStyle.lightGreyColor
                  : MainStyle.darkGreyColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
            borderSide: BorderSide(
              width: thinBorder ? 1 : 2,
              color: thinBorder
                  ? MainStyle.lightGreyColor
                  : MainStyle.darkGreyColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
            borderSide: BorderSide(
              width: thinBorder ? 1 : 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        dropDownButton: Icon(
          Icons.arrow_drop_down,
          size: ScreenUtil().radius(35),
          color:
              thinBorder ? MainStyle.lightGreyColor : MainStyle.darkGreyColor,
        ),
        onChanged: onChanged,
        enabled: enabled,
        items: values,
        mode: mode,
        selectedItems: initialValue,
        // onChanged: ,
      ),
    );
  }
}

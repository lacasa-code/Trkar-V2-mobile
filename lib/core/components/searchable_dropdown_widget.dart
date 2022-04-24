import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../extensions/string.dart';
import 'package:trkar/core/themes/screen_utility.dart';

class SearchableDropDownWidget extends StatelessWidget {
  const SearchableDropDownWidget({
    Key? key,
    required this.values,
    required this.labelText,
    required this.onChanged,
    this.selectedValueIndex,
    this.leadingIcons,
    this.validator,
    this.thinBorder = false,
    this.enabled = true,
    this.initialValue,
    this.mode = Mode.MENU,
  }) : super(key: key);
  final int? selectedValueIndex;
  final List<String>? values;
  final List<String?>? leadingIcons;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String labelText;
  final bool thinBorder;
  final bool enabled;
  final Mode mode;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: DropdownSearch<String>(
        validator: validator,
        showSearchBox: true,
        selectedItem: initialValue,
        dropdownSearchDecoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          fillColor: Colors.white,
          filled: true,
          hintText: labelText.translate,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
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
        dropDownButton: const Icon(Icons.keyboard_arrow_down),
        onChanged: onChanged,
        enabled: enabled,
        items: values,
        mode: mode,

        // onChanged: ,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/helper.dart';
import 'sized_box_helper.dart';
import '../extensions/string.dart';
import '../themes/screen_utility.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    required this.values,
    required this.labelText,
    required this.onChanged,
    this.selectedValueIndex,
    this.leadingIcons,
    this.validator,
    this.thinBorder = false,
  }) : super(key: key);
  final int? selectedValueIndex;
  final List<String?> values;
  final List<String?>? leadingIcons;
  final String? Function(int?)? validator;
  final void Function(int?)? onChanged;
  final String labelText;
  final bool thinBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: DropdownButtonFormField(
        validator: validator,
        isExpanded: true,
        items: List.generate(
          values.length,
          (index) => DropdownMenuItem(
            child: leadingIcons == null
                ? Align(
                    alignment: Helper.appAlignment,
                    child: Text(
                      values[index]!,
                      textAlign: TextAlign.start,
                    ),
                  )
                : Row(
                    textDirection: Helper.appDirection,
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(25),
                        child: Image.network(
                          (leadingIcons![index]!),
                        ),
                      ),
                      const BoxHelper(
                        width: 10,
                      ),
                      Text(
                        values[index]!,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
            value: index,
          ),
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color:
              thinBorder ? MainStyle.lightGreyColor : MainStyle.darkGreyColor,
        ),
        decoration: InputDecoration(
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
        value: selectedValueIndex,
        onChanged: onChanged,
      ),
    );
  }
}

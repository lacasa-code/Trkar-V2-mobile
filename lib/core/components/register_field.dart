import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/themes/screen_utility.dart';
import 'package:trkar/core/extensions/string.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    Key? key,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.obsecureText = false,
    this.thinBorder = true,
    this.controller,
    this.validator,
    this.autovalidateMode,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.formatters,
    this.prefixIcon,
    this.hideBorder = false,
    this.removePadding = false,
    this.textInputAction,
    this.prefixWithDivider = false,
    this.enabled = true,
    this.makeContentPadding = false,
    this.onTap,
  }) : super(key: key);
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool prefixWithDivider;
  final TextInputType? keyboardType;
  final bool obsecureText;
  final bool thinBorder;
  final bool enabled;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final int? maxLength;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? formatters;
  final String? Function(String?)? validator;
  final bool removePadding;
  final bool hideBorder;
  final TextInputAction? textInputAction;
  final bool makeContentPadding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: removePadding
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        onTap: onTap,
        readOnly: !enabled,
        textInputAction: textInputAction,
        maxLength: maxLength,
        maxLines: maxLines,
        inputFormatters: formatters,
        onChanged: onChanged,
        autovalidateMode: autovalidateMode,
        controller: controller,
        validator: validator,
        obscureText: obsecureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: makeContentPadding
              ? const EdgeInsets.symmetric(vertical: 25, horizontal: 20)
              : null,
          counterText: '',
          filled: true,
          fillColor: Colors.white,
          labelText: labelText?.translate,
          hintText: hintText?.translate,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color:
                thinBorder ? MainStyle.lightGreyColor : MainStyle.darkGreyColor,
          ),
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color:
                thinBorder ? MainStyle.lightGreyColor : MainStyle.darkGreyColor,
          ),
          border: hideBorder
              ? null
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
                  borderSide: BorderSide(
                    width: thinBorder ? 1 : 2,
                    color: thinBorder
                        ? MainStyle.lightGreyColor
                        : MainStyle.darkGreyColor,
                  ),
                ),
          enabledBorder: hideBorder
              ? null
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
                  borderSide: BorderSide(
                    width: thinBorder ? 1 : 2,
                    color: thinBorder
                        ? MainStyle.lightGreyColor
                        : MainStyle.darkGreyColor,
                  ),
                ),
          focusedBorder: hideBorder
              ? null
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
                  borderSide: BorderSide(
                    width: thinBorder ? 1 : 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon != null && prefixWithDivider
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: prefixIcon,
                      ),
                      Container(
                        width: ScreenUtil().setWidth(1),
                        height: ScreenUtil().setHeight(30),
                        color: Theme.of(context).textTheme.headline2?.color,
                      ),
                    ],
                  ),
                )
              : prefixIcon,
        ),
      ),
    );
  }
}

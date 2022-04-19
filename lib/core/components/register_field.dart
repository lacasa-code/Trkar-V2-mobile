import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/string.dart';
import '../themes/screen_utility.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    Key? key,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.obsecureText = false,
    this.thinBorder = false,
    this.controller,
    this.validator,
    this.autovalidateMode,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.formatters,
  }) : super(key: key);
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obsecureText;
  final bool thinBorder;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final int? maxLength;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? formatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
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
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/components/register_field.dart';
import '../../../../core/helper/helper.dart';
import '../../../../core/themes/screen_utility.dart';

class CreateProductPriceField extends StatelessWidget {
  const CreateProductPriceField({
    Key? key,
    this.controller,
    this.validation,
    this.suffixText,
    this.maxLength,
  }) : super(key: key);
  final String? Function(String?)? validation;
  final TextEditingController? controller;
  final String? suffixText;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return RegisterField(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      keyboardType: TextInputType.phone,
      removePadding: true,
      controller: controller,
      validator: validation,
      formatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      suffixIcon: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Helper.currentLanguage == 'ar'
                ? const Radius.circular(12)
                : Radius.zero,
            bottomLeft: Helper.currentLanguage == 'ar'
                ? const Radius.circular(12)
                : Radius.zero,
            topRight: Helper.currentLanguage != 'ar'
                ? const Radius.circular(12)
                : Radius.zero,
            bottomRight: Helper.currentLanguage != 'ar'
                ? const Radius.circular(12)
                : Radius.zero,
          ),
          color: const Color(0xffF3F4F5),
          border: Border.all(
            color: MainStyle.lightGreyColor,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              suffixText ?? 'SR',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      hintText: 'product_price',
    );
  }
}

import 'package:flutter/material.dart';

class CarWidget extends StatelessWidget {
  const CarWidget({
    Key? key,
    this.value,
    this.groupValue,
    this.title,
    this.subTitle,
    this.onChanged,
  }) : super(key: key);
  final String? value;
  final String? groupValue;
  final String? title, subTitle;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      value: value ?? '',
      groupValue: groupValue,
      activeColor: Colors.black,
      onChanged: onChanged,
      title: Text(
        title ?? 'Chevrolet',
      ),
      subtitle: Text(subTitle ?? ' Optra 2016 - manual'),
    );
  }
}

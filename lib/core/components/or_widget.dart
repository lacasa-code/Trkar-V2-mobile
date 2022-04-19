import 'package:flutter/material.dart';
import 'package:trkar/core/themes/themes.dart';
import 'package:trkar/core/extensions/string.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'or'.translate,
              style: MainTheme.subTextStyleBold,
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

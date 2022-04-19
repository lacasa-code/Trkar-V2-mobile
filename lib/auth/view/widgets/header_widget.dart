import 'package:flutter/material.dart';
import '../../../core/components/sized_box_helper.dart';
import '../../../../core/themes/themes.dart';
import '../../../core/extensions/string.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.title,
    this.footer,
    this.phoneNumber,
  }) : super(key: key);
  final String title;
  final String? footer;
  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title.translate,
              style: MainTheme.headerStyle2,
            ),
          ),
          if (footer != null) ...[
            const BoxHelper(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  footer == null
                      ? ''
                      : footer!.translate + ' ' + (phoneNumber ?? ''),
                  style: MainTheme.subTextStyleBold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const BoxHelper(
              height: 10,
            ),
          ],
        ],
      ),
    );
  }
}

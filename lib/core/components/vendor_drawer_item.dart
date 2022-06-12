import 'package:flutter/material.dart';
import '../extensions/string.dart';

class VendorDrawerItem extends StatelessWidget {
  const VendorDrawerItem({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icons,
  }) : super(key: key);

  ///localized Title
  final String title;

  final void Function() onPressed;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: onPressed,
            leading: Icon(
              icons,
            ),
            title: Text(
              title.translate,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            )),
        const Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}

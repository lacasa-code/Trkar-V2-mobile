import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../extensions/string.dart';

class VendorAppBar extends AppBar {
  VendorAppBar({
    Key? key,
    required String title,
    required BuildContext context,
    Widget? leading,
  }) : super(
            key: key,
            title: Text(
              title.translate,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: leading ??
                Visibility(
                  visible: context.router.canPopSelfOrChildren,
                  child: IconButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ));
}

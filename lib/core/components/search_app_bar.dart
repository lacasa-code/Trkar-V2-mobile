import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './register_field.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              onPressed: () {
                log('scaff');
                scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              ),
            ),
            Expanded(
              child: RegisterField(
                textInputAction: TextInputAction.search,
                thinBorder: true,
                removePadding: true,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                ),
                hintText: 'search_hint',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setHeight(70));
}

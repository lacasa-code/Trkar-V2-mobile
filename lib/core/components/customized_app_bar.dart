import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../router/router.gr.dart';

class CustomizedAppBar extends AppBar {
  CustomizedAppBar({
    Key? key,
    required BuildContext context,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required String title,
    List<Widget>? actions,
  }) : super(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: ScreenUtil().radius(15),
              ),
              color: Colors.black,
              onPressed: () {
                context.router.pop();
              },
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: actions ??
                [
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/svg/categories.svg',
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.navigateTo(
                        const CartRouter(),
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/svg/cart-icon.svg',
                      color: Colors.black,
                    ),
                  ),
                ]);
}

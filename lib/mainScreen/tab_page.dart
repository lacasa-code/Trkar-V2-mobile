import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/core/components/custom_new_dialog.dart';
import 'package:trkar/core/helper/helper.dart';
import '../core/extensions/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/search/viewModel/search/search_cubit.dart';

class TabPage extends StatefulWidget implements AutoRouteWrapper {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: this,
    );
  }
}

class _TabPageState extends State<TabPage> {
  List<dynamic> pages = [
    {
      'icon': Icons.home_outlined,
      'title': 'home'.translate,
    },
    {
      'icon': Icons.category_outlined,
      'title': 'categories'.translate,
    },
    {
      'icon': Icons.star,
      'title': 'wishlist'.translate,
    },
    {
      'icon': Icons.shopping_cart,
      'title': 'cart'.translate,
    },
    {
      'icon': Icons.person,
      'title': 'my_account'.translate,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRouter(),
        CategoriesRouter(),
        FavoritesRouter(),
        CartRouter(),
        ProfileRouter(),
      ],
      bottomNavigationBuilder: (_, tabRouter) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: tabRouter.activeIndex,
        onTap: (index) {
          if ((index == 2 || index == 3) && !Helper.isLoggedIn) {
            CustomDialog().showOptionDialog(
              context: context,
              msg: 'login_required'.translate,
              okMsg: 'login',
              okFun: () {
                // NavigationService.push(
                //   page: LoginScreen.routeName,
                // );
                context.router.push(
                  const LoginRouter(),
                );
              },
              cancelMsg: 'cancel',
              cancelFun: () {},
            );
            return;
          }
          tabRouter.setActiveIndex(index);
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: ScreenUtil().setSp(10),
        unselectedFontSize: ScreenUtil().setSp(10),
        items: pages
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(
                  e['icon'],
                ),
                label: e['title'],
                tooltip: e['title'],
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/cart/view/cart_screen.dart';
import 'package:trkar/categories/view/categories_screen.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/favorites/view/favorites_screen.dart';
import 'package:trkar/home/view/home_screen.dart';
import 'package:trkar/profile/view/profile_screen.dart';
import 'package:trkar/tab/viewModel/cubit/tab_cubit.dart';
import '../../core/extensions/string.dart';


class TabScreen extends StatefulWidget {
  const TabScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/tabs';

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<dynamic> pages = [
    {
      'page': const HomeScreen(),
      'icon': Icons.home_outlined,
      'title': 'home'.translate,
    },
    {
      'page': BlocProvider(
        create: (_) => SubCategoriesCubit(),
        child: const CategoriesScreen(),
      ),
      'icon': Icons.category_outlined,
      'title': 'categories'.translate,
    },
    {
      'page': const FavoritesScreen(),
      'icon': Icons.star,
      'title': 'wishlist'.translate,
    },
    {
      'page': const CartScreen(),
      'icon': Icons.shopping_cart,
      'title': 'cart'.translate,
    },
    {
      'page': const ProfileScreen(),
      'icon': Icons.person,
      'title': 'my_account'.translate,
    },
  ];
  late TabCubit tabCubit;

  @override
  void initState() {
    tabCubit = context.read<TabCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, TabState>(
      builder: (context, state) {
        return Scaffold(
          body: pages[tabCubit.tabIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabCubit.tabIndex,
            onTap: (v) => tabCubit.changeTabIndex(v, context),
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
      },
    );
  }
}

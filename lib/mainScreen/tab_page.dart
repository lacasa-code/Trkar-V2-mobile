import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
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
  var svgAssetsPath = 'assets/icons/svg/';
  late List<dynamic> pages;
  TabsRouter? myTabsRouter;

  var isInit = true;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    pages = [
      {
        'icon': svgAssetsPath + 'home.svg',
        'title': 'home'.translate,
      },
      {
        'icon': svgAssetsPath + 'categories.svg',
        'title': 'categories'.translate,
      },
      {
        'icon': svgAssetsPath + 'star.svg',
        'title': '',
      },
      {
        'icon': svgAssetsPath + 'star.svg',
        'title': 'wishlist'.translate,
      },
      // {
      //   'icon': Icons.shopping_cart,
      //   'title': 'cart'.translate,
      // },
      {
        'icon': svgAssetsPath + 'account.svg',
        'title': 'my_account'.translate,
      },
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRouter(),
        CategoriesRouter(),
        CartRouter(),
        FavoritesRouter(),
        ProfileRouter(),
      ],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // backgroundColor: Colors.transparent,
      // extendBody: true,

      // appBarBuilder: myTabsRouter?.activeIndex == 4
      //     ? (_, tabsRouter) => AppBar(
      //           backgroundColor: Colors.transparent,
      //           elevation: 0,
      //           leading: Icon(
      //             Icons.arrow_back_ios,
      //             color: Theme.of(context).primaryIconTheme.color,
      //             size: ScreenUtil().radius(15),
      //           ),
      //         )
      //     : null,
      floatingActionButton: InkWell(
        onTap: () {
          myTabsRouter?.setActiveIndex(2);
          myTabsRouter?.popTop();
        },
        child: SvgPicture.asset(
          'assets/icons/svg/cart-button.svg',
          fit: BoxFit.cover,
        ),
      ),
      bottomNavigationBuilder: (_, tabRouter) {
        myTabsRouter = tabRouter;

        log('message from builder ${myTabsRouter?.activeIndex}');
        return SizedBox(
          height: ScreenUtil().setHeight(60),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),

            notchMargin: ScreenUtil().radius(2),
            // color: Colors.red,
            elevation: 10,
            // color: Colors.white.withAlpha(0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  pages.length,
                  (index) {
                    var e = pages[index];
                    return e['title'].isEmpty
                        ? const SizedBox()
                        : InkWell(
                            onTap: () {
                              tabRouter.setActiveIndex(index);
                              tabRouter.current.router.popTop();
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  e['icon'],
                                  color: tabRouter.activeIndex == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                  height: ScreenUtil().setHeight(35),
                                  width: ScreenUtil().setWidth(35),
                                ),
                                Text(
                                  e['title'],
                                  style: TextStyle(
                                    color: tabRouter.activeIndex == index
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
/** 
  child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
            tabRouter.current.router.popTop();
            // log();
          },
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedFontSize: ScreenUtil().setSp(10),
          unselectedFontSize: ScreenUtil().setSp(10),
          items: pages.map(
            (e) {
              return e['title'].isEmpty
                  ? const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.abc,
                        color: Colors.transparent,
                      ),
                      label: '')
                  : BottomNavigationBarItem(
                      icon: Icon(
                        e['icon'],
                      ),
                      label: e['title'],
                      tooltip: e['title'],
                    );
            },
          ).toList(),
        ),
*/
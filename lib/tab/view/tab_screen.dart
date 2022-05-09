import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/categories/view/categories_screen.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/home/view/home_screen.dart';
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
      'page': const CategoriesScreen(),
      'icon': Icons.category_outlined,
      'title': 'categories'.translate,
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
            onTap: tabCubit.changeTabIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
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

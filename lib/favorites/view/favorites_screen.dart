import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/tab/viewModel/cubit/tab_cubit.dart';
import '../../core/extensions/string.dart';
import 'package:trkar/favorites/view/widget/favorite_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  static const routeName = '/fav-screen';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late TabCubit tabCubit;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    tabCubit = context.read<TabCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => tabCubit.onBackButtonPressed(context),
      child: Scaffold(
        key: scaffoldKey,
        appBar: SearchAppBar(scaffoldKey: scaffoldKey),
        drawer: const MyDrawer(),

        // appBar: AppBar(
        //   elevation: 0,
        //   leading: IconButton(
        //     onPressed: () {
        //       tabCubit.onBackButtonPressed(context);
        //     },
        //     color: Colors.black,
        //     icon: const Icon(
        //       Icons.arrow_back,
        //     ),
        //   ),
        //   title: Text(
        //     'wishlist'.translate,
        //     style: const TextStyle(color: Colors.black),
        //   ),
        //   backgroundColor: Colors.transparent,
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                3,
                (index) => FavoriteItem(
                  imagePath: 'assets/images/oil${index + 1}.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

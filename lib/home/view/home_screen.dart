import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/Addresses/view/addresses_screen.dart';
import 'package:trkar/auth/viewModel/logout/logout_cubit.dart';
import 'package:trkar/categories/view/sub_categories_screen.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/home/view/widgets/select_car_card.dart';
import 'package:trkar/localization/view/change_language_screen.dart';
import '../../core/extensions/media_query.dart';
import 'package:trkar/profile/view/edit_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late CategoriesCubit categoriesCubit;
  late SubCategoriesCubit subCategoriesCubit;
  late TabController _controller;
  var isInit = true;
  final key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    subCategoriesCubit = context.read<SubCategoriesCubit>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      categoriesCubit = context.read<CategoriesCubit>()
        ..getAllCategories(context).then((value) {
          _controller = TabController(
              length: categoriesCubit.maincategory.length, vsync: this);
          setState(() {});
        });
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const LoaderWidget();
          }

          return Scaffold(
            key: key,
            drawer: const MyDrawer(),
            appBar: AppBar(
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                isScrollable: true,
                indicator: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                controller: _controller,
                tabs: categoriesCubit.maincategory
                    .map(
                      (e) => Row(
                        children: [
                          Text(
                            e.name ?? '',
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              // automaticallyImplyLeading: false,
              titleTextStyle: const TextStyle(color: Colors.black),
              title: Row(
                children: [
                  const SelectCarWidget(),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (_) => BlocProvider(
                          create: (_) => SubCategoriesCubit(),
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: const SearchModalBottomSheet(),
                          ),
                        ),
                      );
                    },
                    color: Colors.black,
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  log('message');
                  key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
                color: Colors.black,
              ),
              backgroundColor: Colors.transparent,
              actions: [
                PopupMenuButton(
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  onSelected: (v) {
                    if (v == 'edit') {
                      NavigationService.push(
                        page: EditProfileScreen.routeName,
                      );
                    }
                    if (v == 'addresses') {
                      NavigationService.push(
                        page: AddressesScreen.routeName,
                      );
                    }
                    if (v == 'lang') {
                      NavigationService.push(
                        page: ChangeLanguageScreen.routeName,
                      );
                    }
                    if (v == 'logout') {
                      BlocProvider.of<LogoutCubit>(context).logOut(context);
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text(
                        'edit_profile'.translate,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'lang',
                      child: Text(
                        'lang'.translate,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'addresses',
                      child: Text(
                        'addresses'.translate,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'logout',
                      child: Text(
                        'logout'.translate,
                      ),
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: () {
                //     NavigationService.push(
                //       page: EditProfileScreen.routeName,
                //     );
                //   },
                //   color: Theme.of(context).primaryColor,
                //   icon: const Icon(
                //     Icons.settings_outlined,
                //   ),
                // ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: categoriesCubit.maincategory
                        .map(
                          (e) => Column(
                            children: [
                              SingleChildScrollView(
                                child: Wrap(
                                  spacing: ScreenUtil().setWidth(10),
                                  children: List.generate(
                                    categoriesCubit
                                                .subCategories(e.id ?? 0)
                                                .length >
                                            6
                                        ? 6
                                        : categoriesCubit
                                            .subCategories(e.id ?? 0)
                                            .length,
                                    (index) {
                                      var subCat = categoriesCubit
                                          .subCategories(e.id ?? 0)[index];
                                      return HomeCategoryItem(
                                        title: subCat.name,
                                        imagePath: subCat.image,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const BoxHelper(height: 20),
                              TextButton(
                                  onPressed: () {
                                    var cat = categoriesCubit
                                        .maincategory[_controller.index];
                                    var hasSubCat =
                                        categoriesCubit.hasSubCategory(cat.id);
                                    // if (hasSubCat) {
                                    var subCat =
                                        context.read<SubCategoriesCubit>();
                                    subCat.categoryName = cat.name;
                                    subCat.parentId = cat.id;
                                    NavigationService.push(
                                      page: SubCategoriesScreen.routeName,
                                      arguments: {
                                        'category_name': cat.name,
                                        'parent_id': cat.id,
                                      },
                                    );
                                  },
                                  child: Text(
                                    'more'.translate,
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                // const BoxHelper(
                //   height: 80,
                // ),
                // Image.asset(
                //   'assets/icons/trkarLogoWhite.png',
                //   // alignment: Al,
                // ),
                // const BoxHelper(
                //   height: 30,
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
    Key? key,
    this.imagePath,
    this.title,
  }) : super(key: key);
  final String? title;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.3,
      // padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BoxHelper(
            height: 10,
          ),
          // Image.network(
          //   imagePath ?? 'assets/icons/trkarLogoWhite.png',
          //   width: context.width * 0.25,

          //   // height: context.height * 0.1,
          //   // alignment: Al,
          // ),
          FadeInImage(
            placeholder: const AssetImage(
              'assets/icons/trkarLogoWhite.png',
            ),
            image: NetworkImage(imagePath ?? ''),
            width: context.width * 0.25,
            imageErrorBuilder: (_, __, ___) => Image.asset(
              'assets/icons/trkarLogoWhite.png',
              width: context.width * 0.25,

              // height: context.height * 0.1,
              // alignment: Al,
            ),
          ),
          const BoxHelper(
            height: 15,
          ),
          Text(
            title ?? 'cat name',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              // fontSize: ScreenUtil().setSp(10),
            ),
          ),
        ],
      ),
    );
  }
}

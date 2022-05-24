import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/view/sub_categories_screen.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_icon.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/home/view/widgets/home_categories_item.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/home/view/widgets/recently_viewed_product_view.dart';

import 'package:trkar/home/view/widgets/send_offers_email_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
              length: categoriesCubit.maincategory.length, vsync: this)
            ..addListener(() {
              if (_controller.indexIsChanging) {
                setState(() {});
              }
            });
          setState(() {});
        });
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is AllCategoriesLoading) {
            return const LoaderWidget();
          }

          return Scaffold(
            key: key,
            drawer: const MyDrawer(),
            appBar: AppBar(
              /*
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
              */
              // automaticallyImplyLeading: false,
              titleTextStyle: const TextStyle(color: Colors.black),
              title: Row(
                children: const [
                  // SelectCarWidget(),
                  SearchIcon(),
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
              actions: const [
                // PopupMenuButton(
                //   icon: Icon(
                //     Icons.settings_outlined,
                //     color: Theme.of(context).primaryColor,
                //   ),
                //   onSelected: (v) {
                //     if (v == 'edit') {
                //       NavigationService.push(
                //         page: EditProfileScreen.routeName,
                //       );
                //     }
                //     if (v == 'addresses') {
                //       NavigationService.push(
                //         page: AddressesScreen.routeName,
                //       );
                //     }
                //     if (v == 'lang') {
                //       NavigationService.push(
                //         page: ChangeLanguageScreen.routeName,
                //       );
                //     }
                //     if (v == 'logout') {
                //       BlocProvider.of<LogoutCubit>(context).logOut(context);
                //     }
                //   },
                //   itemBuilder: (_) => [
                //     PopupMenuItem(
                //       value: 'edit',
                //       child: Text(
                //         'edit_profile'.translate,
                //       ),
                //     ),
                //     PopupMenuItem(
                //       value: 'lang',
                //       child: Text(
                //         'lang'.translate,
                //       ),
                //     ),
                //     PopupMenuItem(
                //       value: 'addresses',
                //       child: Text(
                //         'addresses'.translate,
                //       ),
                //     ),
                //     PopupMenuItem(
                //       value: 'logout',
                //       child: Text(
                //         'logout'.translate,
                //       ),
                //     ),
                //   ],
                // ),
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
            body: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const HomeCarouselCard(),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(25)),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          controller: _controller,
                          tabs: categoriesCubit.maincategory
                              .map(
                                (e) => Text(e.name ?? ''),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(103 *
                            (categoriesCubit
                                        .subCategories(categoriesCubit
                                                .maincategory[_controller.index]
                                                .id ??
                                            0)
                                        .length >
                                    40
                                ? 40
                                : categoriesCubit
                                    .subCategories(categoriesCubit
                                            .maincategory[_controller.index]
                                            .id ??
                                        0)
                                    .length)),
                        child: TabBarView(
                          controller: _controller,
                          children: categoriesCubit.maincategory.map(
                            (e) {
                              var subCategories =
                                  categoriesCubit.subCategories(e.id ?? 0);
                              return Column(
                                children: List.generate(
                                  subCategories.length > 40
                                      ? 40
                                      : subCategories.length,
                                  (index) {
                                    var cat = subCategories[index];
                                    var hasSubCat =
                                        categoriesCubit.hasSubCategory(cat.id);
                                    return HomeCategoryItem(
                                      onTap: !hasSubCat
                                          ? null
                                          : () {
                                              if (hasSubCat) {
                                                context.read<FilterCarsCubit>()
                                                  ..getManufacturer(
                                                    context,
                                                    categoryId: int.parse(
                                                                cat.parentId ??
                                                                    '0') ==
                                                            0
                                                        ? cat.id
                                                        : cat.parentId,
                                                  )
                                                  ..getCarMades(
                                                    context,
                                                    categoryId: int.parse(
                                                                cat.parentId ??
                                                                    '0') ==
                                                            0
                                                        ? cat.id
                                                        : cat.parentId,
                                                  );
                                                var subCat = context
                                                    .read<SubCategoriesCubit>();
                                                subCat.categoryName = cat.name;
                                                subCat.parentId = cat.id;
                                                NavigationService.push(
                                                  page: SubCategoriesScreen
                                                      .routeName,
                                                  arguments: {
                                                    'category_name': cat.name,
                                                    'parent_id': cat.id,
                                                  },
                                                );
                                              }
                                            },
                                      title: cat.name,
                                      imagePath: cat.image,
                                    );
                                  },
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                  const RecentlyViewedProductsView(),
                  const SendOffersEmailView(),
                  const BestDealsView(),
                  /*
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
                  */
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
            ),
          );
        },
      ),
    );
  }
}

class BestDealsView extends StatelessWidget {
  const BestDealsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class HomeCarouselCard extends StatelessWidget {
  const HomeCarouselCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider(
        items: List.generate(
            3,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Image.asset(
                    'assets/images/car-offers${index + 1}.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
        options: CarouselOptions(
          height: ScreenUtil().setHeight(180),
          enableInfiniteScroll: false,
          initialPage: 1,
        ),
      ),
    );
  }
}

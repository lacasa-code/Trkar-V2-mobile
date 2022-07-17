import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/home/view/widgets/home_carousel_card.dart';
import '../../core/router/router.gr.dart' as route;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/search_view.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/home/view/widgets/home_categories_item.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/home/view/widgets/recently_viewed_product_view.dart';
import 'package:trkar/core/components/loader_widget.dart';

import 'package:trkar/home/view/widgets/send_offers_email_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trkar/search/viewModel/search/search_cubit.dart';

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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SearchCubit searchCubit;

  var isInit = true;
  @override
  void initState() {
    subCategoriesCubit = context.read<SubCategoriesCubit>();
    searchCubit = context.read<SearchCubit>()..getCarMades(context);
    categoriesCubit = context.read<CategoriesCubit>();
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() => categoriesCubit.onTabBarChanging(
          context: context,
          index: _controller.index,
        ));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      categoriesCubit.getAllCategories(context);
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
    // log('controller Null => ${_controller == null}');
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is AllCategoriesLoading) {
          return const LoaderWidget();
        }

        return Scaffold(
          key: scaffoldKey,
          drawer: const MyDrawer(),
          appBar: SearchAppBar(
            scaffoldKey: scaffoldKey,
          ),

          // appBar: AppBar(
          //   bottom: const SearchBottomAppBar(),
          //   /*
          //   bottom: TabBar(
          //     labelColor: Colors.white,
          //     unselectedLabelColor: Colors.black,
          //     labelPadding:
          //         const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //     isScrollable: true,
          //     indicator: BoxDecoration(
          //         color: Colors.grey,
          //         borderRadius: BorderRadius.circular(15)),
          //     controller: _controller,
          //     tabs: categoriesCubit.maincategory
          //         .map(
          //           (e) => Row(
          //             children: [
          //               Text(
          //                 e.name ?? '',
          //               ),
          //             ],
          //           ),
          //         )
          //         .toList(),
          //   ),
          //   */
          //   // automaticallyImplyLeading: false,
          //   titleTextStyle: const TextStyle(color: Colors.black),
          //   // title: Row(
          //   //   children: const [
          //   //     // SelectCarWidget(),
          //   //     SearchIcon(),
          //   //   ],
          //   // ),
          //   elevation: 0,
          //   leading: IconButton(
          //     onPressed: () {
          //       log('message');
          //       key.currentState?.openDrawer();
          //     },
          //     icon: const Icon(Icons.menu),
          //     color: Colors.black,
          //   ),
          //   backgroundColor: Colors.transparent,
          //   actions: const [
          //     // PopupMenuButton(
          //     //   icon: Icon(
          //     //     Icons.settings_outlined,
          //     //     color: Theme.of(context).primaryColor,
          //     //   ),
          //     //   onSelected: (v) {
          //     //     if (v == 'edit') {
          //     //       NavigationService.push(
          //     //         page: EditProfileScreen.routeName,
          //     //       );
          //     //     }
          //     //     if (v == 'addresses') {
          //     //       NavigationService.push(
          //     //         page: AddressesScreen.routeName,
          //     //       );
          //     //     }
          //     //     if (v == 'lang') {
          //     //       NavigationService.push(
          //     //         page: ChangeLanguageScreen.routeName,
          //     //       );
          //     //     }
          //     //     if (v == 'logout') {
          //     //       BlocProvider.of<LogoutCubit>(context).logOut(context);
          //     //     }
          //     //   },
          //     //   itemBuilder: (_) => [
          //     //     PopupMenuItem(
          //     //       value: 'edit',
          //     //       child: Text(
          //     //         'edit_profile'.translate,
          //     //       ),
          //     //     ),
          //     //     PopupMenuItem(
          //     //       value: 'lang',
          //     //       child: Text(
          //     //         'lang'.translate,
          //     //       ),
          //     //     ),
          //     //     PopupMenuItem(
          //     //       value: 'addresses',
          //     //       child: Text(
          //     //         'addresses'.translate,
          //     //       ),
          //     //     ),
          //     //     PopupMenuItem(
          //     //       value: 'logout',
          //     //       child: Text(
          //     //         'logout'.translate,
          //     //       ),
          //     //     ),
          //     //   ],
          //     // ),
          //     // IconButton(
          //     //   onPressed: () {
          //     //     NavigationService.push(
          //     //       page: EditProfileScreen.routeName,
          //     //     );
          //     //   },
          //     //   color: Theme.of(context).primaryColor,
          //     //   icon: const Icon(
          //     //     Icons.settings_outlined,
          //     //   ),
          //     // ),
          //   ],
          // ),
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
                      // decoration: BoxDecoration(
                      //     color: Colors.grey.shade200,
                      // borderRadius: BorderRadius.circular(25)),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        // padding: EdgeInsets.symmetric(horizontal: 15),
                        controller: _controller,
                        tabs: List.generate(
                          categoriesCubit.mainCategory.length,
                          (index) {
                            var e = categoriesCubit.mainCategory[index];
                            return Container(
                              // width: ScreenUtil().setWidth(170),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SvgPicture.asset(
                                      'assets/icons/svg/${index == 0 ? 'car' : 'truck'}.svg',
                                      height: ScreenUtil().setHeight(13),
                                      width: ScreenUtil().setWidth(13),
                                      color: _controller.index == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  // const BoxHelper(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      e.name ?? '',
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          // ListTile(
                          //   contentPadding: EdgeInsets.zero,
                          //   title: Text(e.name ?? ''),
                          //   leading: SvgPicture.asset(
                          //     'assets/icons/svg/car.svg',
                          //     // height: ScreenUtil().setHeight(40),
                          //     // width: ScreenUtil().setWidth(40),
                          //   ),
                          // ),
                        ).toList(),
                      ),
                    ),
                    SearchView(
                      searchCubit: searchCubit,
                    ),
                    SizedBox(
                      height: categoriesCubit.getTabBarSize(_controller.index),
                      child: TabBarView(
                        controller: _controller,
                        children: categoriesCubit.mainCategory.map(
                          (e) {
                            var subCategories =
                                categoriesCubit.subCategories(e.id ?? 0);
                            return GridView(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.1,
                                // crossAxisSpacing: 20,
                                // mainAxisExtent: 20,
                                // mainAxisSpacing: 1,
                              ),
                              children: List.generate(
                                subCategories.length > 40
                                    ? 40
                                    : subCategories.length,
                                (index) {
                                  var cat = subCategories[index];
                                  var hasSubCat =
                                      categoriesCubit.hasSubCategory(cat.id);
                                  return HomeCategoryItem(
                                    onTap: () {
                                      log('message ${cat.slug}');
                                      log('message');
                                      context.read<FilterCarsCubit>()
                                        ..getManufacturer(
                                          context,
                                          categoryId:
                                              int.parse(cat.parentId ?? '0') ==
                                                      0
                                                  ? cat.id
                                                  : cat.parentId,
                                        )
                                        ..getCarMades(
                                          context,
                                          categoryId:
                                              int.parse(cat.parentId ?? '0') ==
                                                      0
                                                  ? cat.id
                                                  : cat.parentId,
                                        );
                                      var subCat =
                                          context.read<SubCategoriesCubit>();
                                      subCat.categoryName = cat.name;
                                      subCat.parentId = cat.id;

                                      // NavigationService.push(
                                      //   page: SubCategoriesScreen
                                      //       .routeName,
                                      //   arguments: {
                                      //     'category_name': cat.name,
                                      //     'parent_id': cat.id,
                                      //   },
                                      // );
                                      log('isOil ${cat.slug == 'engine-oil'}');
                                      if (cat.slug == 'engine-oil') {
                                        // NavigationService.push(
                                        //   page: EngineOilScreen.routeName,
                                        // );
                                        log('m');
                                        context.navigateTo(
                                          route.CategoriesRouter(
                                            children: [
                                              const route.CategoriesScreen(),
                                              route.EngineOilScreen(
                                                  categoryId:
                                                      cat.id.toString()),
                                            ],
                                          ),
                                        );
                                        // context.router.push(
                                        //   const route.EngineOilScreen(),
                                        // );
                                        return;
                                      }
                                      if (cat.slug == 'tools-equipment') {
                                        // NavigationService.push(page: ToolsScreen.routeName);
                                        context.navigateTo(
                                          route.CategoriesRouter(
                                            children: [
                                              const route.CategoriesScreen(),
                                              route.ToolsScreen(
                                                categoryId: cat.id.toString(),
                                              ),
                                            ],
                                          ),
                                        );
                                        return;
                                      }
                                      if (cat.slug == 'filters') {
                                        context.navigateTo(
                                          route.CategoriesRouter(
                                            children: [
                                              const route.CategoriesScreen(),
                                              route.FilterRouter(
                                                categoryName: cat.name,
                                                parentId: cat.id.toString(),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      if (cat.slug == 'brakes') {
                                        context.navigateTo(
                                          route.CategoriesRouter(
                                            children: [
                                              const route.CategoriesScreen(),
                                              route.BrakesRouter(
                                                parentId: cat.id.toString(),
                                                categoryName: cat.name,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      if (cat.slug == 'tyres') {
                                        context.navigateTo(
                                          route.CategoriesRouter(
                                            children: [
                                              const route.CategoriesScreen(),
                                              route.TyresScreen(
                                                  tabIndex: cat.id),
                                            ],
                                          ),
                                        );
                                        return;
                                      }
                                      if (cat.slug == 'car-accessories') {
                                        // NavigationService.push(
                                        //   page: CarAccessoriesScreen.routeName,
                                        //   arguments: {
                                        //     'category_name': cat.name,
                                        //     'parent_id': cat.id,
                                        //   },
                                        // );
                                        context.navigateTo(
                                          route.CategoriesRouter(
                                            children: [
                                              const route.CategoriesScreen(),
                                              route.CarAccessoriesScreen(
                                                name: cat.name,
                                                parentId: cat.id.toString(),
                                              ),
                                            ],
                                          ),
                                        );

                                        return;
                                      }
                                      if (hasSubCat) {
                                        context.navigateTo(
                                            CategoriesRouter(children: [
                                          const route.CategoriesScreen(),
                                          SubCategoriesScreen(
                                            categoryName: cat.name,
                                            parentId: cat.id.toString(),
                                          )
                                        ]));
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
              ],
            ),
          ),
        );
      },
    );
  }
}

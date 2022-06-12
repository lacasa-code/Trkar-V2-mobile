import 'dart:developer';

// import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/carAccessories/view/car_accessories_screen.dart';
import 'package:trkar/categories/view/sub_categories_screen.dart';
import 'package:trkar/categories/view/widgets/category_item.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_app_bar.dart';

import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/router/router.gr.dart' as route;
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/tools/view/tools_screen.dart';
import 'package:trkar/tyres/view/tyres_screen.dart';
import '../../core/extensions/string.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/tab/viewModel/cubit/tab_cubit.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const routeName = '/categories-screen';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late CategoriesCubit categoriesCubit;
  @override
  void initState() {
    categoriesCubit = BlocProvider.of<CategoriesCubit>(context)
      ..getCategories(context)..getAllCategories(context);
    super.initState();
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    var tab = context.read<TabCubit>();
    tab.changeTabIndex(0);
    return false;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _onBackButtonPressed(context),
      child: Scaffold(
        key: scaffoldKey,
        drawer: const MyDrawer(),
        // appBar: AppBar(
        //   bottom:
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: Text(
        //     'categories'.translate,
        //     style: const TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back,
        //     ),
        //     color: Colors.black,
        //     onPressed: () {
        //       _onBackButtonPressed(context);
        //     },
        //   ),
        // ),
        appBar: SearchAppBar(
          scaffoldKey: scaffoldKey,
        ),
        body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
            if (state is CategoriesError || state is CategoriesNetworkError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state is CategoriesError
                        ? (state.msg ?? 'something_wrong'.translate)
                        : state is CategoriesNetworkError
                            ? (state.msg ?? 'something_wrong'.translate)
                            : '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(categoriesCubit.category.length, (index) {
                    var cat = categoriesCubit.category[index];
                    return CategoryItem(
                      showDivider: true, //cat != categoriesCubit.category.last,
                      onPressed: () {
                        context.read<FilterCarsCubit>()
                          ..getManufacturer(
                            context,
                            categoryId: cat.id,
                          )
                          ..getCarMades(
                            context,
                            categoryId: cat.id,
                          );

                        var hasSubCat = categoriesCubit.hasSubCategory(cat.id);
                        // if (hasSubCat) {
                        var subCat = context.read<SubCategoriesCubit>();
                        subCat.categoryName = cat.name;
                        subCat.parentId = cat.id;
                        // NavigationService.push(
                        //   page: SubCategoriesScreen.routeName,
                        //   arguments: {
                        //     'category_name': cat.name,
                        //     'parent_id': cat.id,
                        //   },
                        // );
                        // context.router.push(
                        //  catego,
                        // );
                        // }
                        context.router.push(
                          route.SubCategoriesScreen(
                            categoryName: cat.name,
                            parentId: cat.id.toString(),
                          ),
                        );
                      },
                      categoryName: cat.name,
                      categoryImage: cat.image,
                    );
                  }),
                  ...List.generate(
                      categoriesCubit.categoriesScreenSubCat.length, (index) {
                    var cat = categoriesCubit.categoriesScreenSubCat[index];
                    return CategoryItem(
                      showDivider:
                          cat != categoriesCubit.categoriesScreenSubCat.last,
                      onPressed: () {
                        log('catId => ${cat.id}');
                        if (cat.slug == 'tools-equipment') {
                          // NavigationService.push(page: ToolsScreen.routeName);
                          context.router.push(
                            const route.ToolsScreen(),
                          );
                        }
                        if (cat.slug == 'tyres') {
                          context.router.push(
                            route.TyresScreen(
                              tabIndex: cat.id,
                            ),
                          );
                        }
                        if (cat.slug == 'filters') {
                          context.router.push(
                            route.FilterRouter(
                              categoryName: cat.name,
                              parentId: cat.id.toString(),
                            ),
                          );
                        }
                        if (cat.slug == 'brakes') {
                          context.router.push(
                            route.BrakesRouter(),
                          );
                        }
                        if (cat.slug == 'car-accessories') {
                          // NavigationService.push(
                          //   page: CarAccessoriesScreen.routeName,
                          //   arguments: {
                          //     'category_name': cat.name,
                          //     'parent_id': cat.id,
                          //   },
                          // );
                          context.router.push(
                            route.CarAccessoriesScreen(
                              name: cat.name,
                              parentId: cat.id.toString(),
                            ),
                          );
                          return;
                        }
                        var hasSubCat = categoriesCubit.hasSubCategory(cat.id);
                        log('message $hasSubCat ${cat.id}');
                        if (hasSubCat) {
                          var subCat = context.read<SubCategoriesCubit>();
                          subCat.categoryName = cat.name;
                          subCat.parentId = cat.id;
                          // NavigationService.push(
                          //   page: SubCategoriesScreen.routeName,
                          //   arguments: {
                          //     'category_name': cat.name,
                          //     'parent_id': cat.id,
                          //   },
                          // );
                          context.router.push(
                            route.SubCategoriesScreen(
                              categoryName: cat.name,
                              parentId: cat.parentId,
                            ),
                          );
                        }
                      },
                      categoryName: cat.name,
                      categoryImage: cat.image,
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

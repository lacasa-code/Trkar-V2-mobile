import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/carAccessories/view/car_accessories_screen.dart';
import 'package:trkar/categories/view/sub_categories_screen.dart';
import 'package:trkar/categories/view/widgets/category_item.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
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
      ..getCategories(context);
    super.initState();
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    var tab = context.read<TabCubit>();
    tab.changeTabIndex(0);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _onBackButtonPressed(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'categories'.translate,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            color: Colors.black,
            onPressed: () {
              _onBackButtonPressed(context);
            },
          ),
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
                        NavigationService.push(
                          page: SubCategoriesScreen.routeName,
                          arguments: {
                            'category_name': cat.name,
                            'parent_id': cat.id,
                          },
                        );
                        // }
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
                        if (cat.slug == 'tyres') {
                          NavigationService.push(page: TyresScreen.routeName);
                        }
                        if (cat.slug == 'car-accessories') {
                          NavigationService.push(
                            page: CarAccessoriesScreen.routeName,
                          );
                          return;
                        }
                        var hasSubCat = categoriesCubit.hasSubCategory(cat.id);
                        log('message $hasSubCat ${cat.id}');
                        if (hasSubCat) {
                          var subCat = context.read<SubCategoriesCubit>();
                          subCat.categoryName = cat.name;
                          subCat.parentId = cat.id;
                          NavigationService.push(
                            page: SubCategoriesScreen.routeName,
                            arguments: {
                              'category_name': cat.name,
                              'parent_id': cat.id,
                            },
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

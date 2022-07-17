import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/categories/view/widgets/categories_header.dart';
import 'package:trkar/categories/view/widgets/category_item.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/helper/helper.dart';

class SubSubCategoriesScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const SubSubCategoriesScreen({
    Key? key,
    required this.subCategoriesCubit,
  }) : super(key: key);
  final SubCategoriesCubit subCategoriesCubit;

  @override
  State<SubSubCategoriesScreen> createState() => _SubSubCategoriesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: subCategoriesCubit,
        ),
      ],
      child: this,
    );
  }
}

class _SubSubCategoriesScreenState extends State<SubSubCategoriesScreen> {
  late SubCategoriesCubit subCategoriesCubit;
  var isGrid = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    subCategoriesCubit = context.read<SubCategoriesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('${subCategoriesCubit.categoryName}');
    return Scaffold(
      key: scaffoldKey,
      appBar: SearchAppBar(
        scaffoldKey: scaffoldKey,
      ),
      body: Column(
        children: [
          CategoriesHeader(
            isGrid: isGrid,
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
            title: 'categories',
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isGrid ? 2 : 1,

                childAspectRatio: isGrid ? 1.1 : 4.5,
                crossAxisSpacing: isGrid ? 6 : 0.0,

                // crossAxisSpacing: 20,
                // mainAxisExtent: 20,
                // mainAxisSpacing: 1,
              ),
              children: List.generate(
                subCategoriesCubit.subCategories.length,
                (index) {
                  var subCat = subCategoriesCubit.subCategories[index];
                  return CategoryItem(
                    onPressed: () =>
                        subCategoriesCubit.subCategoriesOnClickHandler(
                      context: context,
                      catId: subCat.id,
                      catSlug: subCat.slug,
                      categoryName: Helper.currentLanguage == 'ar'
                          ? subCat.nameAr
                          : subCat.nameEn,
                    ),
                    categoryName: Helper.currentLanguage == 'ar'
                        ? subCat.nameAr
                        : subCat.nameEn,
                    categoryImage: subCat.image,
                    isListView: !isGrid,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

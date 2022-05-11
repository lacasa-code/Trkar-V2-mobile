import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/categories/view/widgets/category_item.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_icon.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../../core/extensions/string.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/tab/viewModel/cubit/tab_cubit.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);
  static const routeName = '/sub-categories-screen';

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  late SubCategoriesCubit subcategoriesCubit;
  @override
  void initState() {
    subcategoriesCubit = BlocProvider.of<SubCategoriesCubit>(context)
      ..getSubCategories(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SearchIcon(
            categoryId: subcategoriesCubit.parentId,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          subcategoriesCubit.categoryName ?? 'categories'.translate,
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
            NavigationService.goBack();
          },
        ),
      ),
      body: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
        builder: (context, state) {
          if (state is SubCategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                  subcategoriesCubit.subCategories
                      .where((element) {
                        return element.parentId ==
                            subcategoriesCubit.parentId.toString();
                      })
                      .toList()
                      .length, (index) {
                var cat = subcategoriesCubit.subCategories
                    .where((element) =>
                        element.parentId ==
                        subcategoriesCubit.parentId.toString())
                    .toList()[index];
                return CategoryItem(
                  showDivider: cat !=
                      subcategoriesCubit.subCategories
                          .where((element) {
                            return element.parentId ==
                                subcategoriesCubit.parentId.toString();
                          })
                          .toList()
                          .last,
                  onPressed: () async {
                    var hasSubCat = await subcategoriesCubit.hasSubCategories(
                        cat.id ?? 0, context);
                    if (hasSubCat) {
                      NavigationService.push(
                          page: SubCategoriesScreen.routeName,
                          arguments: {
                            'category_name': Helper.currentLanguage == 'ar'
                                ? cat.nameAr
                                : cat.nameEn,
                            'parent_id': cat.id,
                          });
                    }
                  },
                  categoryName:
                      Helper.currentLanguage == 'ar' ? cat.nameAr : cat.nameEn,
                  categoryImage: cat.image,
                );
              }),
            ),
          );
        },
      ),
    );
  }
}

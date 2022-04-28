import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/categories/view/widgets/category_item.dart';
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
  late CategoriesCubit categoriesCubit;
  @override
  void initState() {
    categoriesCubit = BlocProvider.of<CategoriesCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('message ${categoriesCubit.categoryId}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          categoriesCubit.selectedCategory?.name ?? 'categories'.translate,
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
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children:
                  List.generate(categoriesCubit.subCategory.length, (index) {
                var cat = categoriesCubit.subCategory[index];
                return CategoryItem(
                  onPressed: () {},
                  categoryName: cat.name,
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

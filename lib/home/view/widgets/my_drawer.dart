import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/home/view/widgets/sub_cat_card.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late CategoriesCubit categoriesCubit;
  late SubCategoriesCubit subCategoriesCubit;

  @override
  void initState() {
    categoriesCubit = context.read<CategoriesCubit>();
    subCategoriesCubit = context.read<SubCategoriesCubit>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
      builder: (context, state) {
        return BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            return Drawer(
                child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    ...categoriesCubit.maincategory
                        .map(
                          (e) => ExpansionTile(
                            onExpansionChanged: (v) {
                              if (v) {}
                            },
                            title: Text(
                              e.name ?? '',
                              style: const TextStyle(color: Colors.black),
                            ),
                            children: categoriesCubit
                                .subCategories(e.id ?? 0)
                                .where((element) =>
                                    element.parentId == e.id.toString())
                                .map(
                              (subCat) {
                                return SubCatCard(
                                  catID: subCat.id,
                                  title: subCat.name,
                                );
                              },
                            ).toList(),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ));
          },
        );
      },
    );
  }
}

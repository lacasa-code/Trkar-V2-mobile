import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/search_view.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/components/sub_cat_item.dart';
import 'package:trkar/home/view/widgets/home_product_item.dart';
import 'package:trkar/search/viewModel/search/search_cubit.dart';
import '../../core/extensions/string.dart';

class FiltersScreen extends StatefulWidget implements AutoRouteWrapper {
  const FiltersScreen({
    Key? key,
    this.categoryName,
    this.parentId,
  }) : super(key: key);
  final String? categoryName, parentId;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SubCategoriesCubit(
            categoryName: categoryName,
            parentId: parentId,
          ),
        ),
        BlocProvider(
          create: (_) => SearchCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SearchCubit searchCubit;
  @override
  void initState() {
    searchCubit = context.read<SearchCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: SearchAppBar(
        scaffoldKey: scaffoldKey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchView(
              searchCubit: searchCubit,
            ),
            const CarFiltersSubCategoriesView(),
            const TopFiltersSellers(),
          ],
        ),
      ),
    );
  }
}

class CarFiltersSubCategoriesView extends StatelessWidget {
  const CarFiltersSubCategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'please_choose_filters_category'.translate,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
          children: List.generate(
            10,
            (index) => const SubCategoryItem(),
          ),
        ),
      ],
    );
  }
}

class TopFiltersSellers extends StatelessWidget {
  const TopFiltersSellers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BoxHelper(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'top_sellers_filters'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                8,
                (index) => const HomeProductItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

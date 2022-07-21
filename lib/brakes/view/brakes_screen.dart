import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/brakes/view/widgets/brakes_system_spare_view.dart';
import 'package:trkar/brakes/view/widgets/car_brakes_subcategories_view.dart';
import 'package:trkar/brakes/view/widgets/top_brakes_sellers.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/search_view.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/search/viewModel/search/search_cubit.dart';
import '../../core/extensions/string.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/components/sub_cat_item.dart';
import 'package:trkar/core/components/home_product_item.dart';

class BrakesScreen extends StatefulWidget implements AutoRouteWrapper {
  const BrakesScreen({
    Key? key,
    this.categoryName,
    this.parentId,
  }) : super(key: key);
  final String? categoryName, parentId;

  @override
  _BrakesScreenState createState() => _BrakesScreenState();

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

class _BrakesScreenState extends State<BrakesScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SearchCubit searchCubit;
  late SubCategoriesCubit subCategoriesCubit;

  @override
  void initState() {
    subCategoriesCubit = context.read<SubCategoriesCubit>()
      ..getSubCategories(context);
    searchCubit = context.read<SearchCubit>()
      ..getCarMades(
        context,
        categoryId: widget.parentId,
      );

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
            const CarBrakesSubCategoriesView(),
            const BrakesSystemSpareView(),
            const TopBrakesSellers(),
          ],
        ),
      ),
    );
  }
}

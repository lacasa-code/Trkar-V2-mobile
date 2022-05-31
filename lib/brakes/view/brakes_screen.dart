import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/core/components/search_view.dart';
import 'package:trkar/search/viewModel/search/search_cubit.dart';
import '../../core/extensions/string.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/components/sub_cat_item.dart';
import 'package:trkar/home/view/widgets/home_product_item.dart';

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

  @override
  void initState() {
    searchCubit = context.read<SearchCubit>()..getCarMades(context);

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

class CarBrakesSubCategoriesView extends StatelessWidget {
  const CarBrakesSubCategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'please_choose_brakes_category'.translate,
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

class TopBrakesSellers extends StatelessWidget {
  const TopBrakesSellers({
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
              'top_brakes_sellers'.translate,
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

class BrakesSystemSpareView extends StatelessWidget {
  const BrakesSystemSpareView({
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
              'brakes_system_spare'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const BoxHelper(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              children: List.generate(
                4,
                (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Image.asset(
                    'assets/images/toolsBrand${index + 1}.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

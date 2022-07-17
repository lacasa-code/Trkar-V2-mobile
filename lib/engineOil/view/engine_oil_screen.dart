import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/customized_app_bar.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/search_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/engineOil/view/widgets/engine_oil_requirements_view.dart';
import 'package:trkar/engineOil/view/widgets/oil_popular_brands_view.dart';
import 'package:trkar/engineOil/view/widgets/select_vehicle_view.dart';
import 'package:trkar/engineOil/view/widgets/top_car_maker_view.dart';
import 'package:trkar/engineOil/view/widgets/top_oil_deals_view.dart';
import 'package:trkar/engineOil/viewModel/engineOil/engine_oil_cubit.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../core/extensions/string.dart';

class EngineOilScreen extends StatefulWidget implements AutoRouteWrapper {
  const EngineOilScreen({
    Key? key,
    this.categoryId,
  }) : super(key: key);
  final String? categoryId;

  static const routeName = '/engine-oil-screen';

  @override
  State<EngineOilScreen> createState() => _EngineOilScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => EngineOilCubit(),
        ),
        BlocProvider(
          create: (_) => FilterCarsCubit(),
        ),
        BlocProvider(
          create: (_) => SubCategoriesCubit(
            parentId: categoryId,
          ),
        ),
      ],
      child: this,
    );
  }
}

class _EngineOilScreenState extends State<EngineOilScreen>
    with SingleTickerProviderStateMixin {
  late EngineOilCubit engineOilCubit;
  late FilterCarsCubit filterCarsCubit;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: 2,
      vsync: this,
    );
    engineOilCubit = context.read<EngineOilCubit>()
      ..getCarMades(
        context,
        categoryId: widget.categoryId,
      );
    filterCarsCubit = context.read<FilterCarsCubit>()
      ..getManufacturer(
        context,
        categoryId: widget.categoryId,
      );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      drawer: const MyDrawer(),
      appBar: CustomizedAppBar(
        context: context,
        scaffoldKey: scaffoldKey,
        title: 'engine_oil'.translate,
      ),
      body: BlocBuilder<EngineOilCubit, EngineOilState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SearchField(removePadding: false),
                TabBar(
                  onTap: engineOilCubit.changeSearchType,
                  indicatorColor: Theme.of(context).primaryColor,
                  labelPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  controller: controller,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.black,
                  labelColor: Theme.of(context).primaryColor,
                  tabs: [
                    Text(
                      'search_by_car'.translate,
                    ),
                    Text(
                      'search_by_viscosity_grade'.translate,
                    ),
                  ],
                ),
                // RadioListTile(
                //   value: 0,
                //   groupValue: engineOilCubit.selectedSearchValue,
                //   onChanged: engineOilCubit.changeSearchType,
                //   title: Text(
                //     'search_by_car'.translate,
                //   ),
                // ),
                // RadioListTile(
                //   value: 1,
                //   groupValue: engineOilCubit.selectedSearchValue,
                //   onChanged: engineOilCubit.changeSearchType,
                //   title: Text(
                //     'search_by_viscosity_grade'.translate,
                //   ),
                // ),
                const BoxHelper(
                  height: 20,
                ),
                engineOilCubit.selectedSearchValue == 0
                    ? SelectVehicleView(engineOilCubit: engineOilCubit)
                    : const EngineOilRequirementsView(),
                // const BoxHelper(
                //   height: 20,
                // ),
                // const OilPopularBrandView(),
                const BoxHelper(
                  height: 20,
                ),
                const TopCarMakerView(),
                const BoxHelper(
                  height: 20,
                ),
                const TopOilDealsView(),
              ],
            ),
          );
        },
      ),
    );
  }
}

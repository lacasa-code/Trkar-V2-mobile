import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/dropdown_title_view.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/engineOil/view/widgets/engine_oil_requirements_view.dart';
import 'package:trkar/engineOil/view/widgets/oil_popular_brands_view.dart';
import 'package:trkar/engineOil/view/widgets/select_vehicle_view.dart';
import 'package:trkar/engineOil/view/widgets/top_car_maker_view.dart';
import 'package:trkar/engineOil/view/widgets/top_oil_deals_view.dart';
import 'package:trkar/engineOil/viewModel/engineOil/engine_oil_cubit.dart';
import 'package:trkar/core/components/home_product_item.dart';
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

class _EngineOilScreenState extends State<EngineOilScreen> {
  late EngineOilCubit engineOilCubit;
  late FilterCarsCubit filterCarsCubit;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    engineOilCubit = context.read<EngineOilCubit>()
      ..getCarMades(
        context,
        // categoryId: widget.categoryId,
      );
    filterCarsCubit = context.read<FilterCarsCubit>()
      ..getManufacturer(
        context,
        categoryId: widget.categoryId,
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      drawer: const MyDrawer(),

      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   // titleTextStyle: const TextStyle(
      //   //   color: Colors.black,
      //   // ),
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //     color: Colors.black,
      //     onPressed: () {
      //       NavigationService.goBack();
      //     },
      //   ),
      //   title: Text(
      //     'engine_oil'.translate,
      //     style: const TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: BlocBuilder<EngineOilCubit, EngineOilState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                RadioListTile(
                  value: 0,
                  groupValue: engineOilCubit.selectedSearchValue,
                  onChanged: engineOilCubit.changeSearchType,
                  title: Text(
                    'search_by_car'.translate,
                  ),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: engineOilCubit.selectedSearchValue,
                  onChanged: engineOilCubit.changeSearchType,
                  title: Text(
                    'search_by_viscosity_grade'.translate,
                  ),
                ),
                const BoxHelper(
                  height: 20,
                ),
                engineOilCubit.selectedSearchValue == 0
                    ? SelectVehicleView(engineOilCubit: engineOilCubit)
                    : const EngineOilRequirementsView(),
                const BoxHelper(
                  height: 20,
                ),
                const OilPopularBrandView(),
                const BoxHelper(
                  height: 20,
                ),
                const TopOilDealsView(),
                const BoxHelper(
                  height: 20,
                ),
                const TopCarMakerView(),
              ],
            ),
          );
        },
      ),
    );
  }
}

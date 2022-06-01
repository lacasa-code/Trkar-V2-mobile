import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/dropdown_title_view.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/engineOil/view/widgets/select_vehicle_view.dart';
import 'package:trkar/engineOil/viewModel/engineOil/engine_oil_cubit.dart';
import 'package:trkar/core/components/home_product_item.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../core/extensions/string.dart';

class EngineOilScreen extends StatefulWidget implements AutoRouteWrapper {
  const EngineOilScreen({Key? key}) : super(key: key);
  static const routeName = '/engine-oil-screen';

  @override
  State<EngineOilScreen> createState() => _EngineOilScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<EngineOilCubit>(
      create: (_) => EngineOilCubit(),
      child: this,
    );
  }
}

class _EngineOilScreenState extends State<EngineOilScreen> {
  late EngineOilCubit engineOilCubit;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    engineOilCubit = context.read<EngineOilCubit>()..getCarMades(context);
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

class TopOilDealsView extends StatelessWidget {
  const TopOilDealsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'top_oil_deals'.translate,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Text(
            'top_oil_deals_body'.translate,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const BoxHelper(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              6,
              (index) => const ProductItem(),
            ),
          ),
        ),
      ],
    );
  }
}

class OilPopularBrandView extends StatelessWidget {
  const OilPopularBrandView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'popular_engine_oil_brand'.translate,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Wrap(
            runSpacing: ScreenUtil().setHeight(20),
            spacing: ScreenUtil().setWidth(30),
            children: List.generate(
              39,
              (index) {
                return Image.asset(
                  'assets/icons/oliBrands/oilbrand${index + 1}.png',
                  // fit: BoxFit.cover,
                  height: ScreenUtil().setHeight(60),
                  width: ScreenUtil().setHeight(60),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TopCarMakerView extends StatelessWidget {
  const TopCarMakerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'engine_oil_top_car_maker'.translate,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Wrap(
            runSpacing: ScreenUtil().setHeight(20),
            spacing: ScreenUtil().setWidth(30),
            children: List.generate(
              4,
              (index) {
                return Image.asset(
                  'assets/images/brand${index + 1}.png',
                  // fit: BoxFit.cover,
                  height: ScreenUtil().setHeight(60),
                  width: ScreenUtil().setHeight(60),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class EngineOilRequirementsView extends StatelessWidget {
  const EngineOilRequirementsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'select_engine_oil'.translate,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DropDownTileView(
          removePadding: false,
          title: 'viscosity_grade',
          values: List.generate(
            5,
            (index) => 'grade ${index + 1}',
          ),
          onChanged: (v) {},
        ),
        DropDownTileView(
          removePadding: false,
          title: 'brand',
          values: List.generate(
            5,
            (index) => 'brand ${index + 1}',
          ),
          onChanged: (v) {},
        ),
        DropDownTileView(
          removePadding: false,
          title: 'oem_approval',
          values: List.generate(
            5,
            (index) => 'oem_approval ${index + 1}',
          ),
          onChanged: (v) {},
        ),
        DropDownTileView(
          removePadding: false,
          title: 'specification',
          values: List.generate(
            5,
            (index) => 'specification ${index + 1}',
          ),
          onChanged: (v) {},
        ),
        const BoxHelper(
          height: 20,
        ),
        RegisterButton(
          title: 'search',
          onPressed: () {},
          radius: 10,
        ),
      ],
    );
  }
}

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/dropdown_title_view.dart';
import 'package:trkar/core/components/dropdown_widget.dart';
import 'package:trkar/core/components/loader_widget.dart';
import 'package:trkar/core/components/multiselect_dropdown_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/section_header_item.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/components/home_product_item.dart';
import 'package:trkar/core/themes/screen_utility.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/tyres/viewModel/tyresFilter/tyres_filter_cubit.dart';
import '../../core/extensions/string.dart';

class TyresScreen extends StatefulWidget implements AutoRouteWrapper {
  const TyresScreen({
    Key? key,
    this.tabIndex,
  }) : super(key: key);
  final int? tabIndex;

  static const routeName = '/tyres-screen';

  @override
  State<TyresScreen> createState() => _TyresScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => TyresFilterCubit(
        myTabIndex: tabIndex,
      ),
      child: this,
    );
  }
}

class _TyresScreenState extends State<TyresScreen>
    with SingleTickerProviderStateMixin {
  List<dynamic> tabs = [
    {
      'title': 'car_passengers'.translate,
      'icon': 'assets/icons/passenger.png',
    },
    {
      'title': 'suv'.translate,
      'icon': 'assets/icons/SUV.png',
    },
    {
      'title': 'light_truck'.translate,
      'icon': 'assets/icons/light-truck.png',
    },
    {
      'title': 'truck'.translate,
      'icon': 'assets/icons/truck.png',
    },
  ];
  late TyresFilterCubit tyresFilterCubit;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isWinter = false;
  bool isMaxScroll = false;

  @override
  void initState() {
    tyresFilterCubit = context.read<TyresFilterCubit>()..init(context);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('width length=> ${tyresFilterCubit.width.length}');
    return Scaffold(
      key: scaffoldKey,
      appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: IconButton(
      //       onPressed: () {
      //         NavigationService.goBack();
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back,
      //         color: Colors.black,
      //       )),
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //     'tyres'.translate,
      //     style: const TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      drawer: const MyDrawer(),
      body: BlocBuilder<TyresFilterCubit, TyresFilterState>(
        builder: (context, state) {
          if (state is TypesLoaing) {
            return const LoaderWidget();
          }

          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TypesTabsView(tyresFilterCubit: tyresFilterCubit),
                      state is SeasonsLoading
                          ? const LoaderWidget()
                          : Column(
                              children: [
                                Visibility(
                                  visible: tyresFilterCubit.tabIndex < 3,
                                  child: state is SeasonsLoading
                                      ? const LoaderWidget()
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: DropDownTileView(
                                            onChanged: tyresFilterCubit
                                                .onSeasonDropdownChanged,
                                            title: 'season',
                                            values: tyresFilterCubit.seasons
                                                .map(
                                                  (e) => e.name ?? '',
                                                )
                                                .toList(),
                                            selectedValue:
                                                tyresFilterCubit.seasons.isEmpty
                                                    ? null
                                                    : tyresFilterCubit
                                                        .seasons.first.name,
                                          ),
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Visibility(
                                        visible: tyresFilterCubit.canBeCleared,
                                        child: IconButton(
                                          onPressed: () =>
                                              tyresFilterCubit.clearLists(),
                                          icon: const Icon(
                                            Icons.refresh,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: state is WidthLoading
                                                ? const LoaderWidget()
                                                : DropDownTileView(
                                                    key: ValueKey(
                                                        tyresFilterCubit
                                                                .width.length +
                                                            1),
                                                    selectedValue:
                                                        tyresFilterCubit
                                                            .selectedWidthValue,
                                                    enabled: tyresFilterCubit
                                                            .width.length >
                                                        1,
                                                    onChanged: tyresFilterCubit
                                                        .onWidthDropdownChanged,
                                                    title: 'width',
                                                    values:
                                                        tyresFilterCubit.width,
                                                  ),
                                          ),
                                          const BoxHelper(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: state is HeightLoading
                                                ? const LoaderWidget()
                                                : DropDownTileView(
                                                    key: ValueKey(
                                                        tyresFilterCubit
                                                                .height.length +
                                                            2),
                                                    selectedValue:
                                                        tyresFilterCubit
                                                            .selectedHeightValue,
                                                    enabled: tyresFilterCubit
                                                            .height.length >
                                                        1,
                                                    onChanged: tyresFilterCubit
                                                        .onHeightDropdownChanged,
                                                    title: 'height',
                                                    values: List.generate(
                                                      tyresFilterCubit
                                                          .height.length,
                                                      (index) {
                                                        var height =
                                                            tyresFilterCubit
                                                                .height[index];
                                                        return height;
                                                      },
                                                    ),
                                                  ),
                                          ),
                                          const BoxHelper(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: state is DiameterLoading
                                                ? const LoaderWidget()
                                                : DropDownTileView(
                                                    key: ValueKey(
                                                        tyresFilterCubit
                                                                .diameter
                                                                .length +
                                                            3),
                                                    selectedValue:
                                                        tyresFilterCubit
                                                            .diameter.first,
                                                    enabled: tyresFilterCubit
                                                            .diameter.length >
                                                        1,
                                                    onChanged: (value) {},
                                                    title: 'diameter',
                                                    values: List.generate(
                                                        tyresFilterCubit
                                                            .diameter
                                                            .length, (index) {
                                                      var diameter =
                                                          tyresFilterCubit
                                                              .diameter[index];
                                                      return diameter;
                                                    }),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Image.asset(
                                    'assets/icons/select_tire_${Helper.currentLanguage}.png',
                                    width: double.infinity,
                                  ),
                                ),
                                Visibility(
                                  visible: tyresFilterCubit.tabIndex == 3,
                                  child: CheckboxListTile(
                                    value: isWinter,
                                    onChanged: (v) {
                                      setState(() {
                                        isWinter = v!;
                                      });
                                    },
                                    title: Text('winter_tyres'.translate),
                                  ),
                                ),
                                const BoxHelper(
                                  height: 20,
                                ),
                                Visibility(
                                  visible: tyresFilterCubit.tabIndex <= 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 0),
                                    child: Column(
                                      children: [
                                        state is TyresManufacturersLoading
                                            ? const LoaderWidget()
                                            : TyresMultiselectDropDownView(
                                                title: 'manufacturer',
                                                values: List.generate(
                                                  tyresFilterCubit
                                                      .manufacturer.length,
                                                  (index) {
                                                    var manufacturer =
                                                        tyresFilterCubit
                                                                .manufacturer[
                                                            index];
                                                    return manufacturer;
                                                  },
                                                ),
                                              ),
                                        const BoxHelper(
                                          height: 5,
                                        ),
                                        Visibility(
                                          visible:
                                              tyresFilterCubit.tabIndex <= 1,
                                          child: state is SpeedRatingLoading
                                              ? const LoaderWidget()
                                              : TyresMultiselectDropDownView(
                                                  enabled: tyresFilterCubit
                                                      .speedRating.isNotEmpty,
                                                  title: 'speed_rating',
                                                  values: List.generate(
                                                    tyresFilterCubit
                                                        .speedRating.length,
                                                    (index) => tyresFilterCubit
                                                        .speedRating[index],
                                                  ),
                                                ),
                                        ),
                                        Visibility(
                                          visible:
                                              tyresFilterCubit.tabIndex == 2,
                                          child: state is TyresLoadIndexLoading
                                              ? const LoaderWidget()
                                              : TyresMultiselectDropDownView(
                                                  title: 'load_index',
                                                  enabled: tyresFilterCubit
                                                      .loadIndex.isNotEmpty,
                                                  values: tyresFilterCubit
                                                      .loadIndex,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: tyresFilterCubit.tabIndex == 3,
                                  child: LightTruckView(
                                    tyresFilterCubit: tyresFilterCubit,
                                  ),
                                ),
                                const BoxHelper(
                                  height: 15,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: ScreenUtil().setWidth(170),
                                    // height: ScreenUtil().setHeight(55),
                                    child: RegisterButton(
                                      radius: 10,
                                      title: 'search',
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.search,
                                      ),
                                    ),
                                  ),
                                ),
                                const BoxHelper(
                                  height: 20,
                                ),
                              ],
                            ),
                      const BestSellersView(),
                      const PremiumTyresBrand(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class LightTruckView extends StatelessWidget {
  const LightTruckView({
    Key? key,
    required this.tyresFilterCubit,
  }) : super(key: key);

  final TyresFilterCubit tyresFilterCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TyresFilterCubit, TyresFilterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              state is SpeedRatingLoading
                  ? const LoaderWidget()
                  : TyresMultiselectDropDownView(
                      title: 'speed_rating',
                      enabled: tyresFilterCubit.speedRating.isNotEmpty,
                      values: List.generate(
                        tyresFilterCubit.speedRating.length,
                        (index) => tyresFilterCubit.speedRating[index],
                      ),
                    ),
              const BoxHelper(
                height: 5,
              ),
              state is TyresAxleLoading
                  ? const LoaderWidget()
                  : TyresMultiselectDropDownView(
                      title: 'axle',
                      values: tyresFilterCubit.axle,
                      enabled: tyresFilterCubit.axle.isNotEmpty,
                    ),
              const BoxHelper(
                height: 5,
              ),
              state is TyresManufacturersLoading
                  ? const LoaderWidget()
                  : TyresMultiselectDropDownView(
                      title: 'manufacturer',
                      enabled: tyresFilterCubit.manufacturer.isNotEmpty,
                      values: List.generate(
                        tyresFilterCubit.manufacturer.length,
                        (index) {
                          var manufacturer =
                              tyresFilterCubit.manufacturer[index];
                          return manufacturer;
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

class PremiumTyresBrand extends StatelessWidget {
  const PremiumTyresBrand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'premium_tyres_brand'.translate,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(15),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                4,
                (index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Image.asset(
                      'assets/images/brand1.png',
                      fit: BoxFit.cover,
                    ),
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

class BestSellersView extends StatelessWidget {
  const BestSellersView({
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
          SectionHeaderItem(
            title: 'best_sellers'.translate,
            onViewAllPressed: () {},
            showViewAll: true,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                8,
                (index) => const ProductItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TypesTabsView extends StatelessWidget {
  const TypesTabsView({
    Key? key,
    required this.tyresFilterCubit,
  }) : super(key: key);

  final TyresFilterCubit tyresFilterCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: tyresFilterCubit.isMax,
          child: IconButton(
            onPressed: () => tyresFilterCubit.animateTo(scrollToEnd: false),
            icon: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: tyresFilterCubit.controller,
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              ...List.generate(
                tyresFilterCubit.types.length,
                (index) => TyresTabItem(
                  title: tyresFilterCubit.types[index].name ?? '',
                  imagePath: tyresFilterCubit.types[index].image ?? '',
                  onTap: () => tyresFilterCubit.changeTypesTabIndex(
                    index,
                    context,
                  ),
                  isSelected: tyresFilterCubit.tabIndex == index,
                ),
              ),
            ]),
          ),
        ),
        Visibility(
          visible: !tyresFilterCubit.isMax,
          child: IconButton(
            onPressed: () => tyresFilterCubit.animateTo(scrollToEnd: true),
            icon: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ),
        /*
        Positioned(
          left: ScreenUtil().setWidth(3),
          right: ScreenUtil().setWidth(3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: tyresFilterCubit.isMax,
                child: IconButton(
                  onPressed: () =>
                      tyresFilterCubit.animateTo(scrollToEnd: false),
                  icon: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !tyresFilterCubit.isMax,
                child: IconButton(
                  onPressed: () =>
                      tyresFilterCubit.animateTo(scrollToEnd: true),
                  icon: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        */
      ],
    );
  }
}

class TyresMultiselectDropDownView extends StatelessWidget {
  const TyresMultiselectDropDownView({
    Key? key,
    required this.title,
    required this.values,
    this.selectedValue,
    this.enabled = true,
  }) : super(key: key);
  final String title;
  final List<String> values;
  final int? selectedValue;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 5),
        //   child: Text(
        //     title.translate,
        //     style: TextStyle(
        //       color: Colors.black,
        //       // fontWeight: FontWeight.bold,
        //       fontSize: ScreenUtil().setSp(14),
        //     ),
        //   ),
        // ),
        MultiSelectDropdownWidget(
          removePadding: true,
          enabled: enabled,
          selectedValueIndex: selectedValue,
          thinBorder: true,
          values: values,
          labelText: title.translate,
          onChanged: (v) {},
        ),
      ],
    );
  }
}

class TyresTabItem extends StatelessWidget {
  const TyresTabItem({
    Key? key,
    required this.title,
    required this.imagePath,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String imagePath;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        margin: const EdgeInsets.symmetric(
            // horizontal: 5,
            ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: !isSelected ? Colors.transparent : const Color(0xffF6B048),
            ),
          ),
        ),
        child: Column(
          children: [
            Image.network(
              imagePath,
              height: ScreenUtil().setHeight(60),
              width: ScreenUtil().setHeight(60),
            ),
            // const BoxHelper(
            //   width: 10,
            // ),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? const Color(0xffF6B048) : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

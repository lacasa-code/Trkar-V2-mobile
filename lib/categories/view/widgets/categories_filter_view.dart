import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/view/widgets/selected_section_chip_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import '../../../core/router/router.gr.dart' as route;

import '../../../core/components/register_button.dart';
import '../../../core/components/section_header_item.dart';
import '../../../core/components/sized_box_helper.dart';
import '../../../core/extensions/string.dart';
import '../../../core/themes/screen_utility.dart';

class CategoriesFilterView extends StatefulWidget {
  const CategoriesFilterView({Key? key}) : super(key: key);

  @override
  State<CategoriesFilterView> createState() => _CategoriesFilterViewState();
}

class _CategoriesFilterViewState extends State<CategoriesFilterView> {
  int? selectedBrandIndex, selectedManufacturerIndex;
  late FilterCarsCubit filterCarsCubit;
  @override
  void initState() {
    filterCarsCubit = context.read<FilterCarsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                      iconSize: ScreenUtil().radius(15),
                      color: Colors.black,
                    ),
                    Text(
                      'filters'.translate,
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: ScreenUtil().setSp(15),
                          ),
                    ),
                    TextButton(
                      onPressed: (selectedBrandIndex == null &&
                              selectedManufacturerIndex == null)
                          ? null
                          : () {
                              setState(() {
                                selectedBrandIndex = null;
                                selectedManufacturerIndex = null;
                              });
                            },
                      child: Text(
                        'reset'.translate,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: (selectedBrandIndex == null &&
                                      selectedManufacturerIndex == null)
                                  ? MainStyle.lightGreyColor
                                  : null,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(15),
                            ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              SectionHeaderItem(
                title: '${'brand'.translate} :',
                onViewAllPressed: () {
                  context.router.pop();
                  context.router.push(
                    const route.AllCarMadesScreen(),
                  );
                },
                showViewAll: filterCarsCubit.carMades.length > 6,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filterCarsCubit.carMades.length > 6
                        ? 6
                        : filterCarsCubit.carMades.length,
                    (index) {
                      var carMade = filterCarsCubit.carMades[index];
                      return SelectedSectionChip(
                        name: carMade.name ?? '',
                        onPressed: () {
                          setState(() {
                            selectedBrandIndex = index;
                          });
                        },
                        isSelected: selectedBrandIndex == index,
                      );
                    },
                  ).toList(),
                ),
              ),
              SectionHeaderItem(
                title: '${'manufacturer'.translate} :',
                onViewAllPressed: () {
                  context.router.pop();
                  context.router.push(
                    const route.AllManufacturersScreen(),
                  );
                },
                showViewAll: filterCarsCubit.categoriesManufacturers.length > 6,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filterCarsCubit.categoriesManufacturers.length > 6
                        ? 6
                        : filterCarsCubit.categoriesManufacturers.length,
                    (index) {
                      var manufacturer =
                          filterCarsCubit.categoriesManufacturers[index];
                      return SelectedSectionChip(
                        name: manufacturer.name ?? '',
                        onPressed: () {
                          setState(() {
                            selectedManufacturerIndex = index;
                          });
                        },
                        isSelected: selectedManufacturerIndex == index,
                      );
                    },
                  ).toList(),
                ),
              ),
              const BoxHelper(
                height: 15,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(60),
                child: RegisterButton(
                  radius: 10,
                  textSize: 14,
                  noLocalTitle:
                      '${'show'.translate} (0) ${'results'.translate}',
                  onPressed: () {
                    context.router.pop();
                  },
                ),
              ),
              const BoxHelper(
                height: 35,
              ),
            ],
          ),
        ),
      );
    });
  }
}

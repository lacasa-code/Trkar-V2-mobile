import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/dropdown_widget.dart';
import 'package:trkar/core/components/multiselect_dropdown_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/tyres/viewModel/tyresFilter/tyres_filter_cubit.dart';
import '../../core/extensions/string.dart';

class TyresScreen extends StatefulWidget {
  const TyresScreen({Key? key}) : super(key: key);
  static const routeName = '/tyres-screen';

  @override
  State<TyresScreen> createState() => _TyresScreenState();
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
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              NavigationService.goBack();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        title: Text(
          'tyres'.translate,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<TyresFilterCubit, TyresFilterState>(
        builder: (context, state) {
          if (state is TypesLoaing) {
            return const LoaderWidget();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SingleChildScrollView(
                      controller: tyresFilterCubit.controller,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          tyresFilterCubit.types.length,
                          (index) => TyresTabItem(
                            title: tyresFilterCubit.types[index].name ?? '',
                            imagePath:
                                tyresFilterCubit.types[index].image ?? '',
                            onTap: () =>
                                tyresFilterCubit.changeTypesTabIndex(index),
                            isSelected: tyresFilterCubit.tabIndex == index,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: ScreenUtil().setWidth(3),
                      right: ScreenUtil().setWidth(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: tyresFilterCubit.isMax,
                            child: IconButton(
                              onPressed: () => tyresFilterCubit.animateTo(
                                  scrollToEnd: false),
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
                  ],
                ),
                Visibility(
                  visible: tyresFilterCubit.tabIndex < 3,
                  child: state is SeasonsLoading
                      ? const LoaderWidget()
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: TyresDropDownView(
                            onChanged: tyresFilterCubit.onSeasonDropdownChanged,
                            title: 'season',
                            values: tyresFilterCubit.seasons
                                .map(
                                  (e) => e.name ?? '',
                                )
                                .toList(),
                            selectedValue: 0,
                          ),
                        ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: [
                      Expanded(
                        child: state is WidthLoading
                            ? const LoaderWidget()
                            : TyresDropDownView(
                                onChanged: (value) {},
                                title: 'width',
                                values: tyresFilterCubit.width
                                    .map((e) => e.value ?? '')
                                    .toList(),
                              ),
                      ),
                      const BoxHelper(
                        width: 5,
                      ),
                      Expanded(
                        child: TyresDropDownView(
                          onChanged: (value) {},
                          title: 'height',
                          values: const [
                            '31',
                            '34',
                            '12',
                          ],
                        ),
                      ),
                      const BoxHelper(
                        width: 5,
                      ),
                      Expanded(
                        child: TyresDropDownView(
                          onChanged: (value) {},
                          title: 'diameter',
                          values: const [
                            '31',
                            '34',
                            '12',
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Image.asset(
                    'assets/icons/select_tire.png',
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Column(
                      children: [
                        TyresMultiselectDropDownView(
                          title: 'manufacturer',
                          values: const [
                            'test1',
                            'test2',
                            'test3',
                          ],
                        ),
                        const BoxHelper(
                          height: 5,
                        ),
                        Visibility(
                          visible: tyresFilterCubit.tabIndex <= 1,
                          child: TyresMultiselectDropDownView(
                            title: 'speed_rating',
                            values: const [
                              '31',
                              '34',
                              '12',
                            ],
                          ),
                        ),
                        Visibility(
                          visible: tyresFilterCubit.tabIndex == 2,
                          child: TyresMultiselectDropDownView(
                            title: 'load_index',
                            values: const [
                              '31',
                              '34',
                              '12',
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: tyresFilterCubit.tabIndex == 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        TyresMultiselectDropDownView(
                          title: 'speed_rating',
                          values: const [
                            '31',
                            '34',
                            '12',
                          ],
                        ),
                        const BoxHelper(
                          height: 5,
                        ),
                        TyresMultiselectDropDownView(
                          title: 'axle',
                          values: const [
                            '31',
                            '34',
                            '12',
                          ],
                        ),
                        const BoxHelper(
                          height: 5,
                        ),
                        TyresMultiselectDropDownView(
                          title: 'manufacturer',
                          values: const [
                            'test1',
                            'test2',
                            'test3',
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const BoxHelper(
                  height: 15,
                ),
                RegisterButton(
                  radius: 10,
                  title: 'search',
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                const BoxHelper(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'tyres_brands'.translate,
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
                        child: Wrap(
                          direction: Axis.horizontal,
                          runSpacing: ScreenUtil().setHeight(20),
                          spacing: ScreenUtil().setWidth(15),
                          children: List.generate(
                            4,
                            (index) {
                              return Image.asset(
                                'assets/images/brand${index + 1}.png',
                                fit: BoxFit.cover,
                                height: ScreenUtil().setHeight(60),
                                width: ScreenUtil().setHeight(60),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TyresDropDownView extends StatelessWidget {
  const TyresDropDownView({
    Key? key,
    required this.title,
    required this.values,
    this.selectedValue,
    required this.onChanged,
  }) : super(key: key);
  final String title;
  final List<String> values;
  final int? selectedValue;
  final void Function(int?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            title.translate,
            style: TextStyle(
              color: Colors.black,
              // fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
        DropDownWidget(
          removePadding: true,
          selectedValueIndex: selectedValue,
          thinBorder: true,
          values: values,
          labelText: title,
          onChanged: onChanged,
        ),
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
  }) : super(key: key);
  final String title;
  final List<String> values;
  final int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            title.translate,
            style: TextStyle(
              color: Colors.black,
              // fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
        MultiselectDropdownWidget(
          removePadding: true,
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
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: !isSelected
              ? null
              : Theme.of(context).primaryColor.withOpacity(0.2),
          border: Border.all(
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Image.network(
              imagePath,
              height: ScreenUtil().setHeight(60),
              width: ScreenUtil().setHeight(60),
            ),
            const BoxHelper(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

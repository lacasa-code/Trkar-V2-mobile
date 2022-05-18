import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/carMades/view/all_car_mades_screen.dart';
import 'package:trkar/categories/manufacturers/view/all_manufacturers_screen.dart';
import 'package:trkar/categories/view/widgets/category_item.dart';
import 'package:trkar/categories/view/widgets/manufacturers_details_item.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_icon.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/extensions/string.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/tab/viewModel/cubit/tab_cubit.dart';
import '../../core/extensions/media_query.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);
  static const routeName = '/sub-categories-screen';

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  late SubCategoriesCubit subcategoriesCubit;
  late FilterCarsCubit filterCarsCubit;
  @override
  void initState() {
    filterCarsCubit = context.read<FilterCarsCubit>();
    subcategoriesCubit = BlocProvider.of<SubCategoriesCubit>(context)
      ..getSubCategories(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SearchIcon(
            categoryId: subcategoriesCubit.parentId,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          subcategoriesCubit.categoryName ?? 'categories'.translate,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.black,
          onPressed: () {
            NavigationService.goBack();
          },
        ),
      ),
      body: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
        builder: (context, state) {
          if (state is SubCategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<FilterCarsCubit, FilterCarsState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      state is CarMadesLoading
                          ? const LoaderWidget()
                          : BrandsView(filterCarsCubit: filterCarsCubit),
                      state is ManufacturersLoading
                          ? const LoaderWidget()
                          : ManufacturersView(filterCarsCubit: filterCarsCubit),
                    ],
                  );
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        subcategoriesCubit.subCategories
                            .where((element) {
                              return element.parentId ==
                                  subcategoriesCubit.parentId.toString();
                            })
                            .toList()
                            .length, (index) {
                      var cat = subcategoriesCubit.subCategories
                          .where((element) =>
                              element.parentId ==
                              subcategoriesCubit.parentId.toString())
                          .toList()[index];
                      return CategoryItem(
                        showDivider: cat !=
                            subcategoriesCubit.subCategories
                                .where((element) {
                                  return element.parentId ==
                                      subcategoriesCubit.parentId.toString();
                                })
                                .toList()
                                .last,
                        onPressed: () async {
                          log('catId =>${cat.id}');
                          var hasSubCat = await subcategoriesCubit
                              .hasSubCategories(cat.id ?? 0, context);
                          if (hasSubCat) {
                            NavigationService.push(
                                page: SubCategoriesScreen.routeName,
                                arguments: {
                                  'category_name':
                                      Helper.currentLanguage == 'ar'
                                          ? cat.nameAr
                                          : cat.nameEn,
                                  'parent_id': cat.id,
                                });
                          }
                        },
                        categoryName: Helper.currentLanguage == 'ar'
                            ? cat.nameAr
                            : cat.nameEn,
                        categoryImage: cat.image,
                      );
                    }),
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

class ManufacturersView extends StatelessWidget {
  const ManufacturersView({
    Key? key,
    required this.filterCarsCubit,
  }) : super(key: key);

  final FilterCarsCubit filterCarsCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              '${'manufacturers'.translate} :',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              runSpacing: ScreenUtil().setHeight(20),
              spacing: ScreenUtil().setWidth(15),
              children: List.generate(
                filterCarsCubit.categoriesManufacturers.length > 6
                    ? 6
                    : filterCarsCubit.categoriesManufacturers.length,
                (index) {
                  var manufacurer =
                      filterCarsCubit.categoriesManufacturers[index];
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: manufacurer.image != null,
                        child: Image.network(
                          manufacurer.image ?? '',
                          height: ScreenUtil().setHeight(40),
                          width: ScreenUtil().setHeight(40),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            manufacurer.name ?? '',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Visibility(
                            visible: false,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                    child: SizedBox(
                                      // margin: EdgeInsets.symmetric(
                                      //   horizontal: 15,
                                      // ),
                                      width: context.width,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ManufacturerDetailsItem(
                                                  title: 'Company Name :',
                                                  details:
                                                      manufacurer.categoryName,
                                                ),
                                                ManufacturerDetailsItem(
                                                  title: 'Address :',
                                                  details: manufacurer.address,
                                                ),
                                                ManufacturerDetailsItem(
                                                  title: 'website :',
                                                  details: manufacurer.website,
                                                  isLink: true,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: -ScreenUtil().setHeight(40),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    NavigationService.goBack();
                                                  },
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'show_address'.translate,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: ScreenUtil().setSp(10),
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 0.7,
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: kDebugMode || filterCarsCubit.manufacturers.length > 6,
          child: Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                NavigationService.push(
                  page: AllManufacturersScreen.routeName,
                );
              },
              child: Text(
                'more'.translate,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(13),
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}

class BrandsView extends StatelessWidget {
  const BrandsView({
    Key? key,
    required this.filterCarsCubit,
  }) : super(key: key);

  final FilterCarsCubit filterCarsCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              '${'brand'.translate} :',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              runSpacing: ScreenUtil().setHeight(20),
              spacing: ScreenUtil().setWidth(15),
              children: List.generate(
                filterCarsCubit.carMades.length > 6
                    ? 6
                    : filterCarsCubit.carMades.length,
                (index) {
                  var carMade = filterCarsCubit.carMades[index];
                  return Image.network(
                    carMade.image ?? '',
                    fit: BoxFit.cover,
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().setHeight(60),
                  );
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: filterCarsCubit.carMades.length > 6,
          child: Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                NavigationService.push(
                  page: AllCarMadesScreen.routeName,
                );
              },
              child: Text(
                'more'.translate,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(13),
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}

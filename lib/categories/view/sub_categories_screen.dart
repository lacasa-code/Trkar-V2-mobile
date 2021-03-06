import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/categories/view/widgets/categories_filter_view.dart';
import 'package:trkar/categories/view/widgets/manufacturers_details_item.dart';
import 'package:trkar/categories/view/widgets/sub_category_item.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/customized_app_bar.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/search_view.dart';
import 'package:trkar/core/components/search_widget.dart';
import 'package:trkar/core/components/section_header_item.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/router/router.gr.dart' as route;
import 'package:trkar/core/themes/screen_utility.dart';
import 'package:trkar/filterCars/model/manufacturers_model.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../core/extensions/string.dart';
import '../../core/extensions/media_query.dart';
import '../../search/viewModel/search/search_cubit.dart';
import 'package:trkar/core/components/loader_widget.dart';

class SubCategoriesScreen extends StatefulWidget implements AutoRouteWrapper {
  const SubCategoriesScreen({
    Key? key,
    this.categoryName,
    this.parentId,
    @PathParam('categoryId') this.categoryId,
  }) : super(key: key);
  final String? categoryName, categoryId, parentId;
  static const routeName = '/sub-categories-screen';

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(
          create: (_) => SearchCubit(),
        ),
        // BlocProvider<CategoriesCubit>.value(
        //   value: (settings.arguments
        //       as Map<String, dynamic>?)?['categories_cubit'],
        // ),
        BlocProvider<SubCategoriesCubit>(
          create: (_) => SubCategoriesCubit(
            categoryName: categoryName,
            parentId: categoryId,
          ),
        ),
      ],
      child: this,
    );
  }
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  late SubCategoriesCubit subcategoriesCubit;
  late FilterCarsCubit filterCarsCubit;
  late SearchCubit searchCubit;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    log('subCatId => ${widget.parentId}');
    filterCarsCubit = context.read<FilterCarsCubit>();
    searchCubit = context.read<SearchCubit>()
      ..getCarMades(
        context,
        categoryId: widget.parentId,
      );

    subcategoriesCubit = BlocProvider.of<SubCategoriesCubit>(context)
      ..getSubCategories(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      drawer: const MyDrawer(),

      // appBar: AppBar(
      //   actions: [
      //     SearchIcon(
      //       categoryId: subcategoriesCubit.parentId,
      //     ),
      //   ],
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   bottom: const SearchBottomAppBar(),
      //   title: Text(
      //     subcategoriesCubit.categoryName ?? 'categories'.translate,
      //     style: const TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //     color: Colors.black,
      //     onPressed: () {
      //       context.router.pop();
      //     },
      //   ),
      // ),
      appBar: CustomizedAppBar(
        context: context,
        scaffoldKey: scaffoldKey,
        title: widget.categoryName ?? '',
      ),
      // appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      body: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
        builder: (context, state) {
          if (state is SubCategoriesLoading) {
            return const LoaderWidget();
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchField(
                  removePadding: false,
                  suffixIcon: Transform.scale(
                    scale: 0.5,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) {
                            return const CategoriesFilterView();
                          },
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/icons/svg/filter.svg',
                      ),
                    ),
                  ),
                ),
                SearchView(searchCubit: searchCubit),
                // BlocBuilder<FilterCarsCubit, FilterCarsState>(
                //   builder: (context, state) {
                //     return Column(
                //       children: [
                //         state is CarMadesLoading
                //             ? const LoaderWidget()
                //             : BrandsView(filterCarsCubit: filterCarsCubit),
                //         state is ManufacturersLoading
                //             ? const LoaderWidget()
                //             : ManufacturersView(
                //                 filterCarsCubit: filterCarsCubit),
                //       ],
                //     );
                //   },
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SectionHeaderItem(
                      title: '${'categories'.translate} :',
                      onViewAllPressed: () {
                        context.router.push(
                          route.SubSubCategoriesRouter(
                            subCategoriesCubit:
                                context.read<SubCategoriesCubit>(),
                          ),
                        );
                      },
                      showViewAll: subcategoriesCubit.subCategories.length > 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            subcategoriesCubit.subCategories.length > 5
                                ? 5
                                : subcategoriesCubit.subCategories.length,
                            (index) {
                          var cat = subcategoriesCubit.subCategories[index];
                          return SubCategoryCard(
                            showDivider: cat !=
                                subcategoriesCubit.subCategories.toList().last,
                            onPressed: () async =>
                                subcategoriesCubit.subCategoriesOnClickHandler(
                              context: context,
                              catId: cat.id,
                              categoryName: Helper.currentLanguage == 'ar'
                                  ? cat.nameAr
                                  : cat.nameEn,
                              catSlug: cat.slug,
                            ),
                            categoryName: Helper.currentLanguage == 'ar'
                                ? cat.nameAr
                                : cat.nameEn,
                            categoryImage: cat.image,
                          );
                        }),
                      ),
                    ),
                    const BoxHelper(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
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
                                                    context.router.pop();
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
                // NavigationService.push(
                //   page: AllManufacturersScreen.routeName,
                // );
                context.router.push(
                  const route.AllManufacturersScreen(),
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
                context.router.push(
                  const route.AllCarMadesScreen(),
                );
                // NavigationService.push(
                //   page: AllCarMadesScreen.routeName,
                // );
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

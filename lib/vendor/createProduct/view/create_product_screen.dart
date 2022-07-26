import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/custom_new_dialog.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/search_widget.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/vendor/createProduct/view/widgets/vendor_search_view.dart';
import 'package:trkar/vendor/createProduct/viewModel/createProduct/create_product_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/productsType/products_type_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/storeBranches/store_branches_cubit.dart';
import '../../../categories/model/categories_model.dart';
import '../../../core/components/loader_widget.dart';
import '../../../core/extensions/string.dart';
import '../../../core/components/register_field.dart';
import '../../../core/themes/screen_utility.dart';
import 'widgets/create_product_dropdown_tile.dart';
import 'widgets/create_product_field_tile.dart';
import 'widgets/price_after_discount_view.dart';
import 'widgets/price_no_view.dart';
import 'widgets/product_advanced_data_view.dart';
import 'widgets/product_main_details_view.dart';
import 'widgets/quantity_view.dart';

class CreateProductView extends StatefulWidget implements AutoRouteWrapper {
  const CreateProductView({
    Key? key,
  }) : super(key: key);
  @override
  State<CreateProductView> createState() => _CreateProductViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    log('wrapMessage');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => CreateProductCubit(
            pageIndex: 0,
          ),
        ),
        BlocProvider(
          create: (context) => ProductsTypeCubit(),
        ),
        BlocProvider(
          create: (context) => FilterCarsCubit(),
        ),
        BlocProvider(
          create: (context) => StoreBranchesCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _CreateProductViewState extends State<CreateProductView> {
  late CategoriesCubit categoriesCubit;
  late CreateProductCubit createProductCubit;
  late ProductsTypeCubit productsTypeCubit;
  late FilterCarsCubit filterCarsCubit;
  late StoreBranchesCubit storeBranchesCubit;
  // int? categoryId, subCategoryId;
  late SubCategoriesCubit subCategoriesCubit;

  @override
  void initState() {
    subCategoriesCubit = context.read<SubCategoriesCubit>();

    storeBranchesCubit = context.read<StoreBranchesCubit>()
      ..getVendorStore(context);
    createProductCubit = context.read<CreateProductCubit>()
      ..getAllCarModels(context);
    categoriesCubit = context.read<CategoriesCubit>();
    filterCarsCubit = context.read<FilterCarsCubit>();
    productsTypeCubit = context.read<ProductsTypeCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if(createProductCubit.viewMode==ViewMode.)
    return BlocBuilder<CreateProductCubit, CreateProductState>(
      builder: (context, state) {
        return SafeArea(
          child: Form(
            key: createProductCubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // VendorSearchView(
                //   categoriesCubit: categoriesCubit,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 15,
                //     vertical: 10,
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'products'.translate,
                //         style: Theme.of(context).textTheme.headline1?.copyWith(
                //               fontWeight: FontWeight.bold,
                //               fontSize: ScreenUtil().setSp(15),
                //             ),
                //       ),
                //       const BoxHelper(
                //         height: 3,
                //       ),
                //       Text(
                //         '${'number_of_products'.translate} : 3',
                //         style: Theme.of(context).textTheme.headline1?.copyWith(
                //               fontWeight: FontWeight.bold,
                //               fontSize: ScreenUtil().setSp(13),
                //             ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: MainStyle.lightGreyColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ProductMainDetailsView(
                        createProductCubit: createProductCubit,
                      ),
                      Visibility(
                        visible: createProductCubit.viewMode ==
                            ViewMode.allInformation,
                        child: BlocBuilder<CategoriesCubit, CategoriesState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                CreateProductDropdownTile(
                                  initialValue: createProductCubit.categoryId !=
                                          null
                                      ? categoriesCubit.category
                                          .firstWhere(
                                            (element) =>
                                                element.id ==
                                                createProductCubit.categoryId,
                                            orElse: () => Category(),
                                          )
                                          .name
                                      : null,
                                  enabled: categoriesCubit.category.isNotEmpty,
                                  title: 'category',
                                  validator:
                                      createProductCubit.categoryValidate,
                                  values: categoriesCubit.category
                                      .map((e) => e.name ?? '')
                                      .toList(),
                                  onChanged: (v) async {
                                    if (v == null) {
                                      return;
                                    }
                                    var categoryId = categoriesCubit.category
                                        .firstWhere(
                                            (element) => element.name == v)
                                        .id;

                                    // var hasSubCategories =
                                    //     await subCategoriesCubit.hasSubCategories(
                                    //   categoryId ?? 0,
                                    //   context,
                                    // );
                                    // if (hasSubCategories) {
                                    await subCategoriesCubit.getSubCategories(
                                      context,
                                      id: categoryId,
                                    );
                                    createProductCubit.validateCategoryId(
                                      categoryId ?? 0,
                                      categoryIndex: -1,
                                    );
                                    // }
                                    await filterCarsCubit.getManufacturer(
                                      context,
                                      categoryId: categoryId,
                                    );
                                    await filterCarsCubit.getCarMades(
                                      context,
                                      categoryId: categoryId,
                                    );
                                    createProductCubit.validateCategoryId(
                                      categoryId ?? 0,
                                      categoryIndex: -1,
                                    );
                                  },
                                ),
                                ...List.generate(
                                  createProductCubit.categoryIds.length,
                                  (index) {
                                    return Visibility(
                                      visible: subCategoriesCubit
                                          .getSubCategoryByParentId(
                                            createProductCubit
                                                .categoryIds[index],
                                          )!
                                          .isNotEmpty,
                                      child: CreateProductDropdownTile(
                                        initialValue: subCategoriesCubit
                                                .getSubCategoryByParentId(
                                                  createProductCubit
                                                      .categoryIds[index],
                                                )!
                                                .isNotEmpty
                                            ? (Helper.currentLanguage == 'ar'
                                                ? subCategoriesCubit
                                                    .getSpicificCategoryById(
                                                        createProductCubit
                                                            .categoryIds[index])
                                                    .nameAr
                                                : subCategoriesCubit
                                                    .getSpicificCategoryById(
                                                        createProductCubit
                                                            .categoryIds[index])
                                                    .nameEn)
                                            : null,
                                        key: ValueKey(createProductCubit
                                            .categoryIds[index]),
                                        enabled: subCategoriesCubit
                                            .getSubCategoryByParentId(
                                              createProductCubit
                                                  .categoryIds[index],
                                            )!
                                            .isNotEmpty,
                                        title: index == 0
                                            ? 'sub_category'
                                            : 'sub_sub_category',
                                        validator: index == 0
                                            ? createProductCubit
                                                .subcategoryValidate
                                            : null,
                                        values: subCategoriesCubit
                                            .getSubCategoryByParentId(
                                              createProductCubit
                                                  .categoryIds[index],
                                            )!
                                            .map(
                                              (e) =>
                                                  Helper.currentLanguage == 'ar'
                                                      ? e.nameAr ?? ''
                                                      : e.nameEn ?? '',
                                            )
                                            .toList(),
                                        onChanged: (v) async {
                                          if (v == null) {
                                            return;
                                          }
                                          var categoryId = subCategoriesCubit
                                              .getSubCategoryByParentId(
                                                createProductCubit
                                                    .categoryIds[index],
                                              )!
                                              .firstWhere((element) =>
                                                  (Helper.currentLanguage ==
                                                          'ar' &&
                                                      element.nameAr == v) ||
                                                  (Helper.currentLanguage ==
                                                          'en' &&
                                                      element.nameEn == v))
                                              .id;
                                          var hasSubCategories =
                                              await subCategoriesCubit
                                                  .hasSubCategories(
                                            categoryId ?? 0,
                                            context,
                                          );
                                          if (hasSubCategories) {
                                            await subCategoriesCubit
                                                .getSubCategories(
                                              context,
                                              id: categoryId,
                                            );
                                            createProductCubit
                                                .validateCategoryId(
                                              categoryId ?? 0,
                                              categoryIndex: index,
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),
                                // CreateProductDropdownTile(
                                //   enabled: categoriesCubit
                                //       .mainCategory.isNotEmpty,
                                //   title: 'category',
                                //   values: categoriesCubit.mainCategory
                                //       .map((e) => e.name ?? '')
                                //       .toList(),
                                //   onChanged: (v) {
                                //     if (v == null) {
                                //       return;
                                //     }
                                //     setState(() {
                                //       categoryId = categoriesCubit
                                //           .mainCategory
                                //           .firstWhere((element) =>
                                //               element.name == v)
                                //           .id;
                                //     });
                                //   },
                                // ),
                                // CreateProductDropdownTile(
                                //   enabled: categoryId != null,
                                //   title: 'sub_category',
                                //   values: categoriesCubit
                                //       .subCategories(categoryId ?? 0)
                                //       .map((e) => e.name ?? '')
                                //       .toList(),
                                //   onChanged: (v) {
                                //     if (v == null) {
                                //       return;
                                //     }
                                //     setState(() {
                                //       subCategoryId = categoriesCubit
                                //           .subCategories(categoryId ?? 0)
                                //           .firstWhere((element) =>
                                //               element.name == v)
                                //           .id;
                                //     });
                                //   },
                                // ),
                                // CreateProductDropdownTile(
                                //   enabled: subCategoryId != null,
                                //   title: 'sub_sub_category',
                                //   values: categoriesCubit
                                //       .subCategories(subCategoryId ?? 0)
                                //       .map((e) => e.name ?? '')
                                //       .toList(),
                                //   onChanged: (v) {},
                                // ),
                              ],
                            );
                          },
                        ),
                      ),
                      Visibility(
                        visible: createProductCubit.viewMode ==
                            ViewMode.allInformation,
                        child: ProductAdvancedOptionsView(
                          productsTypeCubit: productsTypeCubit,
                          filterCarsCubit: filterCarsCubit,
                          createProductCubit: createProductCubit,
                          storeBranchesCubit: storeBranchesCubit,
                        ),
                      ),
                      if (createProductCubit.viewMode ==
                          ViewMode.basicInformation) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'advanced_options'.translate,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(15),
                                  ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(50),
                              child: RegisterButton(
                                radius: 10,
                                onPressed: () =>
                                    createProductCubit.changeViewMode(context),
                                title: 'add',
                              ),
                            )
                          ],
                        ),
                      ],
                      Visibility(
                        visible: createProductCubit.viewMode ==
                            ViewMode.allInformation,
                        child: state is CreateProductLoading
                            ? const LoaderWidget()
                            : RegisterButton(
                                radius: 10,
                                onPressed: () =>
                                    createProductCubit.createProduct(context),
                                title: createProductCubit.product != null
                                    ? 'update'
                                    : 'save',
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

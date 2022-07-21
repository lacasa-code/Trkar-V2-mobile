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

class CreateProductScreen extends StatefulWidget implements AutoRouteWrapper {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => CreateProductCubit(),
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

class _CreateProductScreenState extends State<CreateProductScreen> {
  late CategoriesCubit categoriesCubit;
  late CreateProductCubit createProductCubit;
  late ProductsTypeCubit productsTypeCubit;
  late FilterCarsCubit filterCarsCubit;
  late StoreBranchesCubit storeBranchesCubit;
  int? categoryId, subCategoryId;

  @override
  void initState() {
    storeBranchesCubit = context.read<StoreBranchesCubit>()
      ..getVendorStore(context);
    createProductCubit = context.read<CreateProductCubit>();
    categoriesCubit = context.read<CategoriesCubit>();
    filterCarsCubit = context.read<FilterCarsCubit>()
      ..getCarYears(context)
      ..getOriginCountries(context);
    productsTypeCubit = context.read<ProductsTypeCubit>()
      ..getProductTypes(context);
    categoriesCubit
        .getAllCategories(
      context,
    )
        .then((value) {
      // createProductCubit.addToCategoryList(
      //   categoriesCubit: categoriesCubit,
      //   parentId: 0,
      //   dropdownId: -1,
      // );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'lengthTag=> ${createProductCubit.productTagController.getTags?.length}');
    return Scaffold(
      body: BlocBuilder<CreateProductCubit, CreateProductState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.black,
                            ),
                          ),
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/profile2.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: createProductCubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          VendorSearchView(
                            categoriesCubit: categoriesCubit,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'products'.translate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(15),
                                      ),
                                ),
                                const BoxHelper(
                                  height: 3,
                                ),
                                Text(
                                  '${'number_of_products'.translate} : 3',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(13),
                                      ),
                                ),
                              ],
                            ),
                          ),
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
                                BlocBuilder<CategoriesCubit, CategoriesState>(
                                  builder: (context, state) {
                                    return Column(
                                      children: [
                                        CreateProductDropdownTile(
                                          enabled: categoriesCubit
                                              .mainCategory.isNotEmpty,
                                          title: 'category',
                                          validator: createProductCubit
                                              .categoryValidate,
                                          values: categoriesCubit.mainCategory
                                              .map((e) => e.name ?? '')
                                              .toList(),
                                          onChanged: (v) async {
                                            if (v == null) {
                                              return;
                                            }
                                            var categoryId = categoriesCubit
                                                .mainCategory
                                                .firstWhere((element) =>
                                                    element.name == v)
                                                .id;

                                            await filterCarsCubit
                                                .getManufacturer(
                                              context,
                                              categoryId: categoryId,
                                            );
                                            await filterCarsCubit.getCarMades(
                                              context,
                                              categoryId: categoryId,
                                            );
                                            createProductCubit
                                                .validateCategoryId(
                                              categoryId ?? 0,
                                              categoryIndex: -1,
                                            );
                                          },
                                        ),
                                        ...List.generate(
                                          createProductCubit.categoryIds.length,
                                          (index) {
                                            return CreateProductDropdownTile(
                                              key: ValueKey(createProductCubit
                                                  .categoryIds[index]),
                                              enabled: categoriesCubit
                                                  .mainCategory.isNotEmpty,
                                              title: index == 0
                                                  ? 'sub_category'
                                                  : 'sub_sub_category',
                                              validator: index == 0
                                                  ? createProductCubit
                                                      .subcategoryValidate
                                                  : null,
                                              values: categoriesCubit
                                                  .subCategories(
                                                    createProductCubit
                                                        .categoryIds[index],
                                                  )
                                                  .map((e) => e.name ?? '')
                                                  .toList(),
                                              onChanged: (v) {
                                                if (v == null) {
                                                  return;
                                                }
                                                var categoryId =
                                                    categoriesCubit.allcategory
                                                        .firstWhere(
                                                          (element) =>
                                                              element.name == v,
                                                        )
                                                        .id;
                                                if (categoriesCubit
                                                    .hasSubCategory(
                                                        categoryId)) {
                                                  createProductCubit
                                                      .validateCategoryId(
                                                    categoryId ?? 0,
                                                    categoryIndex: 0,
                                                  );
                                                }
                                              },
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
                                  const Divider(
                                    thickness: 1,
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
                                      RegisterButton(
                                        radius: 10,
                                        onPressed: () => createProductCubit
                                            .changeViewMode(context),
                                        title: 'add',
                                      )
                                    ],
                                  ),
                                ],
                                Visibility(
                                  visible: createProductCubit.viewMode ==
                                      ViewMode.allInformation,
                                  child: RegisterButton(
                                    radius: 10,
                                    onPressed: () => createProductCubit
                                        .createProduct(context),
                                    title: 'save',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const BoxHelper(
                            height: 160,
                          ),
                        ],
                      ),
                    ),
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

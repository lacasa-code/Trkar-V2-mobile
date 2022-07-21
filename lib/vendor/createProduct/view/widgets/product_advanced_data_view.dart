import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/vendor/createProduct/view/widgets/quantity_view.dart';

import '../../../../core/components/loader_widget.dart';
import '../../../../filterCars/viewModel/carMades/filter_cars_cubit.dart';
import '../../viewModel/createProduct/create_product_cubit.dart';
import '../../viewModel/productsType/products_type_cubit.dart';
import '../../viewModel/storeBranches/store_branches_cubit.dart';
import 'create_product_dropdown_tile.dart';
import 'create_product_field_tile.dart';
import 'create_product_tag_field_tile.dart';
import 'price_after_discount_view.dart';

class ProductAdvancedOptionsView extends StatelessWidget {
  const ProductAdvancedOptionsView({
    Key? key,
    required this.productsTypeCubit,
    required this.filterCarsCubit,
    required this.createProductCubit,
    required this.storeBranchesCubit,
  }) : super(key: key);

  final ProductsTypeCubit productsTypeCubit;
  final FilterCarsCubit filterCarsCubit;
  final CreateProductCubit createProductCubit;
  final StoreBranchesCubit storeBranchesCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProductsTypeCubit, ProductsTypeState>(
          builder: (context, state) {
            if (state is ProductsTypeLoading) {
              return const LoaderWidget();
            }
            return CreateProductDropdownTile(
              enabled: productsTypeCubit.productTypes.isNotEmpty,
              onChanged: (v) {
                if (v == null) {
                  return;
                }
                var index = productsTypeCubit.productTypes
                    .indexWhere((element) => element.name == v);
                if (index >= 0) {
                  createProductCubit.changeProductTypeId(
                    productsTypeCubit.productTypes[index].id,
                  );
                }
              },
              values: productsTypeCubit.productTypes
                  .map((e) => e.name ?? '')
                  .toList(),
              title: 'product_type',
              validator: createProductCubit.productTypeValidate,
            );
          },
        ),
        if (createProductCubit.productTypeId == 2) ...[
          CreateProductFieldTile(
            title: 'minimum_quantity',
            validator: createProductCubit.minimumQuantityValidate,
            controller: createProductCubit.minimumQuantityController,
            keyboardType: TextInputType.phone,
            formatter: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLines: 1,
          ),
        ],
        CreateProductFieldTile(
          title: 'price',
          extraOptions: 'price_helper',
          validator: createProductCubit.priceValidate,
          controller: createProductCubit.priceController,
          keyboardType: TextInputType.phone,
          formatter: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLines: 1,
        ),
        CreateProductFieldTile(
          title: 'product_no',
          maxLength: 6,
          validator: createProductCubit.serialNumberValidate,
          controller: createProductCubit.serialNumberController,
          keyboardType: TextInputType.phone,
          formatter: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLines: 1,
        ),
        CreateProductTagFieldTile(
          title: 'product_tags',
          onChanged: createProductCubit.onTagsFieldChanged,
          validator: createProductCubit.productPriceValidate,
          controller: createProductCubit.productTagController,
        ),
        CreateProductPriceAfterDiscountTile(
          createProductCubit: createProductCubit,
        ),
        CreateProductFieldTile(
          title: 'description_ar',
          controller: createProductCubit.descArController,
          validator: createProductCubit.descriptionArValidate,
          maxLines: 5,
        ),
        CreateProductFieldTile(
          title: 'description_en',
          validator: createProductCubit.descriptionEnValidate,
          controller: createProductCubit.descEnController,
          maxLines: 5,
        ),
        BlocBuilder<FilterCarsCubit, FilterCarsState>(
          builder: (context, state) {
            return Column(
              children: [
                state is ManufacturersLoading
                    ? const LoaderWidget()
                    : CreateProductDropdownTile(
                        validator: createProductCubit.manufacturerValidate,
                        enabled:
                            filterCarsCubit.categoriesManufacturers.isNotEmpty,
                        onChanged: (v) {
                          if (v == null) {
                            return;
                          }
                          var index = filterCarsCubit.categoriesManufacturers
                              .indexWhere((element) => element.name == v);
                          createProductCubit.manufacturerId =
                              filterCarsCubit.categoriesManufacturers[index].id;
                        },
                        values: filterCarsCubit.categoriesManufacturers
                            .map((e) => e.name ?? '')
                            .toList(),
                        key: ValueKey(
                          filterCarsCubit.categoriesManufacturers.length + 1,
                        ),
                        title: 'manufacturers',
                      ),
                state is CarYearsLoading
                    ? const LoaderWidget()
                    : CreateProductDropdownTile(
                        validator: createProductCubit.manufacturingYearValidate,
                        enabled: filterCarsCubit.carYears.isNotEmpty,
                        key: ValueKey(filterCarsCubit.carYears.length + 2),
                        onChanged: (v) {
                          if (v == null) {
                            return;
                          }
                          var index = filterCarsCubit.carYears
                              .indexWhere((element) => element.year == v);
                          createProductCubit.manufacturingYearId =
                              filterCarsCubit.carYears[index].id;
                        },
                        values: filterCarsCubit.carYears
                            .map((e) => e.year ?? '')
                            .toList(),
                        title: 'manufacturing_year',
                      ),
                state is OriginalCountriesLoading
                    ? const LoaderWidget()
                    : CreateProductDropdownTile(
                        validator: createProductCubit.countryOfOriginValidate,
                        enabled: filterCarsCubit.originalCountry.isNotEmpty,
                        onChanged: (v) {
                          if (v == null) {
                            return;
                          }
                          var index = filterCarsCubit.originalCountry
                              .indexWhere((element) => element.name == v);
                          createProductCubit.originalCountryId =
                              filterCarsCubit.originalCountry[index].id;
                        },
                        values: filterCarsCubit.originalCountry
                            .map((e) => e.name ?? '')
                            .toList(),
                        title: 'country_of_origin',
                      ),
                // CreateProductDropdownTile(
                //   enabled: true,
                //   onChanged: (v) {},
                //   values: [
                //     'man',
                //   ],
                //   title: 'maker',
                //   isOptional: true,
                // ),
                state is CarMadesLoading
                    ? const LoaderWidget()
                    : CreateProductDropdownTile(
                        enabled: filterCarsCubit.carMades.isNotEmpty,
                        onChanged: (v) {
                          if (v == null) {
                            return;
                          }
                          var carMade = filterCarsCubit.carMades
                              .firstWhere((element) => element.name == v);

                          createProductCubit.carMadeId = carMade.id;
                          filterCarsCubit.getCarModels(
                            context,
                            carMadeId: carMade.id,
                          );
                        },
                        values: filterCarsCubit.carMades
                            .map(
                              (e) => e.name ?? '',
                            )
                            .toList(),
                        title: 'brand',
                        isOptional: true,
                      ),
                state is CarModelsLoading
                    ? const LoaderWidget()
                    : CreateProductDropdownTile(
                        validator: createProductCubit.modelValidate,
                        enabled: filterCarsCubit.carModels.isNotEmpty,
                        onChanged: (v) {
                          if (v == null) {
                            return;
                          }
                          var carModel = filterCarsCubit.carModels
                              .firstWhere((element) => element.name == v);
                          createProductCubit.carModelId = carModel.id;
                          filterCarsCubit.getCarEngines(
                            context,
                            carModelId: carModel.id,
                          );
                        },
                        values: filterCarsCubit.carModels
                            .map((e) => e.name ?? '')
                            .toList(),
                        title: 'model',
                        isOptional: true,
                      ),
                CreateProductDropdownTile(
                  enabled: filterCarsCubit.carEngines.isNotEmpty,
                  onChanged: (v) {
                    if (v == null) {
                      return;
                    }
                    var index = filterCarsCubit.carEngines
                        .indexWhere((element) => element.name == v);
                    createProductCubit.carEngineId =
                        filterCarsCubit.carEngines[index].id;
                  },
                  values: filterCarsCubit.carEngines
                      .map((e) => e.name ?? '')
                      .toList(),
                  title: 'engine',
                  isOptional: true,
                  validator: createProductCubit.engineValidate,
                ),
              ],
            );
          },
        ),
        QuantityView(
          createProductCubit: createProductCubit,
          storeBranchesCubit: storeBranchesCubit,
        ),
      ],
    );
  }
}

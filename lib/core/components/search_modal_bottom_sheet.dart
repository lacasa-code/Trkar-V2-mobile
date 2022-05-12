import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/helper/helper.dart';
import './dropdown_widget.dart';
import './multiselect_dropdown_widget.dart';
import './register_button.dart';
import './register_field.dart';
import '../helper/enums.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import '../extensions/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchModalBottomSheet extends StatefulWidget {
  const SearchModalBottomSheet({
    Key? key,
    this.categoryId,
  }) : super(key: key);
  final dynamic categoryId;

  @override
  State<SearchModalBottomSheet> createState() => _SearchModalBottomSheetState();
}

class _SearchModalBottomSheetState extends State<SearchModalBottomSheet> {
  // TODO :handling ids list after editing subCatsAPI ... ___ SPRINT 3 _____
  List<String> values = [
    'all'.translate,
    'categories'.translate,
    'model'.translate,
    'brand'.translate,
    'manufacturing_year'.translate,
    'country_of_origin'.translate,
    'manufacturers'.translate
  ];
  late FilterCarsCubit filterCarsCubit;
  late CategoriesCubit categoriesCubit;
  late SubCategoriesCubit subCategoriesCubit;
  int searchBy = 0;
  List<int> ids = [];
  List<Widget> subCats = [];

  @override
  void initState() {
    filterCarsCubit = context.read<FilterCarsCubit>();
    categoriesCubit = context.read<CategoriesCubit>();
    subCategoriesCubit = context.read<SubCategoriesCubit>()..init();
    if (categoriesCubit.category.isEmpty && widget.categoryId == null) {
      categoriesCubit.getCategories(context);
    }
    if (widget.categoryId != null) {
      subCategoriesCubit.getSubCategories(context, id: widget.categoryId);
      filterCarsCubit.getCarMades(context);
      ids.add(widget.categoryId!);
      setState(() {
        searchBy++;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const RegisterField(
              suffixIcon: Icon(
                Icons.search,
              ),
              hintText: 'search_hint',
              labelText: 'search',
              thinBorder: true,
            ),
            // DropDownWidget(
            //   thinBorder: true,
            //   values: values,
            //   labelText: 'search_by',
            //   onChanged: (v) {
            //     if (v == null) {
            //       return;
            //     }
            //     // if (values[v] == 'brand'.translate) {
            //     //   setState(() {
            //     //     searchBy = SearchBy.brand;
            //     //   });
            //     //   if (filterCarsCubit.carMades.isEmpty) {
            //     //     filterCarsCubit.getCarMades(context);
            //     //   }
            //     // } else if (values[v] == 'model'.translate) {
            //     //   setState(() {
            //     //     searchBy = SearchBy.model;
            //     //   });
            //     //   if (filterCarsCubit.carModels.isEmpty) {
            //     //     filterCarsCubit.getCarModels(context);
            //     //   }
            //     // } else if (values[v] == 'categories'.translate) {
            //     //   setState(() {
            //     //     searchBy = SearchBy.categories;
            //     //   });
            //     //   if (categoriesCubit.category.isEmpty) {
            //     //     categoriesCubit.getCategories(context);
            //     //   }
            //     // } else if (values[v] == 'country_of_origin'.translate) {
            //     //   setState(() {
            //     //     searchBy = SearchBy.countryOfOrigin;
            //     //   });
            //     //   if (filterCarsCubit.originalCountry.isEmpty) {
            //     //     filterCarsCubit.getOriginCountries(context);
            //     //   }
            //     // } else if (values[v] == 'manufacturing_year'.translate) {
            //     //   setState(() {
            //     //     searchBy = SearchBy.manufacturingYear;
            //     //   });
            //     //   if (filterCarsCubit.carYears.isEmpty) {
            //     //     filterCarsCubit.getCarYears(context);
            //     //   }
            //     // } else if (values[v] == 'manufacturers'.translate) {
            //     //   setState(() {
            //     //     searchBy = SearchBy.manufactureres;
            //     //   });
            //     //   if (filterCarsCubit.manufacturers.isEmpty) {
            //     //     filterCarsCubit.getManufacturer(context);
            //     //   }
            //     // } else {
            //     //   setState(() {
            //     //     searchBy = null;
            //     //   });
            //     // }
            //   },
            // ),
            Visibility(
              visible: widget.categoryId == null,
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  return state is CategoriesLoading
                      ? const LoaderWidget()
                      : DropDownWidget(
                          thinBorder: true,
                          values: List.generate(
                              categoriesCubit.category.length,
                              (index) =>
                                  categoriesCubit.category[index].name ?? ''),
                          labelText: 'categories',
                          onChanged: (v) {
                            if (v == null) {
                              return;
                            }
                            setState(() {
                              searchBy++;
                            });
                            var id = categoriesCubit.category[v].id;
                            subCategoriesCubit.getSubCategories(
                              context,
                              id: categoriesCubit.category[v].id,
                            );
                            if (ids.isNotEmpty) {
                              ids.clear();
                            }
                            ids.add(id!);
                            if (filterCarsCubit.carMades.isNotEmpty) {
                              log('messageNot');
                              return;
                            }
                            filterCarsCubit.getCarMades(context);
                          },
                        );
                },
              ),
            ),
            BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
              builder: (context, state) {
                return Column(
                  children: List.generate(
                    ids.length,
                    (index) {
                      var subCat = subCategoriesCubit.subCategories
                          .where((element) =>
                              int.parse(element.parentId ?? '') == ids[index])
                          .toList();
                      return Visibility(
                        visible: widget.categoryId != null || subCat.isNotEmpty,
                        child: DropDownWidget(
                          key: ValueKey(ids[index]),
                          thinBorder: true,
                          values: List.generate(
                              subCat.length,
                              (index) =>
                                  (Helper.currentLanguage == 'ar'
                                      ? subCat[index].nameAr
                                      : subCat[index].nameEn) ??
                                  ''),
                          labelText: 'all',
                          onChanged: (v) async {
                            if (v == null) {
                              return;
                            }
                            var id = subCat[v].id;
                            if (id == null) {
                              return;
                            }
                            setState(() {
                              handlingIdsList(ids[index]);
                            });
                            subCategoriesCubit.getSubCategories(
                              context,
                              id: id,
                            );
                            ids.add(id);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            BlocBuilder<FilterCarsCubit, FilterCarsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Visibility(
                      visible: searchBy > 0,
                      child: state is CarMadesLoading
                          ? const LoaderWidget()
                          : DropDownWidget(
                              onChanged: (v) {
                                if (v == null) {
                                  return;
                                }
                                setState(() {
                                  searchBy++;
                                });
                                if (filterCarsCubit.carModels.isNotEmpty) {
                                  return;
                                }
                                filterCarsCubit.getCarModels(context);
                              },
                              labelText: 'brand',
                              thinBorder: true,
                              values: List.generate(
                                filterCarsCubit.carMades.length,
                                (index) =>
                                    filterCarsCubit.carMades[index].name ?? '',
                              ),
                            ),
                    ),
                    Visibility(
                      visible: searchBy > 1,
                      child: state is CarModelsLoading
                          ? const LoaderWidget()
                          : DropDownWidget(
                              onChanged: (v) {
                                if (v == null) {
                                  return;
                                }
                                setState(() {
                                  searchBy++;
                                });
                                var carModelId =
                                    filterCarsCubit.carModels[v].id;
                                filterCarsCubit.getCarEngines(
                                  context,
                                  carModelId: carModelId,
                                );
                              },
                              labelText: 'model',
                              thinBorder: true,
                              values: List.generate(
                                filterCarsCubit.carModels.length,
                                (index) =>
                                    filterCarsCubit.carModels[index].name ?? '',
                              ),
                            ),
                    ),
                    Visibility(
                      visible: searchBy > 2,
                      child: state is CarEngineLoading
                          ? const LoaderWidget()
                          : DropDownWidget(
                              onChanged: (v) {},
                              labelText: 'car_engine',
                              thinBorder: true,
                              values: List.generate(
                                filterCarsCubit.carEngines.length,
                                (index) {
                                  var carEngine =
                                      filterCarsCubit.carEngines[index];
                                  return '${carEngine.name}';
                                },
                              ),
                            ),
                    ),
                    // Visibility(
                    //   visible: searchBy == SearchBy.manufactureres,
                    //   child: state is ManufacturersLoading
                    //       ? const LoadetWidget()
                    //       : MultiselectDropdownWidget(
                    //           labelText: 'manufacturers',
                    //           thinBorder: true,
                    //           values: List.generate(
                    //             filterCarsCubit.manufacturers.length,
                    //             (index) =>
                    //                 filterCarsCubit.manufacturers[index].name ??
                    //                 '',
                    //           ),
                    //         ),
                    // ),
                    // Visibility(
                    //   visible: searchBy == SearchBy.countryOfOrigin,
                    //   child: state is OriginalCountriesLoading
                    //       ? const LoadetWidget()
                    //       : MultiselectDropdownWidget(
                    //           labelText: 'country_of_origin'.translate,
                    //           thinBorder: true,
                    //           values: List.generate(
                    //             filterCarsCubit.originalCountry.length,
                    //             (index) =>
                    //                 filterCarsCubit
                    //                     .originalCountry[index].name ??
                    //                 '',
                    //           ),
                    //         ),
                    // ),
                    // Visibility(
                    //   visible: searchBy == SearchBy.manufacturingYear,
                    //   child: state is CarYearsLoading
                    //       ? const LoadetWidget()
                    //       : MultiselectDropdownWidget(
                    //           labelText: 'manufacturing_year'.translate,
                    //           thinBorder: true,
                    //           values: List.generate(
                    //             filterCarsCubit.carYears.length,
                    //             (index) =>
                    //                 filterCarsCubit.carYears[index].year ?? '',
                    //           ),
                    //         ),
                    // ),
                  ],
                );
              },
            ),
            RegisterButton(
              radius: 13,
              title: 'search',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  handlingIdsList(int object) {
    var index = ids.indexWhere((element) => element == object);
    log('index $index');
    if (index < 0) {
      return;
    }
    List<int> newIds = [];
    log('newIds length => ${newIds.length} == ${ids.length}');
    for (var i = 0; i <= index; i++) {
      newIds.add(ids[i]);
    }
    ids = newIds;
  }
}

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

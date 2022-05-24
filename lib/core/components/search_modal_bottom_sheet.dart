import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/extensions/media_query.dart';
import 'package:trkar/search/viewModel/search/search_cubit.dart';
import './dropdown_widget.dart';
import './multiselect_dropdown_widget.dart';
import './register_button.dart';
import './register_field.dart';
import '../helper/enums.dart';
import '../extensions/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
    this.categoryId,
  }) : super(key: key);
  final dynamic categoryId;

  static const routeName = '/searchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
  late CategoriesCubit categoriesCubit;
  late SubCategoriesCubit subCategoriesCubit;
  late SearchCubit searchCubit;
  List<int> ids = [];
  List<Widget> subCats = [];

  @override
  void initState() {
    searchCubit = context.read<SearchCubit>();
    categoriesCubit = context.read<CategoriesCubit>();
    subCategoriesCubit = context.read<SubCategoriesCubit>()..init();
    if (categoriesCubit.category.isEmpty && widget.categoryId == null) {
      categoriesCubit.getCategories(context);
    }
    if (widget.categoryId != null) {
      subCategoriesCubit.getSubCategories(context, id: widget.categoryId);
      searchCubit.getCarMades(context, categoryId: widget.categoryId);
      searchCubit.changeSearchType(1);
      ids.add(widget.categoryId!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('padding => ${MediaQuery.of(context).viewInsets.bottom}');
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        log('selectedNull =>${searchCubit.selectedCarMadesItem == null}');
        return SingleChildScrollView(
          child: SizedBox(
            height: context.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                //     //   if (searchCubit.carMades.isEmpty) {
                //     //     searchCubit.getCarMades(context);
                //     //   }
                //     // } else if (values[v] == 'model'.translate) {
                //     //   setState(() {
                //     //     searchBy = SearchBy.model;
                //     //   });
                //     //   if (searchCubit.carModels.isEmpty) {
                //     //     searchCubit.getCarModels(context);
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
                //     //   if (searchCubit.originalCountry.isEmpty) {
                //     //     searchCubit.getOriginCountries(context);
                //     //   }
                //     // } else if (values[v] == 'manufacturing_year'.translate) {
                //     //   setState(() {
                //     //     searchBy = SearchBy.manufacturingYear;
                //     //   });
                //     //   if (searchCubit.carYears.isEmpty) {
                //     //     searchCubit.getCarYears(context);
                //     //   }
                //     // } else if (values[v] == 'manufacturers'.translate) {
                //     //   setState(() {
                //     //     searchBy = SearchBy.manufactureres;
                //     //   });
                //     //   if (searchCubit.manufacturers.isEmpty) {
                //     //     searchCubit.getManufacturer(context);
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
                                      categoriesCubit.category[index].name ??
                                      ''),
                              labelText: 'categories',
                              onChanged: (v) {
                                if (v == null) {
                                  return;
                                }
                                searchCubit.changeSearchType(2);

                                var categoryId =
                                    categoriesCubit.category[v].id;
                                subCategoriesCubit.getSubCategories(
                                  context,
                                  id: categoryId,
                                );
                                if (ids.isNotEmpty) {
                                  ids.clear();
                                }
                                ids.add(categoryId!);

                                searchCubit.getCarMades(
                                  context,
                                  categoryId: categoryId,
                                );
                              },
                            );
                    },
                  ),
                ),
                Form(
                  key: searchCubit.formKey,
                  child: RegisterField(
                    labelText: 'vin_number',
                    thinBorder: true,
                    validator: searchCubit.vinNumberValidate,
                    controller: searchCubit.vinNumberController,
                    onChanged: (value) =>
                        searchCubit.onVinNumberChanged(value, context),
                    maxLength: 17,
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
                                  int.parse(element.parentId ?? '') ==
                                  ids[index])
                              .toList();
                          return Visibility(
                            visible: widget.categoryId != null ||
                                subCat.isNotEmpty,
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

                Column(
                  children: [
                    Visibility(
                      visible: searchCubit.searchBy > 0,
                      child: state is CarMadesLoading
                          ? const LoaderWidget()
                          : SearchableDropDownWidget(
                              initialValue:
                                  searchCubit.selectedCarMadesItem == null
                                      ? null
                                      : searchCubit
                                          .carMadesEnglish[searchCubit
                                                  .selectedCarMadesItem ??
                                              0]
                                          .name,
                              onChanged: (v) {
                                if (v == null) {
                                  return;
                                }
                                searchCubit.vinNumberController.clear();
                                searchCubit.changeSearchType(2);

                                searchCubit.getCarModels(
                                  context,
                                  carMadeId: searchCubit.carMadesEnglish
                                      .firstWhere(
                                        (element) => element.name == v,
                                      )
                                      .id,
                                );
                              },
                              labelText: 'brand',
                              thinBorder: true,
                              values: List.generate(
                                searchCubit.carMadesEnglish.length,
                                (index) =>
                                    searchCubit.carMadesEnglish[index].name ??
                                    '',
                              ),
                            ),
                    ),
                    Visibility(
                      visible: searchCubit.searchBy > 1,
                      child: state is CarModelsLoading
                          ? const LoaderWidget()
                          : Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: SearchableDropDownWidget(
                                onChanged: (v) {
                                  if (v == null) {
                                    return;
                                  }
                                  searchCubit.changeSearchType(3);

                                  var carModelId = searchCubit.carModels
                                      .firstWhere(
                                        (element) => element.name == v,
                                      )
                                      .id;
                                  searchCubit.getCarEngines(
                                    context,
                                    carModelId: carModelId,
                                  );
                                },
                                labelText: 'model',
                                thinBorder: true,
                                values: List.generate(
                                  searchCubit.carModels.length,
                                  (index) =>
                                      searchCubit.carModels[index].name ?? '',
                                ),
                              ),
                            ),
                    ),
                    Visibility(
                      visible: searchCubit.searchBy > 2,
                      child: state is CarEngineLoading
                          ? const LoaderWidget()
                          : SearchableDropDownWidget(
                              onChanged: (v) {},
                              labelText: 'car_engine',
                              thinBorder: true,
                              values: List.generate(
                                searchCubit.carEngines.length,
                                (index) {
                                  var carEngine =
                                      searchCubit.carEngines[index];
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
                    //             searchCubit.manufacturers.length,
                    //             (index) =>
                    //                 searchCubit.manufacturers[index].name ??
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
                    //             searchCubit.originalCountry.length,
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
                    //             searchCubit.carYears.length,
                    //             (index) =>
                    //                 searchCubit.carYears[index].year ?? '',
                    //           ),
                    //         ),
                    // ),
                  ],
                ),
                RegisterButton(
                  radius: 13,
                  title: 'search',
                  onPressed: () {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                )
              ],
            ),
          ),
        );
      },
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

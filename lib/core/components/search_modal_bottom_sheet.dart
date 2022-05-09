import 'package:flutter/material.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
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
  }) : super(key: key);

  @override
  State<SearchModalBottomSheet> createState() => _SearchModalBottomSheetState();
}

class _SearchModalBottomSheetState extends State<SearchModalBottomSheet> {
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
  SearchBy? searchBy;

  @override
  void initState() {
    filterCarsCubit = context.read<FilterCarsCubit>();
    categoriesCubit = context.read<CategoriesCubit>();
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
            DropDownWidget(
              thinBorder: true,
              values: values,
              labelText: 'search_by',
              onChanged: (v) {
                if (v == null) {
                  return;
                }
                if (values[v] == 'brand'.translate) {
                  setState(() {
                    searchBy = SearchBy.brand;
                  });
                  if (filterCarsCubit.carMades.isEmpty) {
                    filterCarsCubit.getCarMades(context);
                  }
                } else if (values[v] == 'model'.translate) {
                  setState(() {
                    searchBy = SearchBy.model;
                  });
                  if (filterCarsCubit.carModels.isEmpty) {
                    filterCarsCubit.getCarModels(context);
                  }
                } else if (values[v] == 'categories'.translate) {
                  setState(() {
                    searchBy = SearchBy.categories;
                  });
                  if (categoriesCubit.category.isEmpty) {
                    categoriesCubit.getCategories(context);
                  }
                } else if (values[v] == 'country_of_origin'.translate) {
                  setState(() {
                    searchBy = SearchBy.countryOfOrigin;
                  });
                  if (filterCarsCubit.originalCountry.isEmpty) {
                    filterCarsCubit.getOriginCountries(context);
                  }
                } else if (values[v] == 'manufacturing_year'.translate) {
                  setState(() {
                    searchBy = SearchBy.manufacturingYear;
                  });
                  if (filterCarsCubit.carYears.isEmpty) {
                    filterCarsCubit.getCarYears(context);
                  }
                } else if (values[v] == 'manufacturers'.translate) {
                  setState(() {
                    searchBy = SearchBy.manufactureres;
                  });
                  if (filterCarsCubit.manufacturers.isEmpty) {
                    filterCarsCubit.getManufacturer(context);
                  }
                } else {
                  setState(() {
                    searchBy = null;
                  });
                }
              },
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                return Visibility(
                  visible: searchBy == SearchBy.categories,
                  child: state is CategoriesLoading
                      ? const LoadetWidget()
                      : DropDownWidget(
                          thinBorder: true,
                          values: List.generate(
                              categoriesCubit.category.length,
                              (index) =>
                                  categoriesCubit.category[index].name ?? ''),
                          labelText: 'categories',
                          onChanged: (v) {},
                        ),
                );
              },
            ),
            BlocBuilder<FilterCarsCubit, FilterCarsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Visibility(
                      visible: searchBy == SearchBy.brand,
                      child: state is CarMadesLoading
                          ? const LoadetWidget()
                          : MultiselectDropdownWidget(
                              labelText: 'brand'.translate,
                              thinBorder: true,
                              values: List.generate(
                                filterCarsCubit.carMades.length,
                                (index) =>
                                    filterCarsCubit.carMades[index].name ?? '',
                              ),
                            ),
                    ),
                    Visibility(
                      visible: searchBy == SearchBy.model,
                      child: state is CarModelsLoading
                          ? const LoadetWidget()
                          : MultiselectDropdownWidget(
                              labelText: 'model'.translate,
                              thinBorder: true,
                              values: List.generate(
                                filterCarsCubit.carModels.length,
                                (index) =>
                                    filterCarsCubit.carModels[index].name ?? '',
                              ),
                            ),
                    ),
                    Visibility(
                      visible: searchBy == SearchBy.manufactureres,
                      child: state is ManufacturersLoading
                          ? const LoadetWidget()
                          : MultiselectDropdownWidget(
                              labelText: 'manufacturers'.translate,
                              thinBorder: true,
                              values: List.generate(
                                filterCarsCubit.manufacturers.length,
                                (index) =>
                                    filterCarsCubit.manufacturers[index].name ??
                                    '',
                              ),
                            ),
                    ),
                    Visibility(
                      visible: searchBy == SearchBy.countryOfOrigin,
                      child: state is OriginalCountriesLoading
                          ? const LoadetWidget()
                          : MultiselectDropdownWidget(
                              labelText: 'country_of_origin'.translate,
                              thinBorder: true,
                              values: List.generate(
                                filterCarsCubit.originalCountry.length,
                                (index) =>
                                    filterCarsCubit
                                        .originalCountry[index].name ??
                                    '',
                              ),
                            ),
                    ),
                    Visibility(
                      visible: searchBy == SearchBy.manufacturingYear,
                      child: state is CarYearsLoading
                          ? const LoadetWidget()
                          : MultiselectDropdownWidget(
                              labelText: 'manufacturing_year'.translate,
                              thinBorder: true,
                              values: List.generate(
                                filterCarsCubit.carYears.length,
                                (index) =>
                                    filterCarsCubit.carYears[index].year ?? '',
                              ),
                            ),
                    ),
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
}

class LoadetWidget extends StatelessWidget {
  const LoadetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../extensions/string.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/search/viewModel/search/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    Key? key,
    required this.searchCubit,
  }) : super(key: key);

  final SearchCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    'search_car_helper'.translate,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: ScreenUtil().setSp(16),
                    ),
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
                state is SearchCarMadesLoading
                    ? const LoaderWidget()
                    : SearchableDropDownWidget(
                        enabled: searchCubit.carMadesEnglish.isNotEmpty,
                        initialValue: searchCubit.selectedCarMadesItem == null
                            ? null
                            : searchCubit
                                .carMadesEnglish[
                                    searchCubit.selectedCarMadesItem ?? 0]
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
                              searchCubit.carMadesEnglish[index].name ?? '',
                        ),
                      ),
                state is SearchCarModelsLoading
                    ? const LoaderWidget()
                    : Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: SearchableDropDownWidget(
                          enabled: searchCubit.carModels.isNotEmpty,
                          onChanged: (v) {
                            if (v == null) {
                              return;
                            }

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
                            (index) => searchCubit.carModels[index].name ?? '',
                          ),
                        ),
                      ),
                state is SearchCarEngineLoading
                    ? const LoaderWidget()
                    : SearchableDropDownWidget(
                        enabled: searchCubit.carEngines.isNotEmpty,
                        onChanged: (v) {},
                        labelText: 'car_engine',
                        thinBorder: true,
                        values: List.generate(
                          searchCubit.carEngines.length,
                          (index) {
                            var carEngine = searchCubit.carEngines[index];
                            return '${carEngine.name}';
                          },
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
          ],
        );
      },
    );
  }
}

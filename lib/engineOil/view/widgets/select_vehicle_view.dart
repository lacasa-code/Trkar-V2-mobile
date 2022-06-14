import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/engineOil/viewModel/engineOil/engine_oil_cubit.dart';
import '../../../core/extensions/string.dart';

class SelectVehicleView extends StatelessWidget {
  const SelectVehicleView({
    Key? key,
    required this.engineOilCubit,
  }) : super(key: key);

  final EngineOilCubit engineOilCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineOilCubit, EngineOilState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'find_oil_header'.translate,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'oil_select_vehicle'.translate,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            state is EngineOilCarMadesLoading
                ? const LoaderWidget()
                : SearchableDropDownWidget(
                    enabled: engineOilCubit.carMadesEnglish.isNotEmpty,
                    onChanged: (v) {
                      if (v == null) {
                        return;
                      }

                      engineOilCubit.getCarModels(
                        context,
                        carMadeId: engineOilCubit.carMadesEnglish
                            .firstWhere(
                              (element) => element.name == v,
                            )
                            .id,
                      );
                    },
                    labelText: 'brand',
                    thinBorder: true,
                    values: List.generate(
                      engineOilCubit.carMadesEnglish.length,
                      (index) =>
                          engineOilCubit.carMadesEnglish[index].name ?? '',
                    ),
                  ),
            state is OilCarModelsLoading
                ? const LoaderWidget()
                : SearchableDropDownWidget(
                    enabled: engineOilCubit.carModels.isNotEmpty,
                    onChanged: (v) {
                      if (v == null) {
                        return;
                      }

                      var carModelId = engineOilCubit.carModels
                          .firstWhere(
                            (element) => element.name == v,
                          )
                          .id;
                      engineOilCubit.getCarEngines(
                        context,
                        carModelId: carModelId,
                      );
                    },
                    labelText: 'model',
                    thinBorder: true,
                    values: List.generate(
                      engineOilCubit.carModels.length,
                      (index) => engineOilCubit.carModels[index].name ?? '',
                    ),
                  ),
            state is OilCarEngineLoading
                ? const LoaderWidget()
                : SearchableDropDownWidget(
                    enabled: engineOilCubit.carEngines.isNotEmpty,
                    onChanged: (v) {},
                    labelText: 'car_engine',
                    thinBorder: true,
                    values: List.generate(
                      engineOilCubit.carEngines.length,
                      (index) {
                        var carEngine = engineOilCubit.carEngines[index];
                        return '${carEngine.name}';
                      },
                    ),
                  ),
            const BoxHelper(
              height: 20,
            ),
            RegisterButton(
              title: 'search',
              onPressed: () {},
              radius: 10,
            ),
          ],
        );
      },
    );
  }
}

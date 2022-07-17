import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/engineOil/viewModel/engineOil/engine_oil_cubit.dart';
import '../../../core/extensions/string.dart';
import 'package:trkar/core/components/loader_widget.dart';

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
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //   child: Text(
            //     'find_oil_header'.translate,
            //     style: const TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //   child: Text(
            //     'oil_select_vehicle'.translate,
            //     style: const TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  state is OilCarModelsLoading
                      ? const LoaderWidget()
                      : Expanded(
                          child: SearchableDropDownWidget(
                            removePadding: true,
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
                              (index) =>
                                  engineOilCubit.carModels[index].name ?? '',
                            ),
                          ),
                        ),
                  const BoxHelper(
                    width: 10,
                  ),
                  state is OilCarEngineLoading
                      ? const LoaderWidget()
                      : Expanded(
                          child: SearchableDropDownWidget(
                            removePadding: true,
                            enabled: engineOilCubit.carEngines.isNotEmpty,
                            onChanged: (v) {},
                            labelText: 'car_engine',
                            thinBorder: true,
                            values: List.generate(
                              engineOilCubit.carEngines.length,
                              (index) {
                                var carEngine =
                                    engineOilCubit.carEngines[index];
                                return '${carEngine.name}';
                              },
                            ),
                          ),
                        ),
                ],
              ),
            ),
            // const BoxHelper(
            //   height: 5,
            // ),
            Center(
              child: SizedBox(
                width: ScreenUtil().setWidth(
                  ScreenUtil().setWidth(160),
                ),
                height: ScreenUtil().setHeight(55),
                child: RegisterButton(
                  title: 'search',
                  onPressed: () {},
                  radius: 10,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

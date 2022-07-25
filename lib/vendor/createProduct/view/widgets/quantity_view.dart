import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/vendor/createProduct/viewModel/createProduct/create_product_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/storeBranches/store_branches_cubit.dart';

import '../../../../core/components/register_field.dart';
import '../../../../core/components/searchable_dropdown_widget.dart';
import '../../../../core/components/sized_box_helper.dart';
import '../../../../core/extensions/string.dart';

class QuantityView extends StatelessWidget {
  const QuantityView({
    Key? key,
    required this.storeBranchesCubit,
    required this.createProductCubit,
  }) : super(key: key);
  final StoreBranchesCubit storeBranchesCubit;
  final CreateProductCubit createProductCubit;
  @override
  Widget build(BuildContext context) {
    log('branches of product =>${createProductCubit.branchQuantityFields}');
    return BlocBuilder<StoreBranchesCubit, StoreBranchesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BoxHelper(
              height: 10,
            ),
            Text(
              'quantity'.translate.toTitleCase,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(15),
                  ),
            ),
            ...List.generate(
              createProductCubit.branchQuantityFields.length,
              (index) {
                var quantityField =
                    createProductCubit.branchQuantityFields[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (index > 0) ...[
                        InkWell(
                          onTap: () => createProductCubit.deleteFields(
                            index,
                            context,
                          ),
                          child: CircleAvatar(
                            radius: ScreenUtil().radius(10),
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: ScreenUtil().radius(12),
                            ),
                          ),
                        ),
                        const BoxHelper(
                          height: 10,
                        ),
                      ],
                      Row(
                        children: [
                          Expanded(
                            child: SearchableDropDownWidget(
                              initialValue:
                                  storeBranchesCubit.branches.length == 1
                                      ? storeBranchesCubit.branches.first.name
                                      : null,
                              onChanged: (v) {
                                if (v == null) {
                                  return;
                                }
                                var branchIndex = storeBranchesCubit.branches
                                    .indexWhere((element) => element.name == v);
                                if (branchIndex >= 0) {
                                  quantityField.branchId = storeBranchesCubit
                                      .branches[branchIndex].id;
                                }
                              },
                              values: storeBranchesCubit.branches
                                  .map(
                                    (e) => e.name ?? '',
                                  )
                                  .toList(),
                              labelText: 'branch',
                              validator: createProductCubit.branchValidate,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              removePadding: true,
                            ),
                          ),
                          const BoxHelper(
                            width: 10,
                          ),
                          Expanded(
                            child: RegisterField(
                              controller: quantityField.quantityController,
                              validator: createProductCubit.quantityValidate,
                              keyboardType: TextInputType.phone,
                              formatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              hintText: 'qy',
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              removePadding: true,
                            ),
                          ),
                        ],
                      ),
                      const BoxHelper(
                        height: 10,
                      ),
                      RegisterField(
                        keyboardType: TextInputType.phone,
                        formatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: createProductCubit.quantityReminderValidate,
                        hintText: 'quantity_reminder',
                        controller: quantityField.quantityReminderController,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        removePadding: true,
                      ),
                      const BoxHelper(
                        height: 5,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
            Visibility(
              visible: createProductCubit.branchQuantityFields.length <
                  storeBranchesCubit.branches.length,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BoxHelper(
                    width: 125,
                    height: 35,
                    child: RegisterButton(
                      radius: 12,
                      removePadding: true,
                      onPressed: () => createProductCubit.addQuantityFields(),
                      // title: 'add_branch',
                      title: 'add_more',
                    ),
                  ),
                  const BoxHelper(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

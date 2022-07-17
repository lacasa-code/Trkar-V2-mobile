import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/core/components/loader_widget.dart';
import 'package:trkar/vendor/resumeData/viewModel/storeTypes/store_type_cubit.dart';
import '../../../../core/components/dropdown_widget.dart';
import '../../../../core/components/register_field.dart';
import '../../../../core/extensions/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopInformationView extends StatelessWidget {
  const ShopInformationView({
    Key? key,
    required this.storeTypeCubit,
  }) : super(key: key);

  final StoreTypeCubit storeTypeCubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'store_information'.translate.toTitleCase,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          const RegisterField(
            labelText: 'store_name',
            thinBorder: true,
          ),
          const RegisterField(
            labelText: 'store_url',
            keyboardType: TextInputType.url,
            thinBorder: true,
          ),
          BlocBuilder<StoreTypeCubit, StoreTypeState>(
            builder: (context, state) {
              if (state is StoreTypeLoading) {
                return const LoaderWidget();
              }
              return DropDownWidget(
                thinBorder: true,
                values: storeTypeCubit.types
                    .map(
                      (e) => e.name ?? '',
                    )
                    .toList(),
                labelText: 'store_type',
                onChanged: (v) {},
              );
            },
          ),
        ],
      ),
    );
  }
}

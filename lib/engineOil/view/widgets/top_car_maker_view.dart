import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import '../../../core/extensions/string.dart';

class TopCarMakerView extends StatelessWidget {
  const TopCarMakerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filterCubit = context.read<FilterCarsCubit>();
    return BlocBuilder<FilterCarsCubit, FilterCarsState>(
      builder: (context, state) {
        if (state is ManufacturersLoading) {
          return const LoaderWidget();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'engine_oil_top_car_maker'.translate,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Wrap(
                runSpacing: ScreenUtil().setHeight(20),
                spacing: ScreenUtil().setWidth(30),
                children: List.generate(
                  filterCubit.categoriesManufacturers.length,
                  (index) {
                    var manufacturer =
                        filterCubit.categoriesManufacturers[index];
                    return Image.network(
                      manufacturer.image ?? 'assets/images/brand${1}.png',
                      // fit: BoxFit.cover,
                      height: ScreenUtil().setHeight(60),
                      width: ScreenUtil().setHeight(60),
                      errorBuilder: (_, __, ___) => Image.asset(
                        'assets/images/brandFilterCars.png',
                        // fit: BoxFit.cover,
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setHeight(60),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

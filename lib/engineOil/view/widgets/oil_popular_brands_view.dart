import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/section_header_item.dart';
import 'package:trkar/engineOil/viewModel/engineOil/engine_oil_cubit.dart';
import '../../../core/extensions/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/loader_widget.dart';

class OilPopularBrandView extends StatelessWidget {
  const OilPopularBrandView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var engineOil = context.read<EngineOilCubit>();
    return BlocBuilder<EngineOilCubit, EngineOilState>(
      builder: (context, state) {
        if (state is EngineOilCarMadesLoading) {
          return const LoaderWidget();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeaderItem(
              title: 'popular_engine_oil_brand'.translate,
              onViewAllPressed: () {},
              showViewAll: engineOil.carMadesEnglish.length > 10,
            ),
            // Text(
            //   'popular_engine_oil_brand'.translate,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: ScreenUtil().setSp(16),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  runSpacing: ScreenUtil().setHeight(20),
                  spacing: ScreenUtil().setWidth(30),
                  direction: Axis.horizontal,
                  children: List.generate(
                    engineOil.carMadesEnglish.length > 10
                        ? 10
                        : engineOil.carMadesEnglish.length,
                    (index) {
                      var carMade = engineOil.carMadesEnglish[index];
                      return Image.network(
                        carMade.image ??
                            'assets/icons/oliBrands/oilbrand${1}.png',
                        // fit: BoxFit.cover,
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setHeight(60),
                        errorBuilder: (_, __, ___) => Image.asset(
                          'assets/icons/oliBrands/oilbrand${1}.png',
                          // fit: BoxFit.cover,
                          height: ScreenUtil().setHeight(60),
                          width: ScreenUtil().setHeight(60),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/dropdown_title_view.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import '../../../core/extensions/string.dart';

class EngineOilRequirementsView extends StatelessWidget {
  const EngineOilRequirementsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: SearchableDropDownWidget(
                  removePadding: true,
                  values: List.generate(
                    5,
                    (index) => 'grade ${index + 1}',
                  ),
                  labelText: 'viscosity_grade',
                  onChanged: (v) {},
                  thinBorder: true,
                ),
              ),
              const BoxHelper(
                width: 10,
              ),
              Expanded(
                child: SearchableDropDownWidget(
                  removePadding: true,
                  values: List.generate(
                    5,
                    (index) => 'brand ${index + 1}',
                  ),
                  labelText: 'brand',
                  onChanged: (v) {},
                  thinBorder: true,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: SearchableDropDownWidget(
                  removePadding: true,
                  values: List.generate(
                    5,
                    (index) => 'oem_approval ${index + 1}',
                  ),
                  labelText: 'oem_approval',
                  onChanged: (v) {},
                  thinBorder: true,
                ),
              ),
              const BoxHelper(
                width: 10,
              ),
              Expanded(
                child: SearchableDropDownWidget(
                  removePadding: true,
                  values: List.generate(
                    5,
                    (index) => 'specification ${index + 1}',
                  ),
                  labelText: 'specification',
                  onChanged: (v) {},
                  thinBorder: true,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: SizedBox(
            width: ScreenUtil().setWidth(180),
            height: ScreenUtil().setHeight(60),
            child: RegisterButton(
              title: 'search',
              onPressed: () {},
              radius: 10,
            ),
          ),
        ),
      ],
    );
  }
}

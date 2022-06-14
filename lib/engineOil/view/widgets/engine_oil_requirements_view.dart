import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/dropdown_title_view.dart';
import 'package:trkar/core/components/register_button.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'select_engine_oil'.translate,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DropDownTileView(
          removePadding: false,
          title: 'viscosity_grade',
          values: List.generate(
            5,
            (index) => 'grade ${index + 1}',
          ),
          onChanged: (v) {},
        ),
        DropDownTileView(
          removePadding: false,
          title: 'brand',
          values: List.generate(
            5,
            (index) => 'brand ${index + 1}',
          ),
          onChanged: (v) {},
        ),
        DropDownTileView(
          removePadding: false,
          title: 'oem_approval',
          values: List.generate(
            5,
            (index) => 'oem_approval ${index + 1}',
          ),
          onChanged: (v) {},
        ),
        DropDownTileView(
          removePadding: false,
          title: 'specification',
          values: List.generate(
            5,
            (index) => 'specification ${index + 1}',
          ),
          onChanged: (v) {},
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
  }
}
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:trkar/cars/view/my_cars_screen.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/extensions/string.dart';


class SelectCarWidget extends StatelessWidget {
  const SelectCarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            // NavigationService.push(
            //   page: MyCarsScreen.routeName,
            // );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  FontAwesome5.car,
                  color: Colors.black,
                ),
                BoxHelper(
                  width: 10,
                ),
                Text(
                  'select_car'.translate,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

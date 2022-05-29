import 'package:flutter/material.dart';
import 'package:trkar/cars/view/widgets/car_widget.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:auto_route/auto_route.dart';
class MyCarsView extends StatefulWidget {
  const MyCarsView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCarsView> createState() => _MyCarsViewState();
}

class _MyCarsViewState extends State<MyCarsView> {
  var groupValue = 'chevrolet';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarWidget(
            title: 'Chevrolet',
            value: 'chevrolet',
            subTitle: 'Optra 2016 - automatic',
            onChanged: (v) {
              if (v == null) {
                return;
              }
              setState(() {
                groupValue = v;
              });
            },
            groupValue: groupValue,
          ),
          CarWidget(
            title: 'Suzuki',
            value: 'suzuki',
            subTitle: 'Dzire 2022 - automatic',
            groupValue: groupValue,
            onChanged: (v) {
              if (v == null) {
                return;
              }
              setState(() {
                groupValue = v;
              });
              context.router.pop();
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/components/sized_box_helper.dart';
import '../../../core/extensions/string.dart';



class BrakesSystemSpareView extends StatelessWidget {
  const BrakesSystemSpareView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BoxHelper(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'brakes_system_spare'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const BoxHelper(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              children: List.generate(
                4,
                (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Image.asset(
                    'assets/images/toolsBrand${index + 1}.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

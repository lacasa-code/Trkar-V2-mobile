import 'package:flutter/material.dart';

import '../../../../core/components/sized_box_helper.dart';
import '../../../../core/extensions/string.dart';
import '../../../../core/themes/screen_utility.dart';

class EmptyProductHelper extends StatelessWidget {
  const EmptyProductHelper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const BoxHelper(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                  color: MainStyle.lightBlueGreyColor,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: "no_items_to_display".translate,
                ),
                WidgetSpan(
                  child: Transform.scale(
                    scale: 0.8,
                    child: const Card(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      shape: CircleBorder(),
                      elevation: 4,
                      child: Icon(
                        Icons.add_circle,
                        // color: Theme.of(context).primaryColor,

                        color: MainStyle.lightBlueGreyColor,
                      ),
                    ),
                  ),
                ),
                TextSpan(
                  text: ' ${"to_add_new_products".translate}',
                ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     Text(
          //       'There are no items to display at the moment! \n Click At ',
          //     ),
          //     Icon(
          //       Icons.add_circle,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //   ],
          // ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/sub_cat_item.dart';
import '../../../core/extensions/string.dart';
import '../../../core/components/sized_box_helper.dart';

class ToolsOnlineStoresView extends StatelessWidget {
  const ToolsOnlineStoresView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'online_tools_store'.translate,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const BoxHelper(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'online_tools_store_desc'.translate,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(
            9,
            (index) => PopupMenuButton(
              itemBuilder: (context) => List.generate(
                4,
                (index) => PopupMenuItem(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/301.png',
                        height: ScreenUtil().setHeight(50),
                        width: ScreenUtil().setWidth(50),
                      ),
                      const Text(
                        'Cat Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: const SubCategoryItem(),
            ),
          ),
        ),
      ],
    );
  }
}

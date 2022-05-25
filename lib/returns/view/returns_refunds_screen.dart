import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../core/extensions/string.dart';

class ReturnsAndRefundsScreen extends StatefulWidget {
  const ReturnsAndRefundsScreen({Key? key}) : super(key: key);
  static const routeName = '/returns-and-refunds';

  @override
  State<ReturnsAndRefundsScreen> createState() =>
      _ReturnsAndRefundsScreenState();
}

class _ReturnsAndRefundsScreenState extends State<ReturnsAndRefundsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var list = 'returns_refunds_body'.translate.split('\n').where((element) {
      return element != 'returns_refunds_body'.translate.split('\n').first;
    }).toList();
    return Scaffold(
      key: scaffoldKey,
      appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      drawer: const MyDrawer(),

      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //     color: Colors.black,
      //     onPressed: () {
      //       NavigationService.goBack();
      //     },
      //   ),
      //   title: Text(
      //     'returns_refunds'.translate,
      //     style: const TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'returns_refunds_body'.translate.split('\n').first,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: RichText(
                text: TextSpan(
                  children: List.generate(list.length, (index) {
                    log('${list[index]} $index');
                    return TextSpan(
                      text: '${list[index]} \n\n',
                      style: TextStyle(
                        fontWeight:
                            index == 1 || index == 4 ? FontWeight.bold : null,
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'postal_code_refunds_hint'.translate,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const RegisterField(
                    removePadding: true,
                    thinBorder: true,
                    hintText: 'postal_code_refunds_hint',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'order_number'.translate,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const RegisterField(
                    removePadding: true,
                    thinBorder: true,
                    hintText: 'order_number',
                  ),
                ],
              ),
            ),
            RegisterButton(
              title: 'search',
              onPressed: () {},
              radius: 12,
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

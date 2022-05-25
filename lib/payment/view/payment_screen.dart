import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../core/extensions/string.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static const routeName = '/payment-screen';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      drawer: const MyDrawer(),

      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //     'payment'.translate,
      //     style: const TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //     color: Colors.black,
      //     onPressed: () {
      //       NavigationService.goBack();
      //     },
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'credit_card_details'.translate.split('\n\n').first,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                ),
              ),
              const BoxHelper(
                height: 10,
              ),
              Text(
                'credit_card_details'.translate.split('\n\n').last,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
              const BoxHelper(
                height: 40,
              ),
              Text(
                'paypal_details'.translate.split('\n\n').first,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                ),
              ),
              const BoxHelper(
                height: 10,
              ),
              Text(
                'paypal_details'.translate.split('\n\n').last,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
              BoxHelper(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

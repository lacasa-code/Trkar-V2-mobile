import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:auto_route/auto_route.dart';
import '../../core/router/router.gr.dart';
// import 'package:trkar/delivery/view/delivery_screen.dart';
// import 'package:trkar/legalNotice/view/legal_notice_screen.dart';
// import 'package:trkar/payment/view/payment_screen.dart';
// import 'package:trkar/privacy/view/privacy_screen.dart';
// import 'package:trkar/returns/view/returns_refunds_screen.dart';
// import 'package:trkar/terms/view/terms_screen.dart';
import '../../core/extensions/string.dart';
import './widgets/about_trkar_card_item.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);
  static const routeName = '/about-trkar';

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/icons/trkarLogoWhite.png',
              // alignment: Al,
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setWidth(50),
            ),
            AboutTrkarCardItem(
              title: 'replacement',
              onPressed: () {
                context.router.push(const ReturnsAndRefundsScreen());
              },
            ),
            AboutTrkarCardItem(
              title: 'payment',
              onPressed: () {
                context.router.push(const PaymentScreen());
              },
            ),
            AboutTrkarCardItem(
              title: 'legal_notice',
              onPressed: () {
                context.router.push(const LegalNoticeScreen());
              },
            ),
            AboutTrkarCardItem(
              title: 'right_of_withdrawal',
              onPressed: () {
                context.router.push(const RightsOfWithdrawalScreen());
              },
            ),
            AboutTrkarCardItem(
              title: 'terms',
              onPressed: () {
                context.router.push(const TermsAndConditionsScreen());
              },
            ),
            AboutTrkarCardItem(
              title: 'privacy_policy',
              onPressed: () {
                context.router.push(const PrivacyScreen());
              },
            ),
            AboutTrkarCardItem(
              title: 'delivery',
              onPressed: () {
                context.router.push(const DeliveryScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

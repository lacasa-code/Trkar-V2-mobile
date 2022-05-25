import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/delivery/view/delivery_screen.dart';
import 'package:trkar/legalNotice/view/legal_notice_screen.dart';
import 'package:trkar/payment/view/payment_screen.dart';
import 'package:trkar/privacy/view/privacy_screen.dart';
import 'package:trkar/returns/view/returns_refunds_screen.dart';
import 'package:trkar/rightOfWithDrawal/view/rights_of_withdrawal.dart';
import 'package:trkar/terms/view/terms_screen.dart';
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
                NavigationService.push(
                  page: ReturnsAndRefundsScreen.routeName,
                );
              },
            ),
            AboutTrkarCardItem(
              title: 'payment',
              onPressed: () {
                NavigationService.push(
                  page: PaymentScreen.routeName,
                );
              },
            ),
            AboutTrkarCardItem(
              title: 'legal_notice',
              onPressed: () {
                NavigationService.push(
                  page: LegalNoticeScreen.routeName,
                );
              },
            ),
            AboutTrkarCardItem(
              title: 'right_of_withdrawal',
              onPressed: () {
                NavigationService.push(
                  page: RightsOfWithdrawalScreen.routeName,
                );
              },
            ),
            AboutTrkarCardItem(
              title: 'terms',
              onPressed: () {
                NavigationService.push(
                  page: TermsAndConitionsScreen.routeName,
                );
              },
            ),
            AboutTrkarCardItem(
              title: 'privacy_policy',
              onPressed: () {
                NavigationService.push(
                  page: PrivacyScreen.routeName,
                );
              },
            ),
            AboutTrkarCardItem(
              title: 'delivery',
              onPressed: () {
                NavigationService.push(
                  page: DeliveryScreen.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../core/extensions/string.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);
  static const routeName = '/terms-and-conditions';

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      key: scaffoldKey,
      drawer: const MyDrawer(),

      // appBar: AppBar(
      // elevation: 0,
      // backgroundColor: Colors.transparent,
      // title: Text(
      //   'terms'.translate,
      //   style: const TextStyle(
      //     color: Colors.black,
      //   ),
      // ),
      // leading: IconButton(
      //   onPressed: () {
      //     NavigationService.goBack();
      //   },
      //   color: Colors.black,
      //   icon: const Icon(
      //     Icons.arrow_back,
      //   ),
      // ),
      // ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'A Terms and Conditions agreement acts as legal contracts between you (the company) who has the website or mobile app, and the user who accesses your website/app. \nHaving a Terms and Conditions agreement is completely optional. No laws require you to have one. Not even the super-strict and wide-reaching General Data Protection Regulation (GDPR). \nYour Terms and Conditions agreement will be uniquely yours. While some clauses are standard and commonly seen in pretty much every Terms and Conditions agreement, it\'s up to you to set the rules and guidelines that the user must agree to. \nYou can think of your Terms and Conditions agreement as the legal agreement where you maintain your rights to exclude users from your app in the event that they abuse your app, where you maintain your legal rights against potential app abusers, and so on. \nTerms and Conditions agreements are also known as Terms of Service or Terms of Use agreements. These terms are interchangeable, practically speaking.',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(15),
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

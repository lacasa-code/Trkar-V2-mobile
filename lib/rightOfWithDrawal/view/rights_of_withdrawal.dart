import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../core/extensions/string.dart';

class RightsOfWithdrawalScreen extends StatefulWidget {
  const RightsOfWithdrawalScreen({Key? key}) : super(key: key);
  static const routeName = '/right_of_withdrawal';

  @override
  State<RightsOfWithdrawalScreen> createState() =>
      _RightsOfWithdrawalScreenState();
}

class _RightsOfWithdrawalScreenState extends State<RightsOfWithdrawalScreen> {
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
      //   leading: IconButton(
      //     onPressed: () {
      //       NavigationService.goBack();
      //     },
      //     color: Colors.black,
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //   ),
      //   title: Text(
      //     'right_of_withdrawal'.translate,
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
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

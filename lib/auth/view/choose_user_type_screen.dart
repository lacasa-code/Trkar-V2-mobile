import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trkar/auth/view/register_screen.dart';
import 'package:trkar/core/components/or_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';

class ChooseUserTypeScreen extends StatefulWidget {
  const ChooseUserTypeScreen({Key? key}) : super(key: key);
  static const routeName = '/choose_type';

  @override
  _ChooseUserTypeScreenState createState() => _ChooseUserTypeScreenState();
}

class _ChooseUserTypeScreenState extends State<ChooseUserTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BoxHelper(
            height: 100,
          ),
          Image.asset(
            'assets/icons/trkarLogoWhite.png',
            // alignment: Al,
          ),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BoxHelper(
                  height: 80,
                ),
                RegisterButton(
                  title: 'register_as_customer',
                  onPressed: () {
                    NavigationService.push(
                      page: RegisterScreen.routeName,
                      arguments: 0,
                    );
                  },
                  color: Colors.deepOrange,
                  radius: 10,
                ),
                const OrWidget(),
                RegisterButton(
                  title: 'register_as_vendor',
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: 'Coming Soon...',
                      backgroundColor: Theme.of(context).primaryColor,
                    );
                    return;
                    NavigationService.push(
                      page: RegisterScreen.routeName,
                      arguments: 1,
                    );
                  },
                  color: Colors.deepOrange,
                  radius: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

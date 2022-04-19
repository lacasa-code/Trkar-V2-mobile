import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/auth/view/login_screen.dart';
import 'package:trkar/auth/viewModel/validateToken/validate_token_cubit.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/profile/viewModel/userProfile/user_profile_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (Helper.isLoggedIn) {
        log('isCurrentTokenValide => ${Helper.isValidToken}');
        context.read<ValidateTokenCubit>().validateToken(context);
        context.read<UserProfileCubit>().getUserProfile(context);
      }
      NavigationService.pushReplacementAll(
        page: LoginScreen.routeName,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/splashscreen.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(170),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Image.asset(
                'assets/icons/splashscreen-trkar-logo-white.gif',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

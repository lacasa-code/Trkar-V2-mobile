import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trkar/auth/view/login_screen.dart';
import 'package:trkar/auth/viewModel/validateToken/validate_token_cubit.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/tab/view/tab_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      var validateTokenCubit = context.read<ValidateTokenCubit>();
      if (GetStorage().hasData('vendor')) {
        await validateTokenCubit.validateToken(context);
      } else {
        await validateTokenCubit.validateToken(
          context,
          isUserToken: true,
        );
      }
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                textDirection: TextDirection.ltr,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      'assets/icons/splashscreen-trkar-logo-white.gif',
                    ),
                  ),
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/icons/svg/spare-parts.svg',
                      height: ScreenUtil().setHeight(20),
                      width: ScreenUtil().setWidth(20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/auth/viewModel/logout/logout_cubit.dart';
import 'package:trkar/auth/viewModel/validateToken/validate_token_cubit.dart';
import 'package:trkar/core/helper/app_localization.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/routes/routes_generator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/profile/viewModel/userProfile/user_profile_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ValidateTokenCubit(),
        ),
        BlocProvider(
          create: (_) => UserProfileCubit(),
        ),
        BlocProvider(
          create: (_) => LogoutCubit(),
        ),
        BlocProvider(
          create: (_) => FilterCarsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trkar',
        navigatorKey: NavigationService.navigationKey,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.orangeAccent,
        ),
        locale: localization.locale,
        supportedLocales: localization.supportedLocales(),
        builder: (ctx, widget) => ScreenUtilInit(
          builder: (_) => widget ?? const SizedBox(),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        onGenerateRoute: RoutesGenerator.onRoutesGenerated,
      ),
    );
  }
}

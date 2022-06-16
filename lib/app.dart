import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import 'package:trkar/auth/viewModel/logout/logout_cubit.dart';
import 'package:trkar/auth/viewModel/validateToken/validate_token_cubit.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/helper/app_localization.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/router/router.gr.dart';

import 'package:trkar/core/routes/routes_generator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/profile/viewModel/userProfile/user_profile_cubit.dart';
import 'package:trkar/tools/view/tools_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

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
          create: (_) => AddressDataCubit(),
        ),
        BlocProvider(
          create: (_) => FilterCarsCubit(),
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider<SubCategoriesCubit>(
          create: (context) => SubCategoriesCubit(),
        ),
      ],
      child:
          /**      MaterialApp(
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
          builder: (_, __) => widget ?? const SizedBox(),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        // initialRoute: ToolsScreen.routeName,
        onGenerateRoute: RoutesGenerator.onRoutesGenerated,
      ),*/
          MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        title: 'Trkar',

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
          primaryColor: const Color(0xffF49F04),
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          textTheme: const TextTheme(
            headline4: TextStyle(
              color: Colors.orangeAccent,
            ),
            headline5: TextStyle(
              color: Color(0xffB8B8B8),
            ),
            headline1: TextStyle(
              color: Colors.black,
            ),
            headline2: TextStyle(
              color: Color(0xff9E9E9E),
            ),
            headline3: TextStyle(
              color: Colors.red,
            ),
          ),

          primaryIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          iconTheme: const IconThemeData(
            color: Colors.orangeAccent,
          ),
        ),

        locale: localization.locale,
        supportedLocales: localization.supportedLocales(),
        builder: (ctx, widget) => ScreenUtilInit(
          builder: (_, __) => widget ?? const SizedBox(),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        // initialRoute: ToolsScreen.routeName,
      ),
    );
  }
}

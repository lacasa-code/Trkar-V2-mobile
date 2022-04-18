import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/auth/view/login_screen.dart';
import 'package:trkar/auth/viewModel/login/login_cubit.dart';
import 'package:trkar/splash/view/splash_screen.dart';

class RoutesGenerator {
  static Route<dynamic>? onRoutesGenerated(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
    }
  }
}

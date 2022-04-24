import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import 'package:trkar/auth/view/choose_user_type_screen.dart';
import 'package:trkar/auth/view/email_verfication_screen.dart';
import 'package:trkar/auth/view/forget_password_screen.dart';
import 'package:trkar/auth/view/login_screen.dart';
import 'package:trkar/auth/view/register_screen.dart';
import 'package:trkar/auth/view/reset_password_screen.dart';
import 'package:trkar/auth/viewModel/login/login_cubit.dart';
import 'package:trkar/auth/viewModel/register/register_cubit.dart';
import 'package:trkar/home/view/home_screen.dart';
import 'package:trkar/profile/view/edit_profile_screen.dart';
import 'package:trkar/profile/viewModel/updateUserProfile/update_user_profile_cubit.dart';
import 'package:trkar/splash/view/splash_screen.dart';

class RoutesGenerator {
  static Route<dynamic>? onRoutesGenerated(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );
      case ChooseUserTypeScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChooseUserTypeScreen(),
        );
      case RegisterScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    RegisterCubit(userType: settings.arguments as int),
              ),
              BlocProvider(
                create: (_) => AddressDataCubit(),
              ),
            ],
            child: BlocProvider(
              create: (_) => RegisterCubit(userType: settings.arguments as int),
              child: const RegisterScreen(),
            ),
          ),
        );
      case EmailVerficationScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EmailVerficationScreen(),
        );
      case ForgetPasswordScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgetPasswordScreen(),
        );
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ResetPasswordScreen(),
        );
      case EditProfileScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => UpdateUserProfileCubit(),
              ),
              BlocProvider(
                create: (_) => AddressDataCubit(),
              ),
            ],
            child: const EditProfileScreen(),
          ),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
    }
  }
}

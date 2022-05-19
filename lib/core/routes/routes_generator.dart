import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/Addresses/model/my_addresses_model.dart';
import 'package:trkar/Addresses/view/add_new_address_screen.dart';
import 'package:trkar/Addresses/view/addresses_screen.dart';
import 'package:trkar/Addresses/viewModel/addNewAddress/add_new_address_cubit.dart';
import 'package:trkar/about/view/about_screen.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import 'package:trkar/auth/view/choose_user_type_screen.dart';
import 'package:trkar/auth/view/email_verfication_screen.dart';
import 'package:trkar/auth/view/forget_password_screen.dart';
import 'package:trkar/auth/view/login_screen.dart';
import 'package:trkar/auth/view/register_screen.dart';
import 'package:trkar/auth/view/reset_password_screen.dart';
import 'package:trkar/auth/viewModel/login/login_cubit.dart';
import 'package:trkar/auth/viewModel/register/register_cubit.dart';
import 'package:trkar/cars/view/my_cars_screen.dart';
import 'package:trkar/cart/view/cart_screen.dart';
import 'package:trkar/categories/carMades/view/all_car_mades_screen.dart';
import 'package:trkar/categories/manufacturers/view/all_manufacturers_screen.dart';
import 'package:trkar/categories/view/categories_screen.dart';
import 'package:trkar/categories/view/sub_categories_screen.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/delivery/view/delivery_screen.dart';
import 'package:trkar/favorites/view/favorites_screen.dart';
import 'package:trkar/home/view/home_screen.dart';
import 'package:trkar/legalNotice/view/legal_notice_screen.dart';
import 'package:trkar/localization/view/change_language_screen.dart';
import 'package:trkar/localization/viewModel/lang/lang_cubit.dart';
import 'package:trkar/payment/view/payment_screen.dart';
import 'package:trkar/privacy/view/privacy_screen.dart';
import 'package:trkar/profile/view/edit_profile_screen.dart';
import 'package:trkar/profile/view/profile_screen.dart';
import 'package:trkar/profile/viewModel/updateUserProfile/update_user_profile_cubit.dart';
import 'package:trkar/returns/view/returns_refunds_screen.dart';
import 'package:trkar/rightOfWithDrawal/view/rights_of_withdrawal.dart';
import 'package:trkar/splash/view/splash_screen.dart';
import 'package:trkar/support/view/support_screen.dart';
import 'package:trkar/tab/view/tab_screen.dart';
import 'package:trkar/tab/viewModel/cubit/tab_cubit.dart';
import 'package:trkar/terms/view/terms_screen.dart';
import 'package:trkar/tyres/view/tyres_screen.dart';
import 'package:trkar/tyres/viewModel/tyresFilter/tyres_filter_cubit.dart';

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
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case CartScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CartScreen(),
        );
      case ReturnsAndRefundsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ReturnsAndRefundsScreen(),
        );
      case TermsAndConitionsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TermsAndConitionsScreen(),
        );
      case SupportScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => AddressDataCubit(),
            child: const SupportScreen(),
          ),
        );
      case PrivacyScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PrivacyScreen(),
        );
      case AboutScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AboutScreen(),
        );
      case DeliveryScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DeliveryScreen(),
        );
      case FavoritesScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const FavoritesScreen(),
        );
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProfileScreen(),
        );
      case PaymentScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PaymentScreen(),
        );
      case TyresScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => TyresFilterCubit(),
            child: const TyresScreen(),
          ),
        );
      case AllCarMadesScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AllCarMadesScreen(),
        );
      case AllManufacturersScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AllManufacturersScreen(),
        );
      case RightsOfWithdrawalScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RightsOfWithdrawalScreen(),
        );
      case LegalNoticeScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LegalNoticeScreen(),
        );
      case CategoriesScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => CategoriesCubit(),
              ),
            ],
            child: const CategoriesScreen(),
          ),
        );
      case SubCategoriesScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              // BlocProvider<CategoriesCubit>.value(
              //   value: (settings.arguments
              //       as Map<String, dynamic>?)?['categories_cubit'],
              // ),
              BlocProvider<SubCategoriesCubit>(
                create: (_) => SubCategoriesCubit(
                  categoryName: (settings.arguments
                      as Map<String, dynamic>?)?['category_name'] as String?,
                  parentId: (settings.arguments
                      as Map<String, dynamic>?)?['parent_id'],
                ),
              ),
            ],
            child: const SubCategoriesScreen(),
          ),
        );
      case ChangeLanguageScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<LangCubit>(
            create: (_) => LangCubit(),
            child: const ChangeLanguageScreen(),
          ),
        );
      case AddressesScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AddressesScreen(),
        );
      case MyCarsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyCarsScreen(),
        );
      case AddNewAddressScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => AddNewAddressCubit(
              address: settings.arguments as Address?,
            ),
            child: const AddNewAddressScreen(),
          ),
        );
      case TabScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<TabCubit>(
            create: (_) => TabCubit(),
            child: const TabScreen(),
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

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i39;

import '../../about/view/about_screen.dart' as _i31;
import '../../Addresses/view/add_new_address_screen.dart' as _i28;
import '../../Addresses/view/addresses_screen.dart' as _i27;
import '../../auth/view/choose_user_type_screen.dart' as _i6;
import '../../auth/view/email_verfication_screen.dart' as _i7;
import '../../auth/view/forget_password_screen.dart' as _i8;
import '../../auth/view/login_screen.dart' as _i5;
import '../../auth/view/register_screen.dart' as _i10;
import '../../auth/view/reset_password_screen.dart' as _i9;
import '../../brakes/view/brakes_screen.dart' as _i24;
import '../../carAccessories/view/car_accessories_screen.dart' as _i17;
import '../../cart/view/cart_screen.dart' as _i14;
import '../../categories/carMades/view/all_car_mades_screen.dart' as _i19;
import '../../categories/manufacturers/view/all_manufacturers_screen.dart'
    as _i20;
import '../../categories/view/categories_screen.dart' as _i15;
import '../../categories/view/sub_categories_screen.dart' as _i16;
import '../../delivery/view/delivery_screen.dart' as _i38;
import '../../engineOil/view/engine_oil_screen.dart' as _i21;
import '../../favorites/view/favorites_screen.dart' as _i13;
import '../../filters/view/filters_screen.dart' as _i18;
import '../../home/view/home_screen.dart' as _i11;
import '../../legalNotice/view/legal_notice_screen.dart' as _i34;
import '../../localization/view/change_language_screen.dart' as _i26;
import '../../mainScreen/tab_page.dart' as _i4;
import '../../payment/view/payment_screen.dart' as _i33;
import '../../privacy/view/privacy_screen.dart' as _i36;
import '../../profile/view/edit_profile_screen.dart' as _i29;
import '../../profile/view/profile_screen.dart' as _i25;
import '../../returns/view/returns_refunds_screen.dart' as _i32;
import '../../rightOfWithDrawal/view/rights_of_withdrawal.dart' as _i35;
import '../../splash/view/splash_screen.dart' as _i1;
import '../../support/view/support_screen.dart' as _i30;
import '../../terms/view/terms_screen.dart' as _i37;
import '../../tools/view/tools_screen.dart' as _i23;
import '../../tyres/view/tyres_screen.dart' as _i22;
import '../../vendor/home/view/vendor_home_screen.dart' as _i3;
import '../../vendor/resumeData/view/resume_data_screen.dart' as _i2;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i39.GlobalKey<_i39.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    ResumeDataRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(child: const _i2.ResumeDataScreen()));
    },
    VendorHomeRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.VendorHomeScreen());
    },
    TabRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(child: const _i4.TabPage()));
    },
    LoginRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(child: const _i5.LoginScreen()));
    },
    ChooseTypeRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ChooseUserTypeScreen());
    },
    EmailVerficationRouter.name: (routeData) {
      final args = routeData.argsAs<EmailVerficationRouterArgs>(
          orElse: () => const EmailVerficationRouterArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.EmailVerficationScreen(
              key: args.key,
              stateOfVerfication: args.stateOfVerfication,
              phoneNumber: args.phoneNumber));
    },
    ForgetPasswordRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ForgetPasswordScreen());
    },
    ResetPasswordRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ResetPasswordScreen());
    },
    RegisterRouter.name: (routeData) {
      final args = routeData.argsAs<RegisterRouterArgs>(
          orElse: () => const RegisterRouterArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(
              child:
                  _i10.RegisterScreen(key: args.key, userType: args.userType)));
    },
    HomeRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.HomeScreen());
    },
    CategoriesRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    FavoritesRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.FavoritesScreen());
    },
    CartRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.CartScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    CategoriesScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.CategoriesScreen());
    },
    SubCategoriesScreen.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SubCategoriesScreenArgs>(
          orElse: () => SubCategoriesScreenArgs(
              parentId: pathParams.optString('categoryId')));
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(
              child: _i16.SubCategoriesScreen(
                  key: args.key,
                  categoryName: args.categoryName,
                  parentId: args.parentId)));
    },
    CarAccessoriesScreen.name: (routeData) {
      final args = routeData.argsAs<CarAccessoriesScreenArgs>(
          orElse: () => const CarAccessoriesScreenArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(
              child: _i17.CarAccessoriesScreen(
                  key: args.key, name: args.name, parentId: args.parentId)));
    },
    FilterRouter.name: (routeData) {
      final args = routeData.argsAs<FilterRouterArgs>(
          orElse: () => const FilterRouterArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(
              child: _i18.FiltersScreen(
                  key: args.key,
                  categoryName: args.categoryName,
                  parentId: args.parentId)));
    },
    AllCarMadesScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.AllCarMadesScreen());
    },
    AllManufacturersScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.AllManufacturersScreen());
    },
    EngineOilScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(child: const _i21.EngineOilScreen()));
    },
    TyresScreen.name: (routeData) {
      final args = routeData.argsAs<TyresScreenArgs>(
          orElse: () => const TyresScreenArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(
              child: _i22.TyresScreen(key: args.key, tabIndex: args.tabIndex)));
    },
    ToolsScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.ToolsScreen());
    },
    BrakesRouter.name: (routeData) {
      final args = routeData.argsAs<BrakesRouterArgs>(
          orElse: () => const BrakesRouterArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(
              child: _i24.BrakesScreen(
                  key: args.key,
                  categoryName: args.categoryName,
                  parentId: args.parentId)));
    },
    ProfileScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.ProfileScreen());
    },
    ChangeLanguageScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(child: const _i26.ChangeLanguageScreen()));
    },
    AddressesScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.AddressesScreen());
    },
    AddNewAddressScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(child: const _i28.AddNewAddressScreen()));
    },
    EditProfileScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(child: const _i29.EditProfileScreen()));
    },
    AboutRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    SupportScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.WrappedRoute(child: const _i30.SupportScreen()));
    },
    AboutScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i31.AboutScreen());
    },
    ReturnsAndRefundsScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i32.ReturnsAndRefundsScreen());
    },
    PaymentScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i33.PaymentScreen());
    },
    LegalNoticeScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i34.LegalNoticeScreen());
    },
    RightsOfWithdrawalScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i35.RightsOfWithdrawalScreen());
    },
    PrivacyScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i36.PrivacyScreen());
    },
    TermsAndConitionsScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i37.TermsAndConitionsScreen());
    },
    DeliveryScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i38.DeliveryScreen());
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashRouter.name, path: '/'),
        _i12.RouteConfig(ResumeDataRouter.name, path: 'resume-data'),
        _i12.RouteConfig(VendorHomeRouter.name, path: 'vendor-home'),
        _i12.RouteConfig(TabRoute.name, path: 'tabs', children: [
          _i12.RouteConfig(HomeRouter.name,
              path: 'home', parent: TabRoute.name),
          _i12.RouteConfig(CategoriesRouter.name,
              path: 'categories',
              parent: TabRoute.name,
              children: [
                _i12.RouteConfig(CategoriesScreen.name,
                    path: '', parent: CategoriesRouter.name),
                _i12.RouteConfig(SubCategoriesScreen.name,
                    path: ':categoryId', parent: CategoriesRouter.name),
                _i12.RouteConfig(CarAccessoriesScreen.name,
                    path: 'car-accessories', parent: CategoriesRouter.name),
                _i12.RouteConfig(FilterRouter.name,
                    path: 'car-filters', parent: CategoriesRouter.name),
                _i12.RouteConfig(AllCarMadesScreen.name,
                    path: 'all-car-mades', parent: CategoriesRouter.name),
                _i12.RouteConfig(AllManufacturersScreen.name,
                    path: 'all-manufacturers', parent: CategoriesRouter.name),
                _i12.RouteConfig(EngineOilScreen.name,
                    path: 'engine-oil', parent: CategoriesRouter.name),
                _i12.RouteConfig(TyresScreen.name,
                    path: 'tyres', parent: CategoriesRouter.name),
                _i12.RouteConfig(ToolsScreen.name,
                    path: 'tools', parent: CategoriesRouter.name),
                _i12.RouteConfig(BrakesRouter.name,
                    path: 'brakes', parent: CategoriesRouter.name)
              ]),
          _i12.RouteConfig(FavoritesRouter.name,
              path: 'favorites', parent: TabRoute.name),
          _i12.RouteConfig(CartRouter.name,
              path: 'cart', parent: TabRoute.name),
          _i12.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: TabRoute.name,
              children: [
                _i12.RouteConfig(ProfileScreen.name,
                    path: '', parent: ProfileRouter.name),
                _i12.RouteConfig(ChangeLanguageScreen.name,
                    path: 'language', parent: ProfileRouter.name),
                _i12.RouteConfig(AddressesScreen.name,
                    path: 'addresses', parent: ProfileRouter.name),
                _i12.RouteConfig(AddNewAddressScreen.name,
                    path: 'modify-address', parent: ProfileRouter.name),
                _i12.RouteConfig(EditProfileScreen.name,
                    path: 'edit-profile', parent: ProfileRouter.name),
                _i12.RouteConfig(AboutRouter.name,
                    path: 'about',
                    parent: ProfileRouter.name,
                    children: [
                      _i12.RouteConfig(AboutScreen.name,
                          path: '', parent: AboutRouter.name),
                      _i12.RouteConfig(ReturnsAndRefundsScreen.name,
                          path: 'replacement', parent: AboutRouter.name),
                      _i12.RouteConfig(PaymentScreen.name,
                          path: 'payment', parent: AboutRouter.name),
                      _i12.RouteConfig(LegalNoticeScreen.name,
                          path: 'legal-notice', parent: AboutRouter.name),
                      _i12.RouteConfig(RightsOfWithdrawalScreen.name,
                          path: 'right-of-withdrawal',
                          parent: AboutRouter.name),
                      _i12.RouteConfig(PrivacyScreen.name,
                          path: 'privacy-policy', parent: AboutRouter.name),
                      _i12.RouteConfig(TermsAndConitionsScreen.name,
                          path: 'terms', parent: AboutRouter.name),
                      _i12.RouteConfig(DeliveryScreen.name,
                          path: 'delivery', parent: AboutRouter.name)
                    ]),
                _i12.RouteConfig(SupportScreen.name,
                    path: 'support', parent: ProfileRouter.name)
              ])
        ]),
        _i12.RouteConfig(LoginRouter.name, path: 'login'),
        _i12.RouteConfig(ChooseTypeRouter.name, path: 'choose_type'),
        _i12.RouteConfig(EmailVerficationRouter.name,
            path: 'email_verfication'),
        _i12.RouteConfig(ForgetPasswordRouter.name, path: 'forget_password'),
        _i12.RouteConfig(ResetPasswordRouter.name, path: 'reset_password'),
        _i12.RouteConfig(RegisterRouter.name, path: 'register')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRouter extends _i12.PageRouteInfo<void> {
  const SplashRouter() : super(SplashRouter.name, path: '/');

  static const String name = 'SplashRouter';
}

/// generated route for
/// [_i2.ResumeDataScreen]
class ResumeDataRouter extends _i12.PageRouteInfo<void> {
  const ResumeDataRouter() : super(ResumeDataRouter.name, path: 'resume-data');

  static const String name = 'ResumeDataRouter';
}

/// generated route for
/// [_i3.VendorHomeScreen]
class VendorHomeRouter extends _i12.PageRouteInfo<void> {
  const VendorHomeRouter() : super(VendorHomeRouter.name, path: 'vendor-home');

  static const String name = 'VendorHomeRouter';
}

/// generated route for
/// [_i4.TabPage]
class TabRoute extends _i12.PageRouteInfo<void> {
  const TabRoute({List<_i12.PageRouteInfo>? children})
      : super(TabRoute.name, path: 'tabs', initialChildren: children);

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRouter extends _i12.PageRouteInfo<void> {
  const LoginRouter() : super(LoginRouter.name, path: 'login');

  static const String name = 'LoginRouter';
}

/// generated route for
/// [_i6.ChooseUserTypeScreen]
class ChooseTypeRouter extends _i12.PageRouteInfo<void> {
  const ChooseTypeRouter() : super(ChooseTypeRouter.name, path: 'choose_type');

  static const String name = 'ChooseTypeRouter';
}

/// generated route for
/// [_i7.EmailVerficationScreen]
class EmailVerficationRouter
    extends _i12.PageRouteInfo<EmailVerficationRouterArgs> {
  EmailVerficationRouter(
      {_i39.Key? key, int stateOfVerfication = 0, String? phoneNumber})
      : super(EmailVerficationRouter.name,
            path: 'email_verfication',
            args: EmailVerficationRouterArgs(
                key: key,
                stateOfVerfication: stateOfVerfication,
                phoneNumber: phoneNumber));

  static const String name = 'EmailVerficationRouter';
}

class EmailVerficationRouterArgs {
  const EmailVerficationRouterArgs(
      {this.key, this.stateOfVerfication = 0, this.phoneNumber});

  final _i39.Key? key;

  final int stateOfVerfication;

  final String? phoneNumber;

  @override
  String toString() {
    return 'EmailVerficationRouterArgs{key: $key, stateOfVerfication: $stateOfVerfication, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i8.ForgetPasswordScreen]
class ForgetPasswordRouter extends _i12.PageRouteInfo<void> {
  const ForgetPasswordRouter()
      : super(ForgetPasswordRouter.name, path: 'forget_password');

  static const String name = 'ForgetPasswordRouter';
}

/// generated route for
/// [_i9.ResetPasswordScreen]
class ResetPasswordRouter extends _i12.PageRouteInfo<void> {
  const ResetPasswordRouter()
      : super(ResetPasswordRouter.name, path: 'reset_password');

  static const String name = 'ResetPasswordRouter';
}

/// generated route for
/// [_i10.RegisterScreen]
class RegisterRouter extends _i12.PageRouteInfo<RegisterRouterArgs> {
  RegisterRouter({_i39.Key? key, int? userType})
      : super(RegisterRouter.name,
            path: 'register',
            args: RegisterRouterArgs(key: key, userType: userType));

  static const String name = 'RegisterRouter';
}

class RegisterRouterArgs {
  const RegisterRouterArgs({this.key, this.userType});

  final _i39.Key? key;

  final int? userType;

  @override
  String toString() {
    return 'RegisterRouterArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i11.HomeScreen]
class HomeRouter extends _i12.PageRouteInfo<void> {
  const HomeRouter() : super(HomeRouter.name, path: 'home');

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class CategoriesRouter extends _i12.PageRouteInfo<void> {
  const CategoriesRouter({List<_i12.PageRouteInfo>? children})
      : super(CategoriesRouter.name,
            path: 'categories', initialChildren: children);

  static const String name = 'CategoriesRouter';
}

/// generated route for
/// [_i13.FavoritesScreen]
class FavoritesRouter extends _i12.PageRouteInfo<void> {
  const FavoritesRouter() : super(FavoritesRouter.name, path: 'favorites');

  static const String name = 'FavoritesRouter';
}

/// generated route for
/// [_i14.CartScreen]
class CartRouter extends _i12.PageRouteInfo<void> {
  const CartRouter() : super(CartRouter.name, path: 'cart');

  static const String name = 'CartRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class ProfileRouter extends _i12.PageRouteInfo<void> {
  const ProfileRouter({List<_i12.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i15.CategoriesScreen]
class CategoriesScreen extends _i12.PageRouteInfo<void> {
  const CategoriesScreen() : super(CategoriesScreen.name, path: '');

  static const String name = 'CategoriesScreen';
}

/// generated route for
/// [_i16.SubCategoriesScreen]
class SubCategoriesScreen extends _i12.PageRouteInfo<SubCategoriesScreenArgs> {
  SubCategoriesScreen({_i39.Key? key, String? categoryName, String? parentId})
      : super(SubCategoriesScreen.name,
            path: ':categoryId',
            args: SubCategoriesScreenArgs(
                key: key, categoryName: categoryName, parentId: parentId),
            rawPathParams: {'categoryId': parentId});

  static const String name = 'SubCategoriesScreen';
}

class SubCategoriesScreenArgs {
  const SubCategoriesScreenArgs({this.key, this.categoryName, this.parentId});

  final _i39.Key? key;

  final String? categoryName;

  final String? parentId;

  @override
  String toString() {
    return 'SubCategoriesScreenArgs{key: $key, categoryName: $categoryName, parentId: $parentId}';
  }
}

/// generated route for
/// [_i17.CarAccessoriesScreen]
class CarAccessoriesScreen
    extends _i12.PageRouteInfo<CarAccessoriesScreenArgs> {
  CarAccessoriesScreen({_i39.Key? key, String? name, String? parentId})
      : super(CarAccessoriesScreen.name,
            path: 'car-accessories',
            args: CarAccessoriesScreenArgs(
                key: key, name: name, parentId: parentId));

  static const String name = 'CarAccessoriesScreen';
}

class CarAccessoriesScreenArgs {
  const CarAccessoriesScreenArgs({this.key, this.name, this.parentId});

  final _i39.Key? key;

  final String? name;

  final String? parentId;

  @override
  String toString() {
    return 'CarAccessoriesScreenArgs{key: $key, name: $name, parentId: $parentId}';
  }
}

/// generated route for
/// [_i18.FiltersScreen]
class FilterRouter extends _i12.PageRouteInfo<FilterRouterArgs> {
  FilterRouter({_i39.Key? key, String? categoryName, String? parentId})
      : super(FilterRouter.name,
            path: 'car-filters',
            args: FilterRouterArgs(
                key: key, categoryName: categoryName, parentId: parentId));

  static const String name = 'FilterRouter';
}

class FilterRouterArgs {
  const FilterRouterArgs({this.key, this.categoryName, this.parentId});

  final _i39.Key? key;

  final String? categoryName;

  final String? parentId;

  @override
  String toString() {
    return 'FilterRouterArgs{key: $key, categoryName: $categoryName, parentId: $parentId}';
  }
}

/// generated route for
/// [_i19.AllCarMadesScreen]
class AllCarMadesScreen extends _i12.PageRouteInfo<void> {
  const AllCarMadesScreen()
      : super(AllCarMadesScreen.name, path: 'all-car-mades');

  static const String name = 'AllCarMadesScreen';
}

/// generated route for
/// [_i20.AllManufacturersScreen]
class AllManufacturersScreen extends _i12.PageRouteInfo<void> {
  const AllManufacturersScreen()
      : super(AllManufacturersScreen.name, path: 'all-manufacturers');

  static const String name = 'AllManufacturersScreen';
}

/// generated route for
/// [_i21.EngineOilScreen]
class EngineOilScreen extends _i12.PageRouteInfo<void> {
  const EngineOilScreen() : super(EngineOilScreen.name, path: 'engine-oil');

  static const String name = 'EngineOilScreen';
}

/// generated route for
/// [_i22.TyresScreen]
class TyresScreen extends _i12.PageRouteInfo<TyresScreenArgs> {
  TyresScreen({_i39.Key? key, int? tabIndex})
      : super(TyresScreen.name,
            path: 'tyres', args: TyresScreenArgs(key: key, tabIndex: tabIndex));

  static const String name = 'TyresScreen';
}

class TyresScreenArgs {
  const TyresScreenArgs({this.key, this.tabIndex});

  final _i39.Key? key;

  final int? tabIndex;

  @override
  String toString() {
    return 'TyresScreenArgs{key: $key, tabIndex: $tabIndex}';
  }
}

/// generated route for
/// [_i23.ToolsScreen]
class ToolsScreen extends _i12.PageRouteInfo<void> {
  const ToolsScreen() : super(ToolsScreen.name, path: 'tools');

  static const String name = 'ToolsScreen';
}

/// generated route for
/// [_i24.BrakesScreen]
class BrakesRouter extends _i12.PageRouteInfo<BrakesRouterArgs> {
  BrakesRouter({_i39.Key? key, String? categoryName, String? parentId})
      : super(BrakesRouter.name,
            path: 'brakes',
            args: BrakesRouterArgs(
                key: key, categoryName: categoryName, parentId: parentId));

  static const String name = 'BrakesRouter';
}

class BrakesRouterArgs {
  const BrakesRouterArgs({this.key, this.categoryName, this.parentId});

  final _i39.Key? key;

  final String? categoryName;

  final String? parentId;

  @override
  String toString() {
    return 'BrakesRouterArgs{key: $key, categoryName: $categoryName, parentId: $parentId}';
  }
}

/// generated route for
/// [_i25.ProfileScreen]
class ProfileScreen extends _i12.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i26.ChangeLanguageScreen]
class ChangeLanguageScreen extends _i12.PageRouteInfo<void> {
  const ChangeLanguageScreen()
      : super(ChangeLanguageScreen.name, path: 'language');

  static const String name = 'ChangeLanguageScreen';
}

/// generated route for
/// [_i27.AddressesScreen]
class AddressesScreen extends _i12.PageRouteInfo<void> {
  const AddressesScreen() : super(AddressesScreen.name, path: 'addresses');

  static const String name = 'AddressesScreen';
}

/// generated route for
/// [_i28.AddNewAddressScreen]
class AddNewAddressScreen extends _i12.PageRouteInfo<void> {
  const AddNewAddressScreen()
      : super(AddNewAddressScreen.name, path: 'modify-address');

  static const String name = 'AddNewAddressScreen';
}

/// generated route for
/// [_i29.EditProfileScreen]
class EditProfileScreen extends _i12.PageRouteInfo<void> {
  const EditProfileScreen()
      : super(EditProfileScreen.name, path: 'edit-profile');

  static const String name = 'EditProfileScreen';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class AboutRouter extends _i12.PageRouteInfo<void> {
  const AboutRouter({List<_i12.PageRouteInfo>? children})
      : super(AboutRouter.name, path: 'about', initialChildren: children);

  static const String name = 'AboutRouter';
}

/// generated route for
/// [_i30.SupportScreen]
class SupportScreen extends _i12.PageRouteInfo<void> {
  const SupportScreen() : super(SupportScreen.name, path: 'support');

  static const String name = 'SupportScreen';
}

/// generated route for
/// [_i31.AboutScreen]
class AboutScreen extends _i12.PageRouteInfo<void> {
  const AboutScreen() : super(AboutScreen.name, path: '');

  static const String name = 'AboutScreen';
}

/// generated route for
/// [_i32.ReturnsAndRefundsScreen]
class ReturnsAndRefundsScreen extends _i12.PageRouteInfo<void> {
  const ReturnsAndRefundsScreen()
      : super(ReturnsAndRefundsScreen.name, path: 'replacement');

  static const String name = 'ReturnsAndRefundsScreen';
}

/// generated route for
/// [_i33.PaymentScreen]
class PaymentScreen extends _i12.PageRouteInfo<void> {
  const PaymentScreen() : super(PaymentScreen.name, path: 'payment');

  static const String name = 'PaymentScreen';
}

/// generated route for
/// [_i34.LegalNoticeScreen]
class LegalNoticeScreen extends _i12.PageRouteInfo<void> {
  const LegalNoticeScreen()
      : super(LegalNoticeScreen.name, path: 'legal-notice');

  static const String name = 'LegalNoticeScreen';
}

/// generated route for
/// [_i35.RightsOfWithdrawalScreen]
class RightsOfWithdrawalScreen extends _i12.PageRouteInfo<void> {
  const RightsOfWithdrawalScreen()
      : super(RightsOfWithdrawalScreen.name, path: 'right-of-withdrawal');

  static const String name = 'RightsOfWithdrawalScreen';
}

/// generated route for
/// [_i36.PrivacyScreen]
class PrivacyScreen extends _i12.PageRouteInfo<void> {
  const PrivacyScreen() : super(PrivacyScreen.name, path: 'privacy-policy');

  static const String name = 'PrivacyScreen';
}

/// generated route for
/// [_i37.TermsAndConitionsScreen]
class TermsAndConitionsScreen extends _i12.PageRouteInfo<void> {
  const TermsAndConitionsScreen()
      : super(TermsAndConitionsScreen.name, path: 'terms');

  static const String name = 'TermsAndConitionsScreen';
}

/// generated route for
/// [_i38.DeliveryScreen]
class DeliveryScreen extends _i12.PageRouteInfo<void> {
  const DeliveryScreen() : super(DeliveryScreen.name, path: 'delivery');

  static const String name = 'DeliveryScreen';
}

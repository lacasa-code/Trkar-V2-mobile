// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i43;

import '../../about/view/about_screen.dart' as _i33;
import '../../Addresses/view/add_new_address_screen.dart' as _i31;
import '../../Addresses/view/addresses_screen.dart' as _i30;
import '../../auth/view/choose_user_type_screen.dart' as _i8;
import '../../auth/view/email_verfication_screen.dart' as _i9;
import '../../auth/view/forget_password_screen.dart' as _i10;
import '../../auth/view/login_screen.dart' as _i7;
import '../../auth/view/register_screen.dart' as _i12;
import '../../auth/view/reset_password_screen.dart' as _i11;
import '../../brakes/view/brakes_screen.dart' as _i27;
import '../../carAccessories/view/car_accessories_screen.dart' as _i20;
import '../../cart/view/cart_screen.dart' as _i16;
import '../../categories/carMades/view/all_car_mades_screen.dart' as _i22;
import '../../categories/manufacturers/view/all_manufacturers_screen.dart'
    as _i23;
import '../../categories/view/categories_screen.dart' as _i17;
import '../../categories/view/sub_categories_screen.dart' as _i18;
import '../../categories/view/sub_sub_category_screen.dart' as _i19;
import '../../categories/viewModel/subCategories/sub_categories_cubit.dart'
    as _i44;
import '../../delivery/view/delivery_screen.dart' as _i40;
import '../../engineOil/view/engine_oil_screen.dart' as _i24;
import '../../favorites/view/favorites_screen.dart' as _i15;
import '../../filters/view/filters_screen.dart' as _i21;
import '../../home/view/home_screen.dart' as _i13;
import '../../legalNotice/view/legal_notice_screen.dart' as _i36;
import '../../localization/view/change_language_screen.dart' as _i29;
import '../../mainScreen/tab_page.dart' as _i6;
import '../../payment/view/payment_screen.dart' as _i35;
import '../../privacy/view/privacy_screen.dart' as _i38;
import '../../profile/view/edit_profile_screen.dart' as _i32;
import '../../profile/view/profile_screen.dart' as _i28;
import '../../returns/view/returns_refunds_screen.dart' as _i34;
import '../../rightOfWithDrawal/view/rights_of_withdrawal.dart' as _i37;
import '../../splash/view/splash_screen.dart' as _i1;
import '../../support/view/submit_a_request.dart' as _i42;
import '../../support/view/support_screen.dart' as _i41;
import '../../terms/view/terms_screen.dart' as _i39;
import '../../tools/view/tools_screen.dart' as _i26;
import '../../tyres/view/tyres_screen.dart' as _i25;
import '../../vendor/dashboard/view/seller_dashboard.dart' as _i4;
import '../../vendor/home/view/vendor_home_screen.dart' as _i3;
import '../../vendor/products/view/my_products_screen.dart' as _i5;
import '../../vendor/resumeData/view/resume_data_screen.dart' as _i2;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i43.GlobalKey<_i43.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    ResumeDataRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(child: const _i2.ResumeDataScreen()));
    },
    VendorHomeRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.VendorHomeScreen());
    },
    SellerDashboardRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SellerDashboard());
    },
    MyProductsRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.MyProductScreen());
    },
    TabRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(child: const _i6.TabPage()));
    },
    LoginRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(child: const _i7.LoginScreen()));
    },
    ChooseTypeRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ChooseUserTypeScreen());
    },
    EmailVerficationRouter.name: (routeData) {
      final args = routeData.argsAs<EmailVerficationRouterArgs>(
          orElse: () => const EmailVerficationRouterArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(
              child: _i9.EmailVerificationScreen(
                  key: args.key,
                  stateOfVerification: args.stateOfVerification,
                  phoneNumber: args.phoneNumber)));
    },
    ForgetPasswordRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ForgetPasswordScreen());
    },
    ResetPasswordRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ResetPasswordScreen());
    },
    RegisterRouter.name: (routeData) {
      final args = routeData.argsAs<RegisterRouterArgs>(
          orElse: () => const RegisterRouterArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(
              child:
                  _i12.RegisterScreen(key: args.key, userType: args.userType)));
    },
    HomeRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.HomeScreen());
    },
    CategoriesRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.EmptyRouterPage());
    },
    FavoritesRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.FavoritesScreen());
    },
    CartRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.CartScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.EmptyRouterPage());
    },
    CategoriesScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.CategoriesScreen());
    },
    SubCategoriesScreen.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SubCategoriesScreenArgs>(
          orElse: () => SubCategoriesScreenArgs(
              parentId: pathParams.optString('categoryId')));
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(
              child: _i18.SubCategoriesScreen(
                  key: args.key,
                  categoryName: args.categoryName,
                  parentId: args.parentId)));
    },
    SubSubCategoriesRouter.name: (routeData) {
      final args = routeData.argsAs<SubSubCategoriesRouterArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(
              child: _i19.SubSubCategoriesScreen(
                  key: args.key, subCategoriesCubit: args.subCategoriesCubit)));
    },
    CarAccessoriesScreen.name: (routeData) {
      final args = routeData.argsAs<CarAccessoriesScreenArgs>(
          orElse: () => const CarAccessoriesScreenArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(
              child: _i20.CarAccessoriesScreen(
                  key: args.key, name: args.name, parentId: args.parentId)));
    },
    FilterRouter.name: (routeData) {
      final args = routeData.argsAs<FilterRouterArgs>(
          orElse: () => const FilterRouterArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(
              child: _i21.FiltersScreen(
                  key: args.key,
                  categoryName: args.categoryName,
                  parentId: args.parentId)));
    },
    AllCarMadesScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.AllCarMadesScreen());
    },
    AllManufacturersScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.AllManufacturersScreen());
    },
    EngineOilScreen.name: (routeData) {
      final args = routeData.argsAs<EngineOilScreenArgs>(
          orElse: () => const EngineOilScreenArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(
              child: _i24.EngineOilScreen(
                  key: args.key, categoryId: args.categoryId)));
    },
    TyresScreen.name: (routeData) {
      final args = routeData.argsAs<TyresScreenArgs>(
          orElse: () => const TyresScreenArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(
              child: _i25.TyresScreen(key: args.key, tabIndex: args.tabIndex)));
    },
    ToolsScreen.name: (routeData) {
      final args = routeData.argsAs<ToolsScreenArgs>(
          orElse: () => const ToolsScreenArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(
              child: _i26.ToolsScreen(
                  key: args.key, categoryId: args.categoryId)));
    },
    BrakesRouter.name: (routeData) {
      final args = routeData.argsAs<BrakesRouterArgs>(
          orElse: () => const BrakesRouterArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(
              child: _i27.BrakesScreen(
                  key: args.key,
                  categoryName: args.categoryName,
                  parentId: args.parentId)));
    },
    ProfileScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.ProfileScreen());
    },
    ChangeLanguageScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(child: const _i29.ChangeLanguageScreen()));
    },
    AddressesScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i30.AddressesScreen());
    },
    AddNewAddressScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(child: const _i31.AddNewAddressScreen()));
    },
    EditProfileScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(child: const _i32.EditProfileScreen()));
    },
    AboutUsRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i33.AboutScreen());
    },
    ReturnsAndRefundsScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i34.ReturnsAndRefundsScreen());
    },
    PaymentScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i35.PaymentScreen());
    },
    LegalNoticeScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i36.LegalNoticeScreen());
    },
    RightsOfWithdrawalScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i37.RightsOfWithdrawalScreen());
    },
    PrivacyScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i38.PrivacyScreen());
    },
    TermsAndConditionsScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i39.TermsAndConditionsScreen());
    },
    DeliveryScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i40.DeliveryScreen());
    },
    SupportScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.WrappedRoute(child: const _i41.SupportScreen()));
    },
    SubmitRequestRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i42.SubmitARequest());
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(SplashRouter.name, path: '/'),
        _i14.RouteConfig(ResumeDataRouter.name, path: 'resume-data'),
        _i14.RouteConfig(VendorHomeRouter.name, path: 'vendor-home'),
        _i14.RouteConfig(SellerDashboardRouter.name, path: 'seller-dashboard'),
        _i14.RouteConfig(MyProductsRouter.name, path: 'my-products'),
        _i14.RouteConfig(TabRoute.name, path: 'tabs', children: [
          _i14.RouteConfig(HomeRouter.name,
              path: 'home', parent: TabRoute.name),
          _i14.RouteConfig(CategoriesRouter.name,
              path: 'categories',
              parent: TabRoute.name,
              children: [
                _i14.RouteConfig(CategoriesScreen.name,
                    path: '', parent: CategoriesRouter.name),
                _i14.RouteConfig(SubCategoriesScreen.name,
                    path: ':categoryId', parent: CategoriesRouter.name),
                _i14.RouteConfig(SubSubCategoriesRouter.name,
                    path: 'sub-sub-categories', parent: CategoriesRouter.name),
                _i14.RouteConfig(CarAccessoriesScreen.name,
                    path: 'car-accessories', parent: CategoriesRouter.name),
                _i14.RouteConfig(FilterRouter.name,
                    path: 'car-filters', parent: CategoriesRouter.name),
                _i14.RouteConfig(AllCarMadesScreen.name,
                    path: 'all-car-mades', parent: CategoriesRouter.name),
                _i14.RouteConfig(AllManufacturersScreen.name,
                    path: 'all-manufacturers', parent: CategoriesRouter.name),
                _i14.RouteConfig(EngineOilScreen.name,
                    path: 'engine-oil', parent: CategoriesRouter.name),
                _i14.RouteConfig(TyresScreen.name,
                    path: 'tyres', parent: CategoriesRouter.name),
                _i14.RouteConfig(ToolsScreen.name,
                    path: 'tools', parent: CategoriesRouter.name),
                _i14.RouteConfig(BrakesRouter.name,
                    path: 'brakes', parent: CategoriesRouter.name)
              ]),
          _i14.RouteConfig(FavoritesRouter.name,
              path: 'favorites', parent: TabRoute.name),
          _i14.RouteConfig(CartRouter.name,
              path: 'cart', parent: TabRoute.name),
          _i14.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: TabRoute.name,
              children: [
                _i14.RouteConfig(ProfileScreen.name,
                    path: '', parent: ProfileRouter.name),
                _i14.RouteConfig(ChangeLanguageScreen.name,
                    path: 'language', parent: ProfileRouter.name),
                _i14.RouteConfig(AddressesScreen.name,
                    path: 'addresses', parent: ProfileRouter.name),
                _i14.RouteConfig(AddNewAddressScreen.name,
                    path: 'modify-address', parent: ProfileRouter.name),
                _i14.RouteConfig(EditProfileScreen.name,
                    path: 'edit-profile', parent: ProfileRouter.name),
                _i14.RouteConfig(AboutUsRouter.name,
                    path: 'about-us', parent: ProfileRouter.name),
                _i14.RouteConfig(ReturnsAndRefundsScreen.name,
                    path: 'replacement', parent: ProfileRouter.name),
                _i14.RouteConfig(PaymentScreen.name,
                    path: 'payment', parent: ProfileRouter.name),
                _i14.RouteConfig(LegalNoticeScreen.name,
                    path: 'legal-notice', parent: ProfileRouter.name),
                _i14.RouteConfig(RightsOfWithdrawalScreen.name,
                    path: 'right-of-withdrawal', parent: ProfileRouter.name),
                _i14.RouteConfig(PrivacyScreen.name,
                    path: 'privacy-policy', parent: ProfileRouter.name),
                _i14.RouteConfig(TermsAndConditionsScreen.name,
                    path: 'terms', parent: ProfileRouter.name),
                _i14.RouteConfig(DeliveryScreen.name,
                    path: 'delivery', parent: ProfileRouter.name),
                _i14.RouteConfig(SupportScreen.name,
                    path: 'support', parent: ProfileRouter.name),
                _i14.RouteConfig(SubmitRequestRouter.name,
                    path: 'submit-request', parent: ProfileRouter.name)
              ])
        ]),
        _i14.RouteConfig(LoginRouter.name, path: 'login'),
        _i14.RouteConfig(ChooseTypeRouter.name, path: 'choose_type'),
        _i14.RouteConfig(EmailVerficationRouter.name,
            path: 'email_verfication'),
        _i14.RouteConfig(ForgetPasswordRouter.name, path: 'forget_password'),
        _i14.RouteConfig(ResetPasswordRouter.name, path: 'reset_password'),
        _i14.RouteConfig(RegisterRouter.name, path: 'register')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRouter extends _i14.PageRouteInfo<void> {
  const SplashRouter() : super(SplashRouter.name, path: '/');

  static const String name = 'SplashRouter';
}

/// generated route for
/// [_i2.ResumeDataScreen]
class ResumeDataRouter extends _i14.PageRouteInfo<void> {
  const ResumeDataRouter() : super(ResumeDataRouter.name, path: 'resume-data');

  static const String name = 'ResumeDataRouter';
}

/// generated route for
/// [_i3.VendorHomeScreen]
class VendorHomeRouter extends _i14.PageRouteInfo<void> {
  const VendorHomeRouter() : super(VendorHomeRouter.name, path: 'vendor-home');

  static const String name = 'VendorHomeRouter';
}

/// generated route for
/// [_i4.SellerDashboard]
class SellerDashboardRouter extends _i14.PageRouteInfo<void> {
  const SellerDashboardRouter()
      : super(SellerDashboardRouter.name, path: 'seller-dashboard');

  static const String name = 'SellerDashboardRouter';
}

/// generated route for
/// [_i5.MyProductScreen]
class MyProductsRouter extends _i14.PageRouteInfo<void> {
  const MyProductsRouter() : super(MyProductsRouter.name, path: 'my-products');

  static const String name = 'MyProductsRouter';
}

/// generated route for
/// [_i6.TabPage]
class TabRoute extends _i14.PageRouteInfo<void> {
  const TabRoute({List<_i14.PageRouteInfo>? children})
      : super(TabRoute.name, path: 'tabs', initialChildren: children);

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRouter extends _i14.PageRouteInfo<void> {
  const LoginRouter() : super(LoginRouter.name, path: 'login');

  static const String name = 'LoginRouter';
}

/// generated route for
/// [_i8.ChooseUserTypeScreen]
class ChooseTypeRouter extends _i14.PageRouteInfo<void> {
  const ChooseTypeRouter() : super(ChooseTypeRouter.name, path: 'choose_type');

  static const String name = 'ChooseTypeRouter';
}

/// generated route for
/// [_i9.EmailVerificationScreen]
class EmailVerficationRouter
    extends _i14.PageRouteInfo<EmailVerficationRouterArgs> {
  EmailVerficationRouter(
      {_i43.Key? key, int stateOfVerification = 0, String? phoneNumber})
      : super(EmailVerficationRouter.name,
            path: 'email_verfication',
            args: EmailVerficationRouterArgs(
                key: key,
                stateOfVerification: stateOfVerification,
                phoneNumber: phoneNumber));

  static const String name = 'EmailVerficationRouter';
}

class EmailVerficationRouterArgs {
  const EmailVerficationRouterArgs(
      {this.key, this.stateOfVerification = 0, this.phoneNumber});

  final _i43.Key? key;

  final int stateOfVerification;

  final String? phoneNumber;

  @override
  String toString() {
    return 'EmailVerficationRouterArgs{key: $key, stateOfVerification: $stateOfVerification, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i10.ForgetPasswordScreen]
class ForgetPasswordRouter extends _i14.PageRouteInfo<void> {
  const ForgetPasswordRouter()
      : super(ForgetPasswordRouter.name, path: 'forget_password');

  static const String name = 'ForgetPasswordRouter';
}

/// generated route for
/// [_i11.ResetPasswordScreen]
class ResetPasswordRouter extends _i14.PageRouteInfo<void> {
  const ResetPasswordRouter()
      : super(ResetPasswordRouter.name, path: 'reset_password');

  static const String name = 'ResetPasswordRouter';
}

/// generated route for
/// [_i12.RegisterScreen]
class RegisterRouter extends _i14.PageRouteInfo<RegisterRouterArgs> {
  RegisterRouter({_i43.Key? key, int? userType})
      : super(RegisterRouter.name,
            path: 'register',
            args: RegisterRouterArgs(key: key, userType: userType));

  static const String name = 'RegisterRouter';
}

class RegisterRouterArgs {
  const RegisterRouterArgs({this.key, this.userType});

  final _i43.Key? key;

  final int? userType;

  @override
  String toString() {
    return 'RegisterRouterArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i13.HomeScreen]
class HomeRouter extends _i14.PageRouteInfo<void> {
  const HomeRouter() : super(HomeRouter.name, path: 'home');

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i14.EmptyRouterPage]
class CategoriesRouter extends _i14.PageRouteInfo<void> {
  const CategoriesRouter({List<_i14.PageRouteInfo>? children})
      : super(CategoriesRouter.name,
            path: 'categories', initialChildren: children);

  static const String name = 'CategoriesRouter';
}

/// generated route for
/// [_i15.FavoritesScreen]
class FavoritesRouter extends _i14.PageRouteInfo<void> {
  const FavoritesRouter() : super(FavoritesRouter.name, path: 'favorites');

  static const String name = 'FavoritesRouter';
}

/// generated route for
/// [_i16.CartScreen]
class CartRouter extends _i14.PageRouteInfo<void> {
  const CartRouter() : super(CartRouter.name, path: 'cart');

  static const String name = 'CartRouter';
}

/// generated route for
/// [_i14.EmptyRouterPage]
class ProfileRouter extends _i14.PageRouteInfo<void> {
  const ProfileRouter({List<_i14.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i17.CategoriesScreen]
class CategoriesScreen extends _i14.PageRouteInfo<void> {
  const CategoriesScreen() : super(CategoriesScreen.name, path: '');

  static const String name = 'CategoriesScreen';
}

/// generated route for
/// [_i18.SubCategoriesScreen]
class SubCategoriesScreen extends _i14.PageRouteInfo<SubCategoriesScreenArgs> {
  SubCategoriesScreen({_i43.Key? key, String? categoryName, String? parentId})
      : super(SubCategoriesScreen.name,
            path: ':categoryId',
            args: SubCategoriesScreenArgs(
                key: key, categoryName: categoryName, parentId: parentId),
            rawPathParams: {'categoryId': parentId});

  static const String name = 'SubCategoriesScreen';
}

class SubCategoriesScreenArgs {
  const SubCategoriesScreenArgs({this.key, this.categoryName, this.parentId});

  final _i43.Key? key;

  final String? categoryName;

  final String? parentId;

  @override
  String toString() {
    return 'SubCategoriesScreenArgs{key: $key, categoryName: $categoryName, parentId: $parentId}';
  }
}

/// generated route for
/// [_i19.SubSubCategoriesScreen]
class SubSubCategoriesRouter
    extends _i14.PageRouteInfo<SubSubCategoriesRouterArgs> {
  SubSubCategoriesRouter(
      {_i43.Key? key, required _i44.SubCategoriesCubit subCategoriesCubit})
      : super(SubSubCategoriesRouter.name,
            path: 'sub-sub-categories',
            args: SubSubCategoriesRouterArgs(
                key: key, subCategoriesCubit: subCategoriesCubit));

  static const String name = 'SubSubCategoriesRouter';
}

class SubSubCategoriesRouterArgs {
  const SubSubCategoriesRouterArgs(
      {this.key, required this.subCategoriesCubit});

  final _i43.Key? key;

  final _i44.SubCategoriesCubit subCategoriesCubit;

  @override
  String toString() {
    return 'SubSubCategoriesRouterArgs{key: $key, subCategoriesCubit: $subCategoriesCubit}';
  }
}

/// generated route for
/// [_i20.CarAccessoriesScreen]
class CarAccessoriesScreen
    extends _i14.PageRouteInfo<CarAccessoriesScreenArgs> {
  CarAccessoriesScreen({_i43.Key? key, String? name, String? parentId})
      : super(CarAccessoriesScreen.name,
            path: 'car-accessories',
            args: CarAccessoriesScreenArgs(
                key: key, name: name, parentId: parentId));

  static const String name = 'CarAccessoriesScreen';
}

class CarAccessoriesScreenArgs {
  const CarAccessoriesScreenArgs({this.key, this.name, this.parentId});

  final _i43.Key? key;

  final String? name;

  final String? parentId;

  @override
  String toString() {
    return 'CarAccessoriesScreenArgs{key: $key, name: $name, parentId: $parentId}';
  }
}

/// generated route for
/// [_i21.FiltersScreen]
class FilterRouter extends _i14.PageRouteInfo<FilterRouterArgs> {
  FilterRouter({_i43.Key? key, String? categoryName, String? parentId})
      : super(FilterRouter.name,
            path: 'car-filters',
            args: FilterRouterArgs(
                key: key, categoryName: categoryName, parentId: parentId));

  static const String name = 'FilterRouter';
}

class FilterRouterArgs {
  const FilterRouterArgs({this.key, this.categoryName, this.parentId});

  final _i43.Key? key;

  final String? categoryName;

  final String? parentId;

  @override
  String toString() {
    return 'FilterRouterArgs{key: $key, categoryName: $categoryName, parentId: $parentId}';
  }
}

/// generated route for
/// [_i22.AllCarMadesScreen]
class AllCarMadesScreen extends _i14.PageRouteInfo<void> {
  const AllCarMadesScreen()
      : super(AllCarMadesScreen.name, path: 'all-car-mades');

  static const String name = 'AllCarMadesScreen';
}

/// generated route for
/// [_i23.AllManufacturersScreen]
class AllManufacturersScreen extends _i14.PageRouteInfo<void> {
  const AllManufacturersScreen()
      : super(AllManufacturersScreen.name, path: 'all-manufacturers');

  static const String name = 'AllManufacturersScreen';
}

/// generated route for
/// [_i24.EngineOilScreen]
class EngineOilScreen extends _i14.PageRouteInfo<EngineOilScreenArgs> {
  EngineOilScreen({_i43.Key? key, String? categoryId})
      : super(EngineOilScreen.name,
            path: 'engine-oil',
            args: EngineOilScreenArgs(key: key, categoryId: categoryId));

  static const String name = 'EngineOilScreen';
}

class EngineOilScreenArgs {
  const EngineOilScreenArgs({this.key, this.categoryId});

  final _i43.Key? key;

  final String? categoryId;

  @override
  String toString() {
    return 'EngineOilScreenArgs{key: $key, categoryId: $categoryId}';
  }
}

/// generated route for
/// [_i25.TyresScreen]
class TyresScreen extends _i14.PageRouteInfo<TyresScreenArgs> {
  TyresScreen({_i43.Key? key, int? tabIndex})
      : super(TyresScreen.name,
            path: 'tyres', args: TyresScreenArgs(key: key, tabIndex: tabIndex));

  static const String name = 'TyresScreen';
}

class TyresScreenArgs {
  const TyresScreenArgs({this.key, this.tabIndex});

  final _i43.Key? key;

  final int? tabIndex;

  @override
  String toString() {
    return 'TyresScreenArgs{key: $key, tabIndex: $tabIndex}';
  }
}

/// generated route for
/// [_i26.ToolsScreen]
class ToolsScreen extends _i14.PageRouteInfo<ToolsScreenArgs> {
  ToolsScreen({_i43.Key? key, String? categoryId})
      : super(ToolsScreen.name,
            path: 'tools',
            args: ToolsScreenArgs(key: key, categoryId: categoryId));

  static const String name = 'ToolsScreen';
}

class ToolsScreenArgs {
  const ToolsScreenArgs({this.key, this.categoryId});

  final _i43.Key? key;

  final String? categoryId;

  @override
  String toString() {
    return 'ToolsScreenArgs{key: $key, categoryId: $categoryId}';
  }
}

/// generated route for
/// [_i27.BrakesScreen]
class BrakesRouter extends _i14.PageRouteInfo<BrakesRouterArgs> {
  BrakesRouter({_i43.Key? key, String? categoryName, String? parentId})
      : super(BrakesRouter.name,
            path: 'brakes',
            args: BrakesRouterArgs(
                key: key, categoryName: categoryName, parentId: parentId));

  static const String name = 'BrakesRouter';
}

class BrakesRouterArgs {
  const BrakesRouterArgs({this.key, this.categoryName, this.parentId});

  final _i43.Key? key;

  final String? categoryName;

  final String? parentId;

  @override
  String toString() {
    return 'BrakesRouterArgs{key: $key, categoryName: $categoryName, parentId: $parentId}';
  }
}

/// generated route for
/// [_i28.ProfileScreen]
class ProfileScreen extends _i14.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i29.ChangeLanguageScreen]
class ChangeLanguageScreen extends _i14.PageRouteInfo<void> {
  const ChangeLanguageScreen()
      : super(ChangeLanguageScreen.name, path: 'language');

  static const String name = 'ChangeLanguageScreen';
}

/// generated route for
/// [_i30.AddressesScreen]
class AddressesScreen extends _i14.PageRouteInfo<void> {
  const AddressesScreen() : super(AddressesScreen.name, path: 'addresses');

  static const String name = 'AddressesScreen';
}

/// generated route for
/// [_i31.AddNewAddressScreen]
class AddNewAddressScreen extends _i14.PageRouteInfo<void> {
  const AddNewAddressScreen()
      : super(AddNewAddressScreen.name, path: 'modify-address');

  static const String name = 'AddNewAddressScreen';
}

/// generated route for
/// [_i32.EditProfileScreen]
class EditProfileScreen extends _i14.PageRouteInfo<void> {
  const EditProfileScreen()
      : super(EditProfileScreen.name, path: 'edit-profile');

  static const String name = 'EditProfileScreen';
}

/// generated route for
/// [_i33.AboutScreen]
class AboutUsRouter extends _i14.PageRouteInfo<void> {
  const AboutUsRouter() : super(AboutUsRouter.name, path: 'about-us');

  static const String name = 'AboutUsRouter';
}

/// generated route for
/// [_i34.ReturnsAndRefundsScreen]
class ReturnsAndRefundsScreen extends _i14.PageRouteInfo<void> {
  const ReturnsAndRefundsScreen()
      : super(ReturnsAndRefundsScreen.name, path: 'replacement');

  static const String name = 'ReturnsAndRefundsScreen';
}

/// generated route for
/// [_i35.PaymentScreen]
class PaymentScreen extends _i14.PageRouteInfo<void> {
  const PaymentScreen() : super(PaymentScreen.name, path: 'payment');

  static const String name = 'PaymentScreen';
}

/// generated route for
/// [_i36.LegalNoticeScreen]
class LegalNoticeScreen extends _i14.PageRouteInfo<void> {
  const LegalNoticeScreen()
      : super(LegalNoticeScreen.name, path: 'legal-notice');

  static const String name = 'LegalNoticeScreen';
}

/// generated route for
/// [_i37.RightsOfWithdrawalScreen]
class RightsOfWithdrawalScreen extends _i14.PageRouteInfo<void> {
  const RightsOfWithdrawalScreen()
      : super(RightsOfWithdrawalScreen.name, path: 'right-of-withdrawal');

  static const String name = 'RightsOfWithdrawalScreen';
}

/// generated route for
/// [_i38.PrivacyScreen]
class PrivacyScreen extends _i14.PageRouteInfo<void> {
  const PrivacyScreen() : super(PrivacyScreen.name, path: 'privacy-policy');

  static const String name = 'PrivacyScreen';
}

/// generated route for
/// [_i39.TermsAndConditionsScreen]
class TermsAndConditionsScreen extends _i14.PageRouteInfo<void> {
  const TermsAndConditionsScreen()
      : super(TermsAndConditionsScreen.name, path: 'terms');

  static const String name = 'TermsAndConditionsScreen';
}

/// generated route for
/// [_i40.DeliveryScreen]
class DeliveryScreen extends _i14.PageRouteInfo<void> {
  const DeliveryScreen() : super(DeliveryScreen.name, path: 'delivery');

  static const String name = 'DeliveryScreen';
}

/// generated route for
/// [_i41.SupportScreen]
class SupportScreen extends _i14.PageRouteInfo<void> {
  const SupportScreen() : super(SupportScreen.name, path: 'support');

  static const String name = 'SupportScreen';
}

/// generated route for
/// [_i42.SubmitARequest]
class SubmitRequestRouter extends _i14.PageRouteInfo<void> {
  const SubmitRequestRouter()
      : super(SubmitRequestRouter.name, path: 'submit-request');

  static const String name = 'SubmitRequestRouter';
}

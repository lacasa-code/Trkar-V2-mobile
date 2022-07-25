// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i50;

import '../../about/view/about_screen.dart' as _i36;
import '../../Addresses/view/add_new_address_screen.dart' as _i35;
import '../../Addresses/view/addresses_screen.dart' as _i34;
import '../../auth/view/choose_user_type_screen.dart' as _i8;
import '../../auth/view/email_verification_screen.dart' as _i9;
import '../../auth/view/forget_password_screen.dart' as _i11;
import '../../auth/view/forget_password_verification_screen.dart' as _i12;
import '../../auth/view/login_screen.dart' as _i7;
import '../../auth/view/phone_verification_screen.dart' as _i10;
import '../../auth/view/register_screen.dart' as _i14;
import '../../auth/view/reset_password_screen.dart' as _i13;
import '../../brakes/view/brakes_screen.dart' as _i31;
import '../../carAccessories/view/car_accessories_screen.dart' as _i24;
import '../../cart/view/cart_screen.dart' as _i20;
import '../../categories/carMades/view/all_car_mades_screen.dart' as _i26;
import '../../categories/manufacturers/view/all_manufacturers_screen.dart'
    as _i27;
import '../../categories/view/categories_screen.dart' as _i21;
import '../../categories/view/sub_categories_screen.dart' as _i22;
import '../../categories/view/sub_sub_category_screen.dart' as _i23;
import '../../categories/viewModel/subCategories/sub_categories_cubit.dart'
    as _i51;
import '../../delivery/view/delivery_screen.dart' as _i43;
import '../../engineOil/view/engine_oil_screen.dart' as _i28;
import '../../favorites/view/favorites_screen.dart' as _i19;
import '../../filters/view/filters_screen.dart' as _i25;
import '../../home/view/home_screen.dart' as _i17;
import '../../legalNotice/view/legal_notice_screen.dart' as _i39;
import '../../localization/view/change_language_screen.dart' as _i33;
import '../../mainScreen/tab_page.dart' as _i6;
import '../../order/view/order_history_screen.dart' as _i49;
import '../../payment/view/payment_screen.dart' as _i38;
import '../../paymentMethods/view/choose_type_screen.dart' as _i48;
import '../../paymentMethods/view/create_new_payment_method_screen.dart'
    as _i47;
import '../../paymentMethods/view/payment_method_screen.dart' as _i46;
import '../../privacy/view/privacy_screen.dart' as _i41;
import '../../profile/view/edit_profile_screen.dart' as _i15;
import '../../profile/view/profile_screen.dart' as _i32;
import '../../returns/view/returns_refunds_screen.dart' as _i37;
import '../../rightOfWithDrawal/view/rights_of_withdrawal.dart' as _i40;
import '../../splash/view/splash_screen.dart' as _i1;
import '../../support/view/submit_a_request.dart' as _i45;
import '../../support/view/support_screen.dart' as _i44;
import '../../terms/view/terms_screen.dart' as _i42;
import '../../tools/view/tools_screen.dart' as _i30;
import '../../tyres/view/tyres_screen.dart' as _i29;
import '../../vendor/createProduct/view/create_product_screen.dart' as _i16;
import '../../vendor/dashboard/view/seller_dashboard.dart' as _i4;
import '../../vendor/home/view/vendor_home_screen.dart' as _i3;
import '../../vendor/products/view/my_products_screen.dart' as _i5;
import '../../vendor/resumeData/view/resume_data_screen.dart' as _i2;

class AppRouter extends _i18.RootStackRouter {
  AppRouter([_i50.GlobalKey<_i50.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    ResumeDataRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i2.ResumeDataScreen()));
    },
    VendorHomeRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i3.VendorHomeScreen()));
    },
    SellerDashboardRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SellerDashboard());
    },
    MyProductsRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.MyProductScreen());
    },
    TabRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i6.TabPage()));
    },
    LoginRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i7.LoginScreen()));
    },
    ChooseTypeRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ChooseUserTypeScreen());
    },
    EmailVerificationRouter.name: (routeData) {
      final args = routeData.argsAs<EmailVerificationRouterArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i9.EmailVerificationScreen(
                  key: args.key,
                  email: args.email,
                  stateOfVerification: args.stateOfVerification,
                  resendCode: args.resendCode)));
    },
    PhoneVerificationRouter.name: (routeData) {
      final args = routeData.argsAs<PhoneVerificationRouterArgs>(
          orElse: () => const PhoneVerificationRouterArgs());
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i10.PhoneVerificationScreen(
                  key: args.key,
                  stateOfVerification: args.stateOfVerification,
                  phoneNumber: args.phoneNumber)));
    },
    ForgetPasswordRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i11.ForgetPasswordScreen()));
    },
    ForgetPasswordVerificationRouter.name: (routeData) {
      final args = routeData.argsAs<ForgetPasswordVerificationRouterArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i12.ForgetPasswordVerificationScreen(
                  key: args.key,
                  email: args.email,
                  stateOfVerification: args.stateOfVerification)));
    },
    ResetPasswordRouter.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouterArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i13.ResetPasswordScreen(
                  key: args.key, emailAddress: args.emailAddress)));
    },
    RegisterRouter.name: (routeData) {
      final args = routeData.argsAs<RegisterRouterArgs>(
          orElse: () => const RegisterRouterArgs());
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child:
                  _i14.RegisterScreen(key: args.key, userType: args.userType)));
    },
    EditProfileRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i15.EditProfileScreen()));
    },
    CreateProductRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i16.CreateProductView()));
    },
    HomeRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.HomeScreen());
    },
    CategoriesRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.EmptyRouterPage());
    },
    FavoritesRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.FavoritesScreen());
    },
    CartRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.CartScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.EmptyRouterPage());
    },
    CategoriesScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.CategoriesScreen());
    },
    SubCategoriesScreen.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SubCategoriesScreenArgs>(
          orElse: () => SubCategoriesScreenArgs(
              categoryId: pathParams.optString('categoryId')));
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i22.SubCategoriesScreen(
                  key: args.key,
                  categoryName: args.categoryName,
                  parentId: args.parentId,
                  categoryId: args.categoryId)));
    },
    SubSubCategoriesRouter.name: (routeData) {
      final args = routeData.argsAs<SubSubCategoriesRouterArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i23.SubSubCategoriesScreen(
                  key: args.key, subCategoriesCubit: args.subCategoriesCubit)));
    },
    CarAccessoriesScreen.name: (routeData) {
      final args = routeData.argsAs<CarAccessoriesScreenArgs>(
          orElse: () => const CarAccessoriesScreenArgs());
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i24.CarAccessoriesScreen(
                  key: args.key, name: args.name, parentId: args.parentId)));
    },
    FilterRouter.name: (routeData) {
      final args = routeData.argsAs<FilterRouterArgs>(
          orElse: () => const FilterRouterArgs());
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i25.FiltersScreen(
                  key: args.key,
                  categoryName: args.categoryName,
                  parentId: args.parentId)));
    },
    AllCarMadesScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.AllCarMadesScreen());
    },
    AllManufacturersScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.AllManufacturersScreen());
    },
    EngineOilScreen.name: (routeData) {
      final args = routeData.argsAs<EngineOilScreenArgs>(
          orElse: () => const EngineOilScreenArgs());
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i28.EngineOilScreen(
                  key: args.key, categoryId: args.categoryId)));
    },
    TyresScreen.name: (routeData) {
      final args = routeData.argsAs<TyresScreenArgs>(
          orElse: () => const TyresScreenArgs());
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i29.TyresScreen(key: args.key, tabIndex: args.tabIndex)));
    },
    ToolsScreen.name: (routeData) {
      final args = routeData.argsAs<ToolsScreenArgs>(
          orElse: () => const ToolsScreenArgs());
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i30.ToolsScreen(
                  key: args.key, categoryId: args.categoryId)));
    },
    BrakesRouter.name: (routeData) {
      final args = routeData.argsAs<BrakesRouterArgs>(
          orElse: () => const BrakesRouterArgs());
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(
              child: _i31.BrakesScreen(
                  key: args.key,
                  categoryName: args.categoryName,
                  parentId: args.parentId)));
    },
    ProfileScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i32.ProfileScreen());
    },
    ChangeLanguageScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i33.ChangeLanguageScreen()));
    },
    AddressesScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i34.AddressesScreen());
    },
    AddNewAddressScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i35.AddNewAddressScreen()));
    },
    EditProfileScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i15.EditProfileScreen()));
    },
    AboutUsRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i36.AboutScreen());
    },
    ReturnsAndRefundsScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i37.ReturnsAndRefundsScreen());
    },
    PaymentScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i38.PaymentScreen());
    },
    LegalNoticeScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i39.LegalNoticeScreen());
    },
    RightsOfWithdrawalScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i40.RightsOfWithdrawalScreen());
    },
    PrivacyScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i41.PrivacyScreen());
    },
    TermsAndConditionsScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i42.TermsAndConditionsScreen());
    },
    DeliveryScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i43.DeliveryScreen());
    },
    SupportScreen.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.WrappedRoute(child: const _i44.SupportScreen()));
    },
    SubmitRequestRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i45.SubmitARequest());
    },
    PaymentMethodRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i46.PaymentMethodScreen());
    },
    CreateNewPaymentMethodRouter.name: (routeData) {
      final args = routeData.argsAs<CreateNewPaymentMethodRouterArgs>(
          orElse: () => const CreateNewPaymentMethodRouterArgs());
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i47.CreateNewPaymentMethodScreen(
              key: args.key, isEdit: args.isEdit));
    },
    ChooseCardTypeRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i48.ChooseCardTypeScreen());
    },
    OrderHistoryRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i49.OrdersHistoryScreen());
    }
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(SplashRouter.name, path: '/'),
        _i18.RouteConfig(ResumeDataRouter.name, path: 'resume-data'),
        _i18.RouteConfig(VendorHomeRouter.name, path: 'vendor-home'),
        _i18.RouteConfig(SellerDashboardRouter.name, path: 'seller-dashboard'),
        _i18.RouteConfig(MyProductsRouter.name, path: 'my-products'),
        _i18.RouteConfig(TabRoute.name, path: 'tabs', children: [
          _i18.RouteConfig(HomeRouter.name,
              path: 'home', parent: TabRoute.name),
          _i18.RouteConfig(CategoriesRouter.name,
              path: 'categories',
              parent: TabRoute.name,
              children: [
                _i18.RouteConfig(CategoriesScreen.name,
                    path: '', parent: CategoriesRouter.name),
                _i18.RouteConfig(SubCategoriesScreen.name,
                    path: ':categoryId', parent: CategoriesRouter.name),
                _i18.RouteConfig(SubSubCategoriesRouter.name,
                    path: 'sub-sub-categories', parent: CategoriesRouter.name),
                _i18.RouteConfig(CarAccessoriesScreen.name,
                    path: 'car-accessories', parent: CategoriesRouter.name),
                _i18.RouteConfig(FilterRouter.name,
                    path: 'car-filters', parent: CategoriesRouter.name),
                _i18.RouteConfig(AllCarMadesScreen.name,
                    path: 'all-car-mades', parent: CategoriesRouter.name),
                _i18.RouteConfig(AllManufacturersScreen.name,
                    path: 'all-manufacturers', parent: CategoriesRouter.name),
                _i18.RouteConfig(EngineOilScreen.name,
                    path: 'engine-oil', parent: CategoriesRouter.name),
                _i18.RouteConfig(TyresScreen.name,
                    path: 'tyres', parent: CategoriesRouter.name),
                _i18.RouteConfig(ToolsScreen.name,
                    path: 'tools', parent: CategoriesRouter.name),
                _i18.RouteConfig(BrakesRouter.name,
                    path: 'brakes', parent: CategoriesRouter.name)
              ]),
          _i18.RouteConfig(FavoritesRouter.name,
              path: 'favorites', parent: TabRoute.name),
          _i18.RouteConfig(CartRouter.name,
              path: 'cart', parent: TabRoute.name),
          _i18.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: TabRoute.name,
              children: [
                _i18.RouteConfig(ProfileScreen.name,
                    path: '', parent: ProfileRouter.name),
                _i18.RouteConfig(ChangeLanguageScreen.name,
                    path: 'language', parent: ProfileRouter.name),
                _i18.RouteConfig(AddressesScreen.name,
                    path: 'addresses', parent: ProfileRouter.name),
                _i18.RouteConfig(AddNewAddressScreen.name,
                    path: 'modify-address', parent: ProfileRouter.name),
                _i18.RouteConfig(EditProfileScreen.name,
                    path: 'edit-profile', parent: ProfileRouter.name),
                _i18.RouteConfig(AboutUsRouter.name,
                    path: 'about-us', parent: ProfileRouter.name),
                _i18.RouteConfig(ReturnsAndRefundsScreen.name,
                    path: 'replacement', parent: ProfileRouter.name),
                _i18.RouteConfig(PaymentScreen.name,
                    path: 'payment', parent: ProfileRouter.name),
                _i18.RouteConfig(LegalNoticeScreen.name,
                    path: 'legal-notice', parent: ProfileRouter.name),
                _i18.RouteConfig(RightsOfWithdrawalScreen.name,
                    path: 'right-of-withdrawal', parent: ProfileRouter.name),
                _i18.RouteConfig(PrivacyScreen.name,
                    path: 'privacy-policy', parent: ProfileRouter.name),
                _i18.RouteConfig(TermsAndConditionsScreen.name,
                    path: 'terms', parent: ProfileRouter.name),
                _i18.RouteConfig(DeliveryScreen.name,
                    path: 'delivery', parent: ProfileRouter.name),
                _i18.RouteConfig(SupportScreen.name,
                    path: 'support', parent: ProfileRouter.name),
                _i18.RouteConfig(SubmitRequestRouter.name,
                    path: 'submit-request', parent: ProfileRouter.name),
                _i18.RouteConfig(PaymentMethodRouter.name,
                    path: 'payment-method', parent: ProfileRouter.name),
                _i18.RouteConfig(CreateNewPaymentMethodRouter.name,
                    path: 'create-new-payment-method',
                    parent: ProfileRouter.name),
                _i18.RouteConfig(ChooseCardTypeRouter.name,
                    path: 'choose-card-type', parent: ProfileRouter.name),
                _i18.RouteConfig(OrderHistoryRouter.name,
                    path: 'order-history', parent: ProfileRouter.name)
              ])
        ]),
        _i18.RouteConfig(LoginRouter.name, path: 'login'),
        _i18.RouteConfig(ChooseTypeRouter.name, path: 'choose_type'),
        _i18.RouteConfig(EmailVerificationRouter.name,
            path: 'email_verification'),
        _i18.RouteConfig(PhoneVerificationRouter.name,
            path: 'phone_verification'),
        _i18.RouteConfig(ForgetPasswordRouter.name, path: 'forget_password'),
        _i18.RouteConfig(ForgetPasswordVerificationRouter.name,
            path: 'forget_password_verification'),
        _i18.RouteConfig(ResetPasswordRouter.name, path: 'reset_password'),
        _i18.RouteConfig(RegisterRouter.name, path: 'register'),
        _i18.RouteConfig(EditProfileRouter.name, path: 'vendor-edit-profile'),
        _i18.RouteConfig(CreateProductRouter.name,
            path: 'vendor-create-product')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRouter extends _i18.PageRouteInfo<void> {
  const SplashRouter() : super(SplashRouter.name, path: '/');

  static const String name = 'SplashRouter';
}

/// generated route for
/// [_i2.ResumeDataScreen]
class ResumeDataRouter extends _i18.PageRouteInfo<void> {
  const ResumeDataRouter() : super(ResumeDataRouter.name, path: 'resume-data');

  static const String name = 'ResumeDataRouter';
}

/// generated route for
/// [_i3.VendorHomeScreen]
class VendorHomeRouter extends _i18.PageRouteInfo<void> {
  const VendorHomeRouter() : super(VendorHomeRouter.name, path: 'vendor-home');

  static const String name = 'VendorHomeRouter';
}

/// generated route for
/// [_i4.SellerDashboard]
class SellerDashboardRouter extends _i18.PageRouteInfo<void> {
  const SellerDashboardRouter()
      : super(SellerDashboardRouter.name, path: 'seller-dashboard');

  static const String name = 'SellerDashboardRouter';
}

/// generated route for
/// [_i5.MyProductScreen]
class MyProductsRouter extends _i18.PageRouteInfo<void> {
  const MyProductsRouter() : super(MyProductsRouter.name, path: 'my-products');

  static const String name = 'MyProductsRouter';
}

/// generated route for
/// [_i6.TabPage]
class TabRoute extends _i18.PageRouteInfo<void> {
  const TabRoute({List<_i18.PageRouteInfo>? children})
      : super(TabRoute.name, path: 'tabs', initialChildren: children);

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRouter extends _i18.PageRouteInfo<void> {
  const LoginRouter() : super(LoginRouter.name, path: 'login');

  static const String name = 'LoginRouter';
}

/// generated route for
/// [_i8.ChooseUserTypeScreen]
class ChooseTypeRouter extends _i18.PageRouteInfo<void> {
  const ChooseTypeRouter() : super(ChooseTypeRouter.name, path: 'choose_type');

  static const String name = 'ChooseTypeRouter';
}

/// generated route for
/// [_i9.EmailVerificationScreen]
class EmailVerificationRouter
    extends _i18.PageRouteInfo<EmailVerificationRouterArgs> {
  EmailVerificationRouter(
      {_i50.Key? key,
      required String email,
      int? stateOfVerification,
      bool resendCode = false})
      : super(EmailVerificationRouter.name,
            path: 'email_verification',
            args: EmailVerificationRouterArgs(
                key: key,
                email: email,
                stateOfVerification: stateOfVerification,
                resendCode: resendCode));

  static const String name = 'EmailVerificationRouter';
}

class EmailVerificationRouterArgs {
  const EmailVerificationRouterArgs(
      {this.key,
      required this.email,
      this.stateOfVerification,
      this.resendCode = false});

  final _i50.Key? key;

  final String email;

  final int? stateOfVerification;

  final bool resendCode;

  @override
  String toString() {
    return 'EmailVerificationRouterArgs{key: $key, email: $email, stateOfVerification: $stateOfVerification, resendCode: $resendCode}';
  }
}

/// generated route for
/// [_i10.PhoneVerificationScreen]
class PhoneVerificationRouter
    extends _i18.PageRouteInfo<PhoneVerificationRouterArgs> {
  PhoneVerificationRouter(
      {_i50.Key? key, int stateOfVerification = 0, String? phoneNumber})
      : super(PhoneVerificationRouter.name,
            path: 'phone_verification',
            args: PhoneVerificationRouterArgs(
                key: key,
                stateOfVerification: stateOfVerification,
                phoneNumber: phoneNumber));

  static const String name = 'PhoneVerificationRouter';
}

class PhoneVerificationRouterArgs {
  const PhoneVerificationRouterArgs(
      {this.key, this.stateOfVerification = 0, this.phoneNumber});

  final _i50.Key? key;

  final int stateOfVerification;

  final String? phoneNumber;

  @override
  String toString() {
    return 'PhoneVerificationRouterArgs{key: $key, stateOfVerification: $stateOfVerification, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i11.ForgetPasswordScreen]
class ForgetPasswordRouter extends _i18.PageRouteInfo<void> {
  const ForgetPasswordRouter()
      : super(ForgetPasswordRouter.name, path: 'forget_password');

  static const String name = 'ForgetPasswordRouter';
}

/// generated route for
/// [_i12.ForgetPasswordVerificationScreen]
class ForgetPasswordVerificationRouter
    extends _i18.PageRouteInfo<ForgetPasswordVerificationRouterArgs> {
  ForgetPasswordVerificationRouter(
      {_i50.Key? key, required String email, int? stateOfVerification})
      : super(ForgetPasswordVerificationRouter.name,
            path: 'forget_password_verification',
            args: ForgetPasswordVerificationRouterArgs(
                key: key,
                email: email,
                stateOfVerification: stateOfVerification));

  static const String name = 'ForgetPasswordVerificationRouter';
}

class ForgetPasswordVerificationRouterArgs {
  const ForgetPasswordVerificationRouterArgs(
      {this.key, required this.email, this.stateOfVerification});

  final _i50.Key? key;

  final String email;

  final int? stateOfVerification;

  @override
  String toString() {
    return 'ForgetPasswordVerificationRouterArgs{key: $key, email: $email, stateOfVerification: $stateOfVerification}';
  }
}

/// generated route for
/// [_i13.ResetPasswordScreen]
class ResetPasswordRouter extends _i18.PageRouteInfo<ResetPasswordRouterArgs> {
  ResetPasswordRouter({_i50.Key? key, required String emailAddress})
      : super(ResetPasswordRouter.name,
            path: 'reset_password',
            args:
                ResetPasswordRouterArgs(key: key, emailAddress: emailAddress));

  static const String name = 'ResetPasswordRouter';
}

class ResetPasswordRouterArgs {
  const ResetPasswordRouterArgs({this.key, required this.emailAddress});

  final _i50.Key? key;

  final String emailAddress;

  @override
  String toString() {
    return 'ResetPasswordRouterArgs{key: $key, emailAddress: $emailAddress}';
  }
}

/// generated route for
/// [_i14.RegisterScreen]
class RegisterRouter extends _i18.PageRouteInfo<RegisterRouterArgs> {
  RegisterRouter({_i50.Key? key, int? userType})
      : super(RegisterRouter.name,
            path: 'register',
            args: RegisterRouterArgs(key: key, userType: userType));

  static const String name = 'RegisterRouter';
}

class RegisterRouterArgs {
  const RegisterRouterArgs({this.key, this.userType});

  final _i50.Key? key;

  final int? userType;

  @override
  String toString() {
    return 'RegisterRouterArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i15.EditProfileScreen]
class EditProfileRouter extends _i18.PageRouteInfo<void> {
  const EditProfileRouter()
      : super(EditProfileRouter.name, path: 'vendor-edit-profile');

  static const String name = 'EditProfileRouter';
}

/// generated route for
/// [_i16.CreateProductView]
class CreateProductRouter extends _i18.PageRouteInfo<void> {
  const CreateProductRouter()
      : super(CreateProductRouter.name, path: 'vendor-create-product');

  static const String name = 'CreateProductRouter';
}

/// generated route for
/// [_i17.HomeScreen]
class HomeRouter extends _i18.PageRouteInfo<void> {
  const HomeRouter() : super(HomeRouter.name, path: 'home');

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i18.EmptyRouterPage]
class CategoriesRouter extends _i18.PageRouteInfo<void> {
  const CategoriesRouter({List<_i18.PageRouteInfo>? children})
      : super(CategoriesRouter.name,
            path: 'categories', initialChildren: children);

  static const String name = 'CategoriesRouter';
}

/// generated route for
/// [_i19.FavoritesScreen]
class FavoritesRouter extends _i18.PageRouteInfo<void> {
  const FavoritesRouter() : super(FavoritesRouter.name, path: 'favorites');

  static const String name = 'FavoritesRouter';
}

/// generated route for
/// [_i20.CartScreen]
class CartRouter extends _i18.PageRouteInfo<void> {
  const CartRouter() : super(CartRouter.name, path: 'cart');

  static const String name = 'CartRouter';
}

/// generated route for
/// [_i18.EmptyRouterPage]
class ProfileRouter extends _i18.PageRouteInfo<void> {
  const ProfileRouter({List<_i18.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i21.CategoriesScreen]
class CategoriesScreen extends _i18.PageRouteInfo<void> {
  const CategoriesScreen() : super(CategoriesScreen.name, path: '');

  static const String name = 'CategoriesScreen';
}

/// generated route for
/// [_i22.SubCategoriesScreen]
class SubCategoriesScreen extends _i18.PageRouteInfo<SubCategoriesScreenArgs> {
  SubCategoriesScreen(
      {_i50.Key? key,
      String? categoryName,
      String? parentId,
      String? categoryId})
      : super(SubCategoriesScreen.name,
            path: ':categoryId',
            args: SubCategoriesScreenArgs(
                key: key,
                categoryName: categoryName,
                parentId: parentId,
                categoryId: categoryId),
            rawPathParams: {'categoryId': categoryId});

  static const String name = 'SubCategoriesScreen';
}

class SubCategoriesScreenArgs {
  const SubCategoriesScreenArgs(
      {this.key, this.categoryName, this.parentId, this.categoryId});

  final _i50.Key? key;

  final String? categoryName;

  final String? parentId;

  final String? categoryId;

  @override
  String toString() {
    return 'SubCategoriesScreenArgs{key: $key, categoryName: $categoryName, parentId: $parentId, categoryId: $categoryId}';
  }
}

/// generated route for
/// [_i23.SubSubCategoriesScreen]
class SubSubCategoriesRouter
    extends _i18.PageRouteInfo<SubSubCategoriesRouterArgs> {
  SubSubCategoriesRouter(
      {_i50.Key? key, required _i51.SubCategoriesCubit subCategoriesCubit})
      : super(SubSubCategoriesRouter.name,
            path: 'sub-sub-categories',
            args: SubSubCategoriesRouterArgs(
                key: key, subCategoriesCubit: subCategoriesCubit));

  static const String name = 'SubSubCategoriesRouter';
}

class SubSubCategoriesRouterArgs {
  const SubSubCategoriesRouterArgs(
      {this.key, required this.subCategoriesCubit});

  final _i50.Key? key;

  final _i51.SubCategoriesCubit subCategoriesCubit;

  @override
  String toString() {
    return 'SubSubCategoriesRouterArgs{key: $key, subCategoriesCubit: $subCategoriesCubit}';
  }
}

/// generated route for
/// [_i24.CarAccessoriesScreen]
class CarAccessoriesScreen
    extends _i18.PageRouteInfo<CarAccessoriesScreenArgs> {
  CarAccessoriesScreen({_i50.Key? key, String? name, String? parentId})
      : super(CarAccessoriesScreen.name,
            path: 'car-accessories',
            args: CarAccessoriesScreenArgs(
                key: key, name: name, parentId: parentId));

  static const String name = 'CarAccessoriesScreen';
}

class CarAccessoriesScreenArgs {
  const CarAccessoriesScreenArgs({this.key, this.name, this.parentId});

  final _i50.Key? key;

  final String? name;

  final String? parentId;

  @override
  String toString() {
    return 'CarAccessoriesScreenArgs{key: $key, name: $name, parentId: $parentId}';
  }
}

/// generated route for
/// [_i25.FiltersScreen]
class FilterRouter extends _i18.PageRouteInfo<FilterRouterArgs> {
  FilterRouter({_i50.Key? key, String? categoryName, String? parentId})
      : super(FilterRouter.name,
            path: 'car-filters',
            args: FilterRouterArgs(
                key: key, categoryName: categoryName, parentId: parentId));

  static const String name = 'FilterRouter';
}

class FilterRouterArgs {
  const FilterRouterArgs({this.key, this.categoryName, this.parentId});

  final _i50.Key? key;

  final String? categoryName;

  final String? parentId;

  @override
  String toString() {
    return 'FilterRouterArgs{key: $key, categoryName: $categoryName, parentId: $parentId}';
  }
}

/// generated route for
/// [_i26.AllCarMadesScreen]
class AllCarMadesScreen extends _i18.PageRouteInfo<void> {
  const AllCarMadesScreen()
      : super(AllCarMadesScreen.name, path: 'all-car-mades');

  static const String name = 'AllCarMadesScreen';
}

/// generated route for
/// [_i27.AllManufacturersScreen]
class AllManufacturersScreen extends _i18.PageRouteInfo<void> {
  const AllManufacturersScreen()
      : super(AllManufacturersScreen.name, path: 'all-manufacturers');

  static const String name = 'AllManufacturersScreen';
}

/// generated route for
/// [_i28.EngineOilScreen]
class EngineOilScreen extends _i18.PageRouteInfo<EngineOilScreenArgs> {
  EngineOilScreen({_i50.Key? key, String? categoryId})
      : super(EngineOilScreen.name,
            path: 'engine-oil',
            args: EngineOilScreenArgs(key: key, categoryId: categoryId));

  static const String name = 'EngineOilScreen';
}

class EngineOilScreenArgs {
  const EngineOilScreenArgs({this.key, this.categoryId});

  final _i50.Key? key;

  final String? categoryId;

  @override
  String toString() {
    return 'EngineOilScreenArgs{key: $key, categoryId: $categoryId}';
  }
}

/// generated route for
/// [_i29.TyresScreen]
class TyresScreen extends _i18.PageRouteInfo<TyresScreenArgs> {
  TyresScreen({_i50.Key? key, int? tabIndex})
      : super(TyresScreen.name,
            path: 'tyres', args: TyresScreenArgs(key: key, tabIndex: tabIndex));

  static const String name = 'TyresScreen';
}

class TyresScreenArgs {
  const TyresScreenArgs({this.key, this.tabIndex});

  final _i50.Key? key;

  final int? tabIndex;

  @override
  String toString() {
    return 'TyresScreenArgs{key: $key, tabIndex: $tabIndex}';
  }
}

/// generated route for
/// [_i30.ToolsScreen]
class ToolsScreen extends _i18.PageRouteInfo<ToolsScreenArgs> {
  ToolsScreen({_i50.Key? key, String? categoryId})
      : super(ToolsScreen.name,
            path: 'tools',
            args: ToolsScreenArgs(key: key, categoryId: categoryId));

  static const String name = 'ToolsScreen';
}

class ToolsScreenArgs {
  const ToolsScreenArgs({this.key, this.categoryId});

  final _i50.Key? key;

  final String? categoryId;

  @override
  String toString() {
    return 'ToolsScreenArgs{key: $key, categoryId: $categoryId}';
  }
}

/// generated route for
/// [_i31.BrakesScreen]
class BrakesRouter extends _i18.PageRouteInfo<BrakesRouterArgs> {
  BrakesRouter({_i50.Key? key, String? categoryName, String? parentId})
      : super(BrakesRouter.name,
            path: 'brakes',
            args: BrakesRouterArgs(
                key: key, categoryName: categoryName, parentId: parentId));

  static const String name = 'BrakesRouter';
}

class BrakesRouterArgs {
  const BrakesRouterArgs({this.key, this.categoryName, this.parentId});

  final _i50.Key? key;

  final String? categoryName;

  final String? parentId;

  @override
  String toString() {
    return 'BrakesRouterArgs{key: $key, categoryName: $categoryName, parentId: $parentId}';
  }
}

/// generated route for
/// [_i32.ProfileScreen]
class ProfileScreen extends _i18.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i33.ChangeLanguageScreen]
class ChangeLanguageScreen extends _i18.PageRouteInfo<void> {
  const ChangeLanguageScreen()
      : super(ChangeLanguageScreen.name, path: 'language');

  static const String name = 'ChangeLanguageScreen';
}

/// generated route for
/// [_i34.AddressesScreen]
class AddressesScreen extends _i18.PageRouteInfo<void> {
  const AddressesScreen() : super(AddressesScreen.name, path: 'addresses');

  static const String name = 'AddressesScreen';
}

/// generated route for
/// [_i35.AddNewAddressScreen]
class AddNewAddressScreen extends _i18.PageRouteInfo<void> {
  const AddNewAddressScreen()
      : super(AddNewAddressScreen.name, path: 'modify-address');

  static const String name = 'AddNewAddressScreen';
}

/// generated route for
/// [_i15.EditProfileScreen]
class EditProfileScreen extends _i18.PageRouteInfo<void> {
  const EditProfileScreen()
      : super(EditProfileScreen.name, path: 'edit-profile');

  static const String name = 'EditProfileScreen';
}

/// generated route for
/// [_i36.AboutScreen]
class AboutUsRouter extends _i18.PageRouteInfo<void> {
  const AboutUsRouter() : super(AboutUsRouter.name, path: 'about-us');

  static const String name = 'AboutUsRouter';
}

/// generated route for
/// [_i37.ReturnsAndRefundsScreen]
class ReturnsAndRefundsScreen extends _i18.PageRouteInfo<void> {
  const ReturnsAndRefundsScreen()
      : super(ReturnsAndRefundsScreen.name, path: 'replacement');

  static const String name = 'ReturnsAndRefundsScreen';
}

/// generated route for
/// [_i38.PaymentScreen]
class PaymentScreen extends _i18.PageRouteInfo<void> {
  const PaymentScreen() : super(PaymentScreen.name, path: 'payment');

  static const String name = 'PaymentScreen';
}

/// generated route for
/// [_i39.LegalNoticeScreen]
class LegalNoticeScreen extends _i18.PageRouteInfo<void> {
  const LegalNoticeScreen()
      : super(LegalNoticeScreen.name, path: 'legal-notice');

  static const String name = 'LegalNoticeScreen';
}

/// generated route for
/// [_i40.RightsOfWithdrawalScreen]
class RightsOfWithdrawalScreen extends _i18.PageRouteInfo<void> {
  const RightsOfWithdrawalScreen()
      : super(RightsOfWithdrawalScreen.name, path: 'right-of-withdrawal');

  static const String name = 'RightsOfWithdrawalScreen';
}

/// generated route for
/// [_i41.PrivacyScreen]
class PrivacyScreen extends _i18.PageRouteInfo<void> {
  const PrivacyScreen() : super(PrivacyScreen.name, path: 'privacy-policy');

  static const String name = 'PrivacyScreen';
}

/// generated route for
/// [_i42.TermsAndConditionsScreen]
class TermsAndConditionsScreen extends _i18.PageRouteInfo<void> {
  const TermsAndConditionsScreen()
      : super(TermsAndConditionsScreen.name, path: 'terms');

  static const String name = 'TermsAndConditionsScreen';
}

/// generated route for
/// [_i43.DeliveryScreen]
class DeliveryScreen extends _i18.PageRouteInfo<void> {
  const DeliveryScreen() : super(DeliveryScreen.name, path: 'delivery');

  static const String name = 'DeliveryScreen';
}

/// generated route for
/// [_i44.SupportScreen]
class SupportScreen extends _i18.PageRouteInfo<void> {
  const SupportScreen() : super(SupportScreen.name, path: 'support');

  static const String name = 'SupportScreen';
}

/// generated route for
/// [_i45.SubmitARequest]
class SubmitRequestRouter extends _i18.PageRouteInfo<void> {
  const SubmitRequestRouter()
      : super(SubmitRequestRouter.name, path: 'submit-request');

  static const String name = 'SubmitRequestRouter';
}

/// generated route for
/// [_i46.PaymentMethodScreen]
class PaymentMethodRouter extends _i18.PageRouteInfo<void> {
  const PaymentMethodRouter()
      : super(PaymentMethodRouter.name, path: 'payment-method');

  static const String name = 'PaymentMethodRouter';
}

/// generated route for
/// [_i47.CreateNewPaymentMethodScreen]
class CreateNewPaymentMethodRouter
    extends _i18.PageRouteInfo<CreateNewPaymentMethodRouterArgs> {
  CreateNewPaymentMethodRouter({_i50.Key? key, bool isEdit = false})
      : super(CreateNewPaymentMethodRouter.name,
            path: 'create-new-payment-method',
            args: CreateNewPaymentMethodRouterArgs(key: key, isEdit: isEdit));

  static const String name = 'CreateNewPaymentMethodRouter';
}

class CreateNewPaymentMethodRouterArgs {
  const CreateNewPaymentMethodRouterArgs({this.key, this.isEdit = false});

  final _i50.Key? key;

  final bool isEdit;

  @override
  String toString() {
    return 'CreateNewPaymentMethodRouterArgs{key: $key, isEdit: $isEdit}';
  }
}

/// generated route for
/// [_i48.ChooseCardTypeScreen]
class ChooseCardTypeRouter extends _i18.PageRouteInfo<void> {
  const ChooseCardTypeRouter()
      : super(ChooseCardTypeRouter.name, path: 'choose-card-type');

  static const String name = 'ChooseCardTypeRouter';
}

/// generated route for
/// [_i49.OrdersHistoryScreen]
class OrderHistoryRouter extends _i18.PageRouteInfo<void> {
  const OrderHistoryRouter()
      : super(OrderHistoryRouter.name, path: 'order-history');

  static const String name = 'OrderHistoryRouter';
}

import 'package:auto_route/auto_route.dart';
import 'package:trkar/Addresses/view/add_new_address_screen.dart';
import 'package:trkar/Addresses/view/addresses_screen.dart';
import 'package:trkar/about/view/about_screen.dart';
import 'package:trkar/auth/view/choose_user_type_screen.dart';
import 'package:trkar/auth/view/email_verfication_screen.dart';
import 'package:trkar/auth/view/forget_password_screen.dart';
import 'package:trkar/auth/view/login_screen.dart';
import 'package:trkar/auth/view/register_screen.dart';
import 'package:trkar/auth/view/reset_password_screen.dart';
import 'package:trkar/carAccessories/view/car_accessories_screen.dart';
import 'package:trkar/cart/view/cart_screen.dart';
import 'package:trkar/categories/carMades/view/all_car_mades_screen.dart';
import 'package:trkar/categories/manufacturers/view/all_manufacturers_screen.dart';
import 'package:trkar/categories/view/categories_screen.dart';
import 'package:trkar/categories/view/sub_categories_screen.dart';
import 'package:trkar/delivery/view/delivery_screen.dart';
import 'package:trkar/engineOil/view/engine_oil_screen.dart';
import 'package:trkar/favorites/view/favorites_screen.dart';
import 'package:trkar/filters/view/filters_screen.dart';
import 'package:trkar/home/view/home_screen.dart';
import 'package:trkar/legalNotice/view/legal_notice_screen.dart';
import 'package:trkar/localization/view/change_language_screen.dart';
import 'package:trkar/mainScreen/tab_page.dart';
import 'package:trkar/payment/view/payment_screen.dart';
import 'package:trkar/privacy/view/privacy_screen.dart';
import 'package:trkar/profile/view/edit_profile_screen.dart';
import 'package:trkar/profile/view/profile_screen.dart';
import 'package:trkar/returns/view/returns_refunds_screen.dart';
import 'package:trkar/rightOfWithDrawal/view/rights_of_withdrawal.dart';
import 'package:trkar/splash/view/splash_screen.dart';
import 'package:trkar/support/view/support_screen.dart';
import 'package:trkar/terms/view/terms_screen.dart';
import 'package:trkar/tools/view/tools_screen.dart';
import 'package:trkar/tyres/view/tyres_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      name: 'SplashRouter',
      page: SplashScreen,
    ),
    AutoRoute(
      path: 'tabs',
      page: TabPage,
      children: [
        AutoRoute(
          name: 'HomeRouter',
          page: HomeScreen,
          path: 'home',
        ),
        AutoRoute(
            name: 'CategoriesRouter',
            path: 'categories',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                page: CategoriesScreen,
              ),
              AutoRoute(
                path: ':categoryId',
                page: SubCategoriesScreen,
              ),
              AutoRoute(
                path: 'car-accessories',
                page: CarAccessoriesScreen,
              ),
              AutoRoute(
                path: 'car-filters',
                name: 'FilterRouter',
                page: FiltersScreen,
              ),
              AutoRoute(
                path: 'all-car-mades',
                page: AllCarMadesScreen,
              ),
              AutoRoute(
                path: 'all-manufacturers',
                page: AllManufacturersScreen,
              ),
              AutoRoute(
                path: 'engine-oil',
                page: EngineOilScreen,
              ),
              AutoRoute(
                path: 'tyres',
                page: TyresScreen,
              ),
              AutoRoute(
                path: 'tools',
                page: ToolsScreen,
              ),
            ]),
        AutoRoute(
          name: 'FavoritesRouter',
          path: 'favorites',
          page: FavoritesScreen,
        ),
        AutoRoute(
          name: 'CartRouter',
          path: 'cart',
          page: CartScreen,
        ),
        AutoRoute(
          name: 'ProfileRouter',
          path: 'profile',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: ProfileScreen,
            ),
            AutoRoute(
              path: 'language',
              page: ChangeLanguageScreen,
            ),
            AutoRoute(
              path: 'addresses',
              page: AddressesScreen,
            ),
            AutoRoute(
              path: 'modify-address',
              page: AddNewAddressScreen,
            ),
            AutoRoute(
              path: 'edit-profile',
              page: EditProfileScreen,
            ),
            AutoRoute(
              path: 'about',
              name: 'AboutRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  path: '',
                  page: AboutScreen,
                ),
                AutoRoute(
                  path: 'replacement',
                  page: ReturnsAndRefundsScreen,
                ),
                AutoRoute(
                  path: 'payment',
                  page: PaymentScreen,
                ),
                AutoRoute(
                  path: 'legal-notice',
                  page: LegalNoticeScreen,
                ),
                AutoRoute(
                  path: 'right-of-withdrawal',
                  page: RightsOfWithdrawalScreen,
                ),
                AutoRoute(
                  path: 'privacy-policy',
                  page: PrivacyScreen,
                ),
                AutoRoute(
                  path: 'terms',
                  page: TermsAndConitionsScreen,
                ),
                AutoRoute(
                  path: 'delivery',
                  page: DeliveryScreen,
                ),
              ],
            ),
            AutoRoute(
              path: 'support',
              page: SupportScreen,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: 'login',
      name: 'LoginRouter',
      page: LoginScreen,
    ),
    AutoRoute(
      path: 'choose_type',
      name: 'ChooseTypeRouter',
      page: ChooseUserTypeScreen,
    ),
    AutoRoute(
      path: 'email_verfication',
      name: 'EmailVerficationRouter',
      page: EmailVerficationScreen,
    ),
    AutoRoute(
      path: 'forget_password',
      name: 'ForgetPasswordRouter',
      page: ForgetPasswordScreen,
    ),
    AutoRoute(
      path: 'reset_password',
      name: 'ResetPasswordRouter',
      page: ResetPasswordScreen,
    ),
    AutoRoute(
      path: 'register',
      name: 'RegisterRouter',
      page: RegisterScreen,
    ),
  ],
)
class $AppRouter {}

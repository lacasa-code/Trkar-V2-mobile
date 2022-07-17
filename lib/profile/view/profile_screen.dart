import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/localization/view/widgets/change_language_dialog.dart';
import 'package:trkar/localization/viewModel/lang/lang_cubit.dart';
import '../../core/extensions/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/circle_widget.dart';
import '../../core/extensions/media_query.dart';
import 'package:trkar/auth/viewModel/logout/logout_cubit.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/profile/view/widgets/profile_header_item.dart';
import 'package:trkar/profile/view/widgets/profile_item.dart';
import 'package:trkar/profile/viewModel/userProfile/user_profile_cubit.dart';
import 'package:trkar/core/components/loader_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/my-profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserProfileCubit userProfileCubit;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    userProfileCubit = context.read<UserProfileCubit>()
      ..getUserProfile(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(Helper.currentUser?.accessToken ?? '');
    return Scaffold(
      key: scaffoldKey,
      appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          Positioned(
            top: ScreenUtil().setHeight(270),
            right: -ScreenUtil().setWidth(430),
            bottom: ScreenUtil().setHeight(145),
            left: 0,
            child: const CircleWidget(),
          ),
          Positioned(
            top: ScreenUtil().setHeight(379),
            left: -ScreenUtil().setWidth(410),
            bottom: ScreenUtil().setHeight(50),
            right: 0,
            child: const CircleWidget(),
          ),
          SizedBox(
            height: context.height,
            child: SingleChildScrollView(
              child: Column(
                children: !Helper.isLoggedIn
                    ? [
                        const VisitorProfileView(),
                      ]
                    : [
                        BlocBuilder<UserProfileCubit, UserProfileState>(
                          builder: (context, state) {
                            if (state is UserProfileLoading &&
                                userProfileCubit.profileData == null) {
                              return const LoaderWidget();
                            }
                            return ProfileHeaderItem(
                              userImage: userProfileCubit.profileData?.image,
                              userName: userProfileCubit.profileData?.username,
                              emailAddress: userProfileCubit.profileData?.email,
                            );
                          },
                        ),
                        const BoxHelper(
                          height: 15,
                        ),
                        ProfileItem(
                          onPressed: () {},
                          title: 'my_orders_history',
                          svgPictureName: 'my-orders-icon',
                        ),
                        ProfileItem(
                          onPressed: () {},
                          title: 'my_coupons',
                          svgPictureName: 'my-coupons-icon',
                        ),
                        ProfileItem(
                          onPressed: () {
                            context.router.push(
                              const PaymentMethodRouter(),
                            );
                          },
                          title: 'manage_payment',
                          svgPictureName: 'manage-payment-icon',
                        ),
                        ProfileItem(
                          onPressed: () {
                            context.router.push(
                              const AddressesScreen(),
                            );
                          },
                          title: 'addresses',
                          svgPictureName: 'address-icon',
                        ),
                        ProfileItem(
                          onPressed: () {
                            var langCubit = context.read<LangCubit>();
                            showDialog(
                              context: context,
                              builder: (_) => BlocBuilder<LangCubit, LangState>(
                                builder: (context, state) {
                                  return ChangeLanguageDialog(
                                      langCubit: langCubit);
                                },
                              ),
                            );
                          },
                          title: 'lang',
                          svgPictureName: 'language-icon',
                        ),

                        // ProfileItem(
                        //   onPressed: () {
                        //     context.router.push(
                        //       const EditProfileScreen(),
                        //     );
                        //   },
                        //   title: 'edit_profile',
                        //   svgPictureName: FontAwesome5.user_edit,
                        // ),
                        // ProfileItem(
                        //   onPressed: () {
                        //     NavigationService.push(
                        //       page: PrivacyScreen.routeName,
                        //     );
                        //   },
                        //   title: 'privacy_policy',
                        //   icons: Octicons.shield_lock,
                        // ),
                        // ProfileItem(
                        //   onPressed: () {
                        //     NavigationService.push(
                        //       page: TermsAndConitionsScreen.routeName,
                        //     );
                        //   },
                        //   title: 'terms',
                        //   icons: Octicons.shield_lock,
                        // ),
                        // ProfileItem(
                        //   onPressed: () {
                        //     NavigationService.push(
                        //       page: DeliveryScreen.routeName,
                        //     );
                        //   },
                        //   title: 'delivery',
                        //   icons: Icons.drive_eta,
                        // ),
                        // ProfileItem(
                        //   onPressed: () {
                        //     NavigationService.push(
                        //       page: ReturnsAndRefundsScreen.routeName,
                        //     );
                        //   },
                        //   title: 'returns_refunds',
                        //   icons: Iconic.undo,
                        // ),
                        ProfileItem(
                          onPressed: () {
                            // NavigationService.push(
                            //   page: AboutScreen.routeName,
                            // );
                            context.router.push(
                              const AboutUsRouter(),
                            );
                          },
                          title: 'about_trkar',
                          svgPictureName: 'about-icon',
                        ),
                        ProfileItem(
                          onPressed: () {
                            // NavigationService.push(
                            //   page: SupportScreen.routeName,
                            // );
                            context.router.push(
                              const SupportScreen(),
                            );
                          },
                          title: 'support',
                          svgPictureName: 'support-icon',
                        ),
                        ProfileItem(
                          onPressed: () {
                            BlocProvider.of<LogoutCubit>(context)
                                .logOut(context);
                          },
                          title: 'logout',
                          svgPictureName: 'logout-icon',
                          showForwardIcon: false,
                        ),
                        const BoxHelper(
                          height: 50,
                        ),
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VisitorProfileView extends StatelessWidget {
  const VisitorProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VisitorProfileHeader(),
        ProfileItem(
          onPressed: () {
            var langCubit = context.read<LangCubit>();
            showDialog(
              context: context,
              builder: (_) => BlocBuilder<LangCubit, LangState>(
                builder: (context, state) {
                  return ChangeLanguageDialog(langCubit: langCubit);
                },
              ),
            );
          },
          title: 'lang',
          svgPictureName: 'language-icon',
        ),
        ProfileItem(
            onPressed: () {
              // NavigationService.push(
              //   page: AboutScreen.routeName,
              // );
              context.router.push(
                const AboutUsRouter(),
              );
            },
            title: 'about_trkar',
            svgPictureName: 'about-icon'),
        ProfileItem(
          onPressed: () {
            // NavigationService.push(
            //   page: SupportScreen.routeName,
            // );
            context.router.push(
              const SupportScreen(),
            );
          },
          title: 'support',
          svgPictureName: 'support-icon',
        ),
      ],
    );
  }
}

class VisitorProfileHeader extends StatelessWidget {
  const VisitorProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${'welcome'.translate} !',
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: ScreenUtil().setSp(17),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const BoxHelper(
                      height: 5,
                    ),
                    Text(
                      'enter_your_account'.translate,
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: ScreenUtil().setSp(13),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(55),
                  child: RegisterButton(
                    title: 'login',
                    removePadding: false,
                    radius: 12,
                    onPressed: () {
                      context.navigateTo(
                        const LoginRouter(),
                      );
                    },
                  ),
                ),
              ],
            )
            /**
           * 
           ListTile(
            title: Text(
              'welcome'.translate,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: ScreenUtil().setSp(17),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Text(
              'enter_your_account'.translate,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: ScreenUtil().setSp(17),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            trailing: SizedBox(
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setHeight(55),
              child: RegisterButton(
                title: 'login',
                removePadding: false,
                radius: 12,
                onPressed: () {
                  context.navigateTo(
                    const LoginRouter(),
                  );
                },
              ),
            ),
          ),
           */
            ),
        Divider(
          thickness: 0.4,
          color: Theme.of(context).textTheme.headline1?.color,
        ),
      ],
    );
  }
}

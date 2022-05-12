import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:trkar/Addresses/view/addresses_screen.dart';
import 'package:trkar/auth/viewModel/logout/logout_cubit.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/profile/view/edit_profile_screen.dart';
import 'package:trkar/profile/view/widgets/profile_header_item.dart';
import 'package:trkar/profile/view/widgets/profile_item.dart';
import 'package:trkar/profile/viewModel/userProfile/user_profile_cubit.dart';
import '../../core/extensions/string.dart';
import 'package:trkar/tab/viewModel/cubit/tab_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/my-profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TabCubit tabCubit;
  late UserProfileCubit userProfileCubit;
  @override
  void initState() {
    tabCubit = context.read<TabCubit>();
    userProfileCubit = context.read<UserProfileCubit>()
      ..getUserProfile(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(Helper.currentUser?.accessToken ?? '');
    return WillPopScope(
      onWillPop: () async => tabCubit.onBackButtonPressed(context),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'my_account'.translate,
            style: const TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () => tabCubit.onBackButtonPressed(context),
            icon: const Icon(
              Icons.arrow_back,
            ),
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
              ProfileItem(
                onPressed: () {},
                title: 'my_orders_history',
                icons: Icons.history,
              ),
              ProfileItem(
                onPressed: () {},
                title: 'bank_details',
                icons: FontAwesome5.wallet,
              ),
              ProfileItem(
                onPressed: () {
                  NavigationService.push(
                    page: AddressesScreen.routeName,
                  );
                },
                title: 'addresses',
                icons: Icons.location_on,
              ),
              ProfileItem(
                onPressed: () {},
                title: 'my_coupons',
                icons: Icons.discount_outlined,
              ),
              ProfileItem(
                onPressed: () {
                  NavigationService.push(
                    page: EditProfileScreen.routeName,
                  );
                },
                title: 'edit_profile',
                icons: FontAwesome5.user_edit,
              ),
              ProfileItem(
                onPressed: () {},
                title: 'privacy_policy',
                icons: Octicons.shield_lock,
              ),
              ProfileItem(
                onPressed: () {
                  BlocProvider.of<LogoutCubit>(context).logOut(context);
                },
                title: 'logout',
                icons: Octicons.sign_out,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

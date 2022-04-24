import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/auth/viewModel/logout/logout_cubit.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/profile/view/edit_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).primaryColor,
            ),
            onSelected: (v) {
              if (v == 'edit') {
                NavigationService.push(
                  page: EditProfileScreen.routeName,
                );
              }
              if (v == 'logout') {
                BlocProvider.of<LogoutCubit>(context).logOut(context);
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 'edit',
                child: Text(
                  'edit_profile'.translate,
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Text(
                  'logout'.translate,
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {
          //     NavigationService.push(
          //       page: EditProfileScreen.routeName,
          //     );
          //   },
          //   color: Theme.of(context).primaryColor,
          //   icon: const Icon(
          //     Icons.settings_outlined,
          //   ),
          // ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BoxHelper(
            height: 80,
          ),
          Image.asset(
            'assets/icons/trkarLogoWhite.png',
            // alignment: Al,
          ),
          const BoxHelper(
            height: 30,
          ),
        ],
      ),
    );
  }
}

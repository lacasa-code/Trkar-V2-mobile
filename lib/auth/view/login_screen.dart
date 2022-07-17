import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trkar/auth/view/widgets/login_view.dart';
import 'package:trkar/auth/viewModel/login/login_cubit.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import '../../core/extensions/string.dart';

class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    log('wrap login');
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  var securePassword = true;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this)
      ..addListener(_onTabChanged);
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(_onTabChanged)
      ..dispose();
    super.dispose();
  }

  void _onTabChanged() {
    context.read<LoginCubit>()
      ..emailController.clear()
      ..passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    log('wrap build');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Visibility(
          visible: Navigator.canPop(context),
          child: IconButton(
            onPressed: () {
              context.router.pop();
            },
            color: Theme.of(context).iconTheme.color,
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const BoxHelper(
            height: 80,
          ),
          SvgPicture.asset(
            'assets/icons/svg/login-logo.svg',
            // alignment: Al,
          ),
          const BoxHelper(
            height: 30,
          ),
          TabBarWidget(
            controller: controller,
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                LoginView(),
                LoginView(
                  isCustomerRegister: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      unselectedLabelColor: Theme.of(context).primaryColor,
      labelColor: Colors.white,
      indicatorColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      indicatorSize: TabBarIndicatorSize.label,

      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),

      // unselectedLabelColor: ,
      tabs: const [
        TabBarItem(
          label: 'customer',
        ),
        TabBarItem(
          label: 'vendor',
        ),
      ],
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: Text(
        label.translate,
      ),
    );
  }
}

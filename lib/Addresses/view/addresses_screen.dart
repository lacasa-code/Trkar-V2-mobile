import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../core/themes/themes.dart';
import '../../core/helper/helper.dart';
import '../../core/router/router.gr.dart';
import '../../core/components//register_button.dart';
import '../../core/components//sized_box_helper.dart';
import 'widgets/address_widget.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({Key? key}) : super(key: key);
  static const routeName = '/addresses-screen';

  @override
  _AddressesScreenState createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Helper.appDirection,
      child: Scaffold(
        key: scaffoldKey,
        drawer: const MyDrawer(),
        appBar: SearchAppBar(scaffoldKey: scaffoldKey),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: Text(
        //     'addresses'.translate,
        //     style: const TextStyle(color: Colors.black),
        //   ),
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back,
        //     ),
        //     onPressed: () {
        //       NavigationService.goBack();
        //     },
        //     color: Colors.black,
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              RegisterButton(
                title: 'add_new_address',
                // removePadding: true,
                radius: 12,
                onPressed: () {
                  context.router.push(
                   const AddNewAddressScreen(),
                  );
                },
                icon: const Icon(
                  Icons.add_location_alt_outlined,
                ),
              ),
              const BoxHelper(
                height: 15,
              ),
              ...List.generate(
                6,
                (index) => AddressWidget(
                  isDefault: index == 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

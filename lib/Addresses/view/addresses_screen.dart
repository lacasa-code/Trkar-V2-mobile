import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/Addresses/viewModel/addNewAddress/add_new_address_cubit.dart';
import '../../core/themes/themes.dart';
import '../../core/helper/helper.dart';

import '../../../core/themes/screen_utility.dart';
import '../../../core/helper/navigator.dart';
import '../../core/extensions/string.dart';
import '../../core/components//register_button.dart';
import '../../core/components//sized_box_helper.dart';
import 'add_new_address_screen.dart';
import 'widgets/address_widget.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({Key? key}) : super(key: key);
  static const routeName = '/addresses-screen';

  @override
  _AddressesScreenState createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Helper.appDirection,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'addresses'.translate,
            style: const TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              NavigationService.goBack();
            },
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              RegisterButton(
                title: 'add_new_address',
                // removePadding: true,
                radius: 12,
                onPressed: () {
                  NavigationService.push(
                    page: AddNewAddressScreen.routeName,
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
                (index) => AddressWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:trkar/Addresses/view/addresses_screen.dart';
import 'package:trkar/auth/viewModel/logout/logout_cubit.dart';
import 'package:trkar/cars/view/my_cars_screen.dart';
import 'package:trkar/core/components/dropdown_widget.dart';
import 'package:trkar/core/components/multiselect_dropdown_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/core/helper/enums.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/localization/view/change_language_screen.dart';
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
        titleTextStyle: const TextStyle(color: Colors.black),
        title: Row(
          children: [
            const SelectCarWidget(),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: SearchModalBottomSheet(),
                  ),
                );
              },
              color: Colors.black,
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
        ),
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
              if (v == 'addresses') {
                NavigationService.push(
                  page: AddressesScreen.routeName,
                );
              }
              if (v == 'lang') {
                NavigationService.push(
                  page: ChangeLanguageScreen.routeName,
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
                value: 'lang',
                child: Text(
                  'lang'.translate,
                ),
              ),
              PopupMenuItem(
                value: 'addresses',
                child: Text(
                  'addresses'.translate,
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

class SelectCarWidget extends StatelessWidget {
  const SelectCarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            NavigationService.push(
              page: MyCarsScreen.routeName,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  FontAwesome5.car,
                  color: Colors.black,
                ),
                BoxHelper(
                  width: 10,
                ),
                Text(
                  'select_car'.translate,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

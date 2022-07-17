import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../viewModel/addNewAddress/add_new_address_cubit.dart';
import '../../core/themes/themes.dart';
import '../../core/helper/helper.dart';

import '../../core/themes/screen_utility.dart';
import '../../core/extensions/string.dart';
import '../../core/components//register_button.dart';
import '../../core/components//register_field.dart';
import 'package:trkar/core/components/loader_widget.dart';

class AddNewAddressScreen extends StatefulWidget implements AutoRouteWrapper {
  const AddNewAddressScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/add-new-address';

  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AddNewAddressCubit(),
      child: this,
    );
  }
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  dynamic cityId;
  bool isDefault = false;
  late AddNewAddressCubit _addNewAddressCubit;

  @override
  void initState() {
    _addNewAddressCubit = context.read<AddNewAddressCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Helper.appDirection,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            (_addNewAddressCubit.address == null
                    ? 'add_new_address'
                    : 'edit_address')
                .translate,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            color: Colors.black,
            onPressed: () {
              context.router.pop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _addNewAddressCubit.formKey,
            child: Column(
              children: [
                RegisterField(
                  thinBorder: true,
                  labelText: 'first_name',
                  validator: _addNewAddressCubit.firstNameValidate,
                  controller: _addNewAddressCubit.firstNameController,
                ),
                RegisterField(
                  thinBorder: true,
                  labelText: 'last_name',
                  validator: _addNewAddressCubit.lastNameValidate,
                  controller: _addNewAddressCubit.lastNameController,
                ),
                Column(
                  children: [
                    SearchableDropDownWidget(
                      validator: _addNewAddressCubit.countryValidate,
                      values:
                          List.generate(5, (index) => 'country ${index + 1}'),
                      thinBorder: true,
                      labelText: 'country',
                      onChanged: (v) {
                        if (v == null) {
                          return;
                        }
                      },
                    ),
                    SearchableDropDownWidget(
                      validator: _addNewAddressCubit.areaValidate,
                      values: List.generate(5, (index) => 'area ${index + 1}'),
                      thinBorder: true,
                      labelText: 'area',
                      onChanged: (v) {
                        if (v == null) {
                          return;
                        }
                      },
                    ),
                    SearchableDropDownWidget(
                      validator: _addNewAddressCubit.cityValidate,
                      values: List.generate(5, (index) => 'city ${index + 1}'),
                      thinBorder: true,
                      labelText: 'city',
                      onChanged: (v) {
                        if (v == null) {
                          return;
                        }
                      },
                    ),
                  ],
                ),
                // RegisterField(
                //   thinBorder: true,
                //   labelText: 'area',
                //   validator: _addNewAddressCubit.areaValidate,
                //   controller: _addNewAddressCubit.areaController,
                // ),
                RegisterField(
                  thinBorder: true,
                  labelText: 'district',
                  validator: _addNewAddressCubit.districtValidate,
                  controller: _addNewAddressCubit.districtController,
                ),
                RegisterField(
                  thinBorder: true,
                  labelText: 'street',
                  validator: _addNewAddressCubit.streetValidate,
                  controller: _addNewAddressCubit.streetController,
                ),
                RegisterField(
                  thinBorder: true,
                  labelText: 'home_number',
                  validator: _addNewAddressCubit.homeNumberValidate,
                  controller: _addNewAddressCubit.homeNumberController,
                ),
                RegisterField(
                  thinBorder: true,
                  labelText: 'floor_number',
                  validator: _addNewAddressCubit.floorValidate,
                  controller: _addNewAddressCubit.floorNumberController,
                ),
                RegisterField(
                  thinBorder: true,
                  labelText: 'apartment_number',
                  validator: _addNewAddressCubit.apartementValidate,
                  controller: _addNewAddressCubit.apartementController,
                ),
                RegisterField(
                  thinBorder: true,
                  labelText: 'phone',
                  keyboardType: TextInputType.phone,
                  formatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _addNewAddressCubit.phoneController,
                  validator: _addNewAddressCubit.phoneValidate,
                ),
                // const AddressDefaultSwitch(),
                // AddressMapWidget(
                //   isEdit: _addNewAddressCubit.address != null,
                //   addressFromMap: (latLng) {
                //     _addNewAddressCubit.lat = latLng.latitude;
                //     _addNewAddressCubit.lon = latLng.longitude;
                //   },
                // ),
                BlocBuilder<AddNewAddressCubit, AddNewAddressState>(
                  builder: (context, state) {
                    if (state is AddNewAddressLoading) {
                      return const LoaderWidget();
                    }
                    return RegisterButton(
                      title: 'save',
                      // removePadding: true,
                      radius: 12,
                      onPressed: () =>
                          _addNewAddressCubit.addNewAddress(context),
                      icon: const Icon(
                        Icons.add_location_alt_outlined,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressDefaultSwitch extends StatelessWidget {
  const AddressDefaultSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewAddressCubit, AddNewAddressState>(
      builder: (context, state) {
        var addressCubit = context.read<AddNewAddressCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Switch(
                value: addressCubit.isDefault == '1',
                onChanged: addressCubit.changeDefault,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // trackColor:
                activeColor: MainStyle.mainColor,
                inactiveTrackColor: Colors.white,

                // MaterialStateProperty.all<Color>(Colors.white),
                thumbColor:
                    MaterialStateProperty.all<Color>(MainStyle.mainColor),
              ),
              Text(
                'is_default'.translate,
                style: MainTheme.buttonStyle,
              )
            ],
          ),
        );
      },
    );
  }
}

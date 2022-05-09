import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/my_addresses_model.dart';
import '../../viewModel/myAddresses/my_addresses_cubit.dart';
import '../../../core/components/custom_new_dialog.dart';
import '../../../core/helper/app_localization.dart';
import '../../../core/helper/navigator.dart';
import '../../repo/add_new_address_repo.dart';
part 'add_new_address_state.dart';

class AddNewAddressCubit extends Cubit<AddNewAddressState> {
  AddNewAddressCubit({this.address, this.context})
      : super(AddNewAddressInitial()) {
    if (address != null) {
      // TODO : handle editing address ...

      // cityIndex = context!
      //         .read<CitiesCubit>()
      //         .cities
      //         ?.indexWhere((element) => element.name == address?.city) ??
      // 0;
    }
  }
  final Address? address;
  final BuildContext? context;
  Future<void> addNewAddress(BuildContext context) async {
    var validate = formKey.currentState!.validate();
    if (!validate /*|| (lat == null && lon == null)*/) {
      /*if (lat == null && lon == null) {
        Fluttertoast.showToast(
          msg: localization.text('pick_loc_required'),
          backgroundColor: Colors.red,
        );
      }*/
      return;
    }
    return;
    emit(AddNewAddressLoading());
    var dialog = CustomDialog();
    log(_isDefault);
    var addNewAddressData = await AddOrUpgradeAddressRepo.addNewAddress(
      context,
      create: address == null,
      body: {
        'is_default': _isDefault,
        'city_id': cityId,
        'street': streetController.text,
        'floor_number': floorNumberController.text,
        'apartment_number': apartementController.text,
        'latitude': lat,
        'longitude': lon,
        if (address != null) ...{
          'address_id': address?.id,
        }
      },
    );

    if (addNewAddressData == null) {
      dialog.showWarningDialog(
        context: context,
        msg: localization.text('network'),
        btnOnPress: () {},
      );
      emit(AddNewAddressNetworkError());
      return;
    }

    if (addNewAddressData.success == true) {
      context.read<MyAddressesCubit>().addNewAddress(
            addNewAddressData.data!.toJson(),
            addressId: address?.id,
          );
      emit(AddNewAddressDone());
      NavigationService.goBack();
    } else {
      Fluttertoast.showToast(
        msg: addNewAddressData.message ?? localization.text('something_wrong'),
      );
      emit(AddNewAddressError());
    }
  }

  String? firstNameValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('first_name_required');
    }
    return null;
  }

  String? lastNameValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('last_name_required');
    }
    return null;
  }

  String? districtValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('district_required');
    }
    return null;
  }

  String? homeNumberValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('home_number_required');
    }
    return null;
  }

  String? apartmentNumberValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('apartment_number_required');
    }
    return null;
  }

  String? landlineValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('landline_required');
    }
    return null;
  }

  String? noteValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('note_required');
    }
    return null;
  }

  String? cityValidate(String? v) {
    if (v == null) {
      return localization.text('city_required');
    }
    return null;
  }

  String? areaValidate(String? v) {
    if (v == null) {
      return localization.text('area_required');
    }
    return null;
  }

  String? countryValidate(String? v) {
    if (v == null) {
      return localization.text('country_required');
    }
    return null;
  }

  String? streetValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('street_required');
    }
    return null;
  }

  String? floorValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('floor_number_required');
    }
    return null;
  }

  String? phoneValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('phone_required');
    }
    if (v.length < 10) {
      return localization.text('invalid_phone');
    }
    return null;
  }

  String? apartementValidate(String? v) {
    if (v!.isEmpty) {
      return localization.text('apartment_number_required');
    }
    return null;
  }

  final formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var districtController = TextEditingController();
  var streetController = TextEditingController();
  var homeNumberController = TextEditingController();
  var floorNumberController = TextEditingController();
  var apartementController = TextEditingController();
  var phoneController = TextEditingController();
  var landlineController = TextEditingController();
  var nearestMilestoneController = TextEditingController();
  var noteController = TextEditingController();
  int? cityId, areaId;
  int cityIndex = 0;
  String _isDefault = '0';
  String get isDefault => _isDefault;
  double? lat, lon;
  bool _canChangeDefaultState = true;
  bool get canChangeDefaultState => _canChangeDefaultState;

  changeDefault(bool value) {
    if (!_canChangeDefaultState) {
      return;
    }
    _isDefault = value ? '1' : '0';
    emit(DefaultStateChanged());
  }

  @override
  Future<void> close() {
    firstNameController.dispose(); //
    lastNameController.dispose(); //E
    districtController.dispose(); //E
    streetController.dispose(); //Edi
    homeNumberController.dispose();
    floorNumberController.dispose();
    apartementController.dispose();
    phoneController.dispose(); //Edit
    landlineController.dispose(); //E
    nearestMilestoneController.dispose();
    noteController.dispose(); //Editi
    return super.close();
  }
}

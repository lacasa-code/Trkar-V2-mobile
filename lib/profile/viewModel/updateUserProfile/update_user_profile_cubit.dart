import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trkar/core/components/custom_new_dialog.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import 'package:trkar/profile/viewModel/userProfile/user_profile_cubit.dart';
import '../../../core/extensions/string.dart';
import '../../repo/update_user_profile_repo.dart';
import '../../repo/update_user_password_repo.dart';

part 'update_user_profile_state.dart';

class UpdateUserProfileCubit extends Cubit<UpdateUserProfileState> {
  UpdateUserProfileCubit() : super(UpdateUserProfileInitial());
  initialData(BuildContext context) {
    var userData = context.read<UserProfileCubit>().profileData;
    if (userData == null) {
      return;
    }
    nameController.text = userData.username ?? '';
    emailController.text = userData.email ?? '';
    phoneController.text = userData.phone ?? '';
    addressController.text = userData.address ?? '';
    countryId = userData.countryId;
    cityId = userData.cityId;
    areaId = userData.areaId;
    latitude = double.parse(userData.latitude ?? '0.0');
    longitude = double.parse(userData.longitude ?? '0.0');
    profileImage = userData.image;
  }

  Future<void> updateUserProfile(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    var valid = profileFormKey.currentState!.validate();
    if (!valid) {
      return;
    }
    emit(UpdateUserProfileLoading());
    try {
      var updateData = await UpdateUserProfileRepo.updateData(
        context,
        body: {
          'email': emailController.text,
          'username': nameController.text,
          'country_id': countryId,
          'city_id': cityId,
          'area_id': areaId,
          'latitude': latitude,
          'longitude': longitude,
          'address': addressController.text,
          'phone': phoneController.text,
          'image': pickedImage == null
              ? pickedImage
              : await MultipartFile.fromFile(
                  pickedImage!.path,
                ),
        },
      );
      if (updateData == null) {
        _dialog.showWarningDialog(
          context: context,
          msg: 'network'.translate,
          btnOnPress: () {},
        );
        emit(UpdateUserProfileNetworkError());
        return;
      }

      if (updateData.status == true) {
        Fluttertoast.showToast(
          msg: updateData.message ?? '',
        );
        emit(UpdateUserProfileDone());
      } else {
        _dialog.showWarningDialog(
          context: context,
          msg: updateData.message ?? '',
          btnOnPress: () {},
        );
        emit(UpdateUserProfileError());
      }
    } on LaravelException catch (error) {
      _dialog.showWarningDialog(
        msg: error.exception,
        btnOnPress: () {},
        context: context,
      );
      emit(UpdateUserProfileError());
    }
  }

  Future<void> updateUserPassword(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    var valid = passwordFormKey.currentState!.validate();
    if (!valid) {
      return;
    }
    emit(UpdateUserPasswordLoading());
    try {
      var updateData = await UpdateUserPasswordRepo.updatePassword(
        context,
        body: {
          'password': passwordController.text,
        },
      );
      if (updateData == null) {
        _dialog.showWarningDialog(
          context: context,
          msg: 'network'.translate,
          btnOnPress: () {},
        );
        emit(UpdateUserProfileNetworkError());
        return;
      }

      if (updateData.status == true) {
        Fluttertoast.showToast(
          msg: updateData.message ?? '',
        );
        emit(UpdateUserProfileDone());
      } else {
        _dialog.showWarningDialog(
          context: context,
          msg: updateData.message ?? '',
          btnOnPress: () {},
        );
        emit(UpdateUserProfileError());
      }
    } on LaravelException catch (error) {
      log('message');
      _dialog.showWarningDialog(
        msg: error.exception,
        btnOnPress: () {},
        context: context,
      );
      emit(UpdateUserProfileError());
    }
  }

  final _dialog = CustomDialog();
  final profileFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  String? countryId, cityId, areaId;
  double? latitude, longitude;
  File? pickedImage;
  String? profileImage;

  String? userNameValidator(String? v) {
    if (v!.isEmpty) {
      return 'username_required'.translate;
    }
    if (v.length < 3) {
      return 'invalid_username'.translate;
    }
    return null;
  }

  String? emailValidator(String? v) {
    if (v!.isEmpty) {
      return 'email_required'.translate;
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(v)) {
      return 'invalid_email'.translate;
    }
    return null;
  }

  String? phoneValidator(String? v) {
    if (v!.isEmpty) {
      return 'phone_required'.translate;
    }
    if (v.length < 10) {
      return 'invalid_phone'.translate;
    }
    return null;
  }

  String? countryValidator(String? v) {
    if (v == null) {
      return 'country_required'.translate;
    }

    return null;
  }

  String? cityValidator(String? v) {
    if (v == null) {
      return 'city_required'.translate;
    }

    return null;
  }

  String? areaValidator(String? v) {
    if (v == null) {
      return 'area_required'.translate;
    }

    return null;
  }

  String? passwordValidator(String? v) {
    if (v!.isEmpty) {
      return 'password_required'.translate;
    }
    if (!v.contains(RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
      return 'invalid_password'.translate;
    }
    return null;
  }

  String? passwordConfirmationValidator(String? v) {
    if (v!.isEmpty) {
      return 'password_confirmation_required'.translate;
    }
    if (passwordController.text.isNotEmpty && (passwordController.text != v)) {
      return 'password_mismatch'.translate;
    }
    return null;
  }

  String? addressValidator(String? v) {
    if (v!.isEmpty) {
      return 'address_required'.translate;
    }
    if (latitude == null && longitude == null) {
      return 'map_address_required'.translate;
    }
    return null;
  }

  void pickLocation(LatLng latLng, String address) {
    addressController.text = address;
    latitude = latLng.latitude;
    longitude = latLng.longitude;
    emit(LocationPicked());
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    phoneController.dispose();
    addressController.dispose();
    return super.close();
  }
}

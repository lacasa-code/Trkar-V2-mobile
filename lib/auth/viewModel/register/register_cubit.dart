import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trkar/core/components/custom_new_dialog.dart';
import 'package:trkar/core/components/result_dialog.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../repo/user_register_repo.dart';
import '../../repo/vendor_register_repo.dart';
import '../../../core/extensions/string.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    this.userType,
  }) : super(RegisterInitial());

  /// 0 => user , 1=>vendor ...
  final dynamic userType;

  Future<void> _registerUser(BuildContext context) async {
    emit(RegisterLoading());

    var registerData = await UserRegisterRepo.registerUser(
      context,
      body: {
        'email': emailController.text,
        'password': passwordController.text,
        'username': usernameController.text,
        // 'country_id': countryId,
        // 'city_id': cityId,
        // 'area_id': areaId,
        // 'latitude': latitude,
        // 'longitude': longitude,
        // 'address': addressController.text,
        // 'phone': phoneController.text,
        // 'image': pickedImage == null
        //     ? null
        //     : await MultipartFile.fromFile(
        //         pickedImage!.path,
        //       ),
      },
    );
    if (registerData == null) {
       showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: 'network'.translate,
        ),
      );
      emit(RegisterNetworkError());
      return;
    }
    if (registerData.status == true) {
      emit(RegisterDone());
      Fluttertoast.showToast(msg: registerData.message ?? '');
      context.router.push(
        EmailVerficationRouter(),
      );
    } else {
      String errorMessage = '';
      if (registerData.erroressages != null) {
        registerData.erroressages?.forEach((key, value) {
          if (value.isNotEmpty) {
            errorMessage.isEmpty
                ? errorMessage += value.first
                : errorMessage += '\n ${value.first}';
          }
        });
      }

      emit(RegisterError());
      _dialog.showWarningDialog(
        context: context,
        msg: errorMessage,
        btnOnPress: () {},
      );
    }
  }

  Future<void> _registerVendor(BuildContext context) async {
    emit(RegisterLoading());
    // context.router.push(
    //   EmailVerficationRouter(
    //     stateOfVerfication: 1,
    //     phoneNumber: phoneController.text,
    //   ),
    // );
    // return;

    var registerData = await VendorRegisterRepo.registerVendor(
      context,
      body: {
        'username': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text,
      },
    );
    if (registerData == null) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: 'network'.translate,
        ),
      );
      emit(RegisterNetworkError());
      return;
    }
    if (registerData.status == true) {
      emit(RegisterDone());
      Fluttertoast.showToast(msg: registerData.message ?? '');
      // context.router.push(
      //   EmailVerficationRouter(),
      // );
      context.router.pushAndPopUntil(
        const LoginRouter(),
        predicate: (r) => false,
      );
    } else {
      String errorMessage = '';

      if (registerData.errorMessages?.username != null) {
        errorMessage += registerData.errorMessages!.username!.first;
      }
      if (registerData.errorMessages?.email != null) {
        errorMessage +=
            '${errorMessage.isNotEmpty ? '\n ' : ''}${registerData.errorMessages!.email!.first}';
      }
      if (registerData.errorMessages?.password != null) {
        errorMessage +=
            '${errorMessage.isNotEmpty ? '\n ' : ''}${registerData.errorMessages!.password!.first}';
      }
      if (registerData.errorMessages?.phone != null) {
        errorMessage +=
            '${errorMessage.isNotEmpty ? '\n ' : ''}${registerData.errorMessages!.phone!.first}';
      }

      emit(RegisterError());
      _dialog.showWarningDialog(
        context: context,
        msg: errorMessage,
        btnOnPress: () {},
      );
    }
  }

  Future<void> register(context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    var validate = formKey.currentState!.validate();
    if (!validate && !kDebugMode) {
      return;
    }
    // if (pickedImage == null) {
    //   Fluttertoast.showToast(
    //     msg: 'profile_image_required'.translate,
    //     backgroundColor: Colors.red,
    //   );
    // return;
    // }
    if (userType == 1) {
      _registerVendor(context);
    } else {
      _registerUser(context);
    }
  }

  final formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  File? pickedImage;
  dynamic countryId, cityId, areaId, latitude, longitude;
  final _dialog = CustomDialog();
  String get title => userType == 0
      ? 'register_as_customer'.translate
      : 'register_as_vendor'.translate;
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
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    phoneController.dispose();
    addressController.dispose();
    return super.close();
  }
}

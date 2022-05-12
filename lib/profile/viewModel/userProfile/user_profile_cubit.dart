import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import 'package:trkar/auth/model/register_model.dart';
import 'package:trkar/core/helper/helper.dart';
import '../../model/user_profile_model.dart';
import '../../repo/user_profile_repo.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());

  Future<void> getUserProfile(
    BuildContext context, {
    bool initial = true,
  }) async {
    if (initial) {
      emit(UserProfileLoading());
    }
    var userProfileData = await UserProfileRepo.getProfile(context);

    if (userProfileData == null) {
      emit(UserProfileNetworkError());
      return;
    }
    if (userProfileData.status == true) {
      _profileData = userProfileData.data;
      if (initial) {
        try {
          context.read<AddressDataCubit>().initialProfileScreen(
                context,
                countryId: userProfileData.data?.countryId,
                cityId: userProfileData.data?.cityId,
              );
        } catch (e) {
          log('message');
        }
      }
      storeNewData();

      emit(UserProfileDone());
    }
  }

  void storeNewData() {
    var currentUser = Helper.currentUser;
    log('message ${_profileData?.image}');
    var authModel = UserAuthModel(
      accessToken: currentUser?.accessToken,
      code: currentUser?.code,
      data: UserData(
        address: _profileData?.address,
        areaId: _profileData?.areaId,
        cityId: _profileData?.cityId,
        countryId: _profileData?.countryId,
        image: _profileData?.image,
        createdAt: _profileData?.createdAt,
        deletedAt: _profileData?.deletedAt,
        email: _profileData?.email,
        emailVerifiedAt: _profileData?.emailVerifiedAt,
        id: _profileData?.id,
        inBlock: _profileData?.inBlock,
        lastLogin: _profileData?.lastLogin,
        latitude: _profileData?.latitude,
        longitude: _profileData?.longitude,
        phone: _profileData?.phone,
        phoneVerifiedAt: _profileData?.phoneVerifiedAt,
        updatedAt: _profileData?.updatedAt,
        username: _profileData?.username,
        uuid: _profileData?.uuid,
      ),
      expiresIn: currentUser?.expiresIn,
      erroressages: currentUser?.erroressages,
      message: currentUser?.message,
      status: currentUser?.status,
      tokenType: currentUser?.tokenType,
    );
    Helper.storeNewUserData(authModel);
  }

  ProfileData? _profileData;
  ProfileData? get profileData => _profileData;
}

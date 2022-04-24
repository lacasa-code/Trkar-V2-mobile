import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import '../../model/user_profile_model.dart';
import '../../repo/user_profile_repo.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());

  Future<void> getUserProfile(BuildContext context) async {
    emit(UserProfileLoading());
    var userProfileData = await UserProfileRepo.getProfile(context);

    if (userProfileData == null) {
      emit(UserProfileNetworkError());
      return;
    }
    if (userProfileData.status == true) {
      _profileData = userProfileData.data;
      context.read<AddressDataCubit>().initialProfileScreen(
            context,
            countryId: userProfileData.data?.countryId,
            cityId: userProfileData.data?.cityId,
          );
      emit(UserProfileDone());
    }
  }

  ProfileData? _profileData;
  ProfileData? get profileData => _profileData;
}

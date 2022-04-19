import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../model/user_profile_model.dart';
import '../../repo/user_profile_repo.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());

  Future<void> getUserProfile(context) async {
    emit(UserProfileLoading());
    var userProfileData = await UserProfileRepo.getProfile(context);

    if (userProfileData == null) {
      emit(UserProfileNetworkError());
      return;
    }
    if (userProfileData.status == true) {
      _profileData = userProfileData.data;
      emit(UserProfileDone());
    }
  }

  ProfileData? _profileData;
  ProfileData? get profileData => _profileData;
}

part of 'update_user_profile_cubit.dart';

@immutable
abstract class UpdateUserProfileState {}

class UpdateUserProfileInitial extends UpdateUserProfileState {}

class UpdateUserProfileLoading extends UpdateUserProfileState {}

class UpdateUserPasswordLoading extends UpdateUserProfileState {}

class UpdateUserProfileError extends UpdateUserProfileState {}

class UpdateUserProfileNetworkError extends UpdateUserProfileState {}

class UpdateUserProfileDone extends UpdateUserProfileState {}

class LocationPicked extends UpdateUserProfileState {}

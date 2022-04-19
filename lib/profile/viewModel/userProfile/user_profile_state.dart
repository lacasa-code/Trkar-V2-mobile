part of 'user_profile_cubit.dart';

@immutable
abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileError extends UserProfileState {}

class UserProfileDone extends UserProfileState {}

class UserProfileNetworkError extends UserProfileState {}

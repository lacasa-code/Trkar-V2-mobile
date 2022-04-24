part of 'logout_cubit.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutError extends LogoutState {}

class LogoutDone extends LogoutState {}

class LogoutNetworlError extends LogoutState {}

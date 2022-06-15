part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {}

class LoginDone extends LoginState {}

class VisibilityChanged extends LoginState {}

class LoginNetworkError extends LoginState {}

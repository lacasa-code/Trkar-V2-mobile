part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterNetworkError extends RegisterState {}

class RegisterDone extends RegisterState {}

class LocationPicked extends RegisterState {}

class RegisterError extends RegisterState {}

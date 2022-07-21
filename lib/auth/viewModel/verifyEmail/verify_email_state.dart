part of 'verify_email_cubit.dart';

@immutable
abstract class VerifyEmailState {}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailError extends VerifyEmailState {}

class VerifyEmailDone extends VerifyEmailState {}

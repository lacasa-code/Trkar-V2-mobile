part of 'verify_reset_code_cubit.dart';

@immutable
abstract class VerifyResetCodeState {}

class VerifyResetCodeInitial extends VerifyResetCodeState {}

class VerifyResetCodeLoading extends VerifyResetCodeState {}

class VerifyResetCodeError extends VerifyResetCodeState {}

class VerifyResetCodeDone extends VerifyResetCodeState {}

part of 'confirm_code_cubit.dart';

@immutable
abstract class ConfirmCodeState {}

class ConfirmCodeInitial extends ConfirmCodeState {}

class ConfirmCodeLoading extends ConfirmCodeState {}

class ConfirmCodeError extends ConfirmCodeState {}

class ConfirmCodeDone extends ConfirmCodeState {}

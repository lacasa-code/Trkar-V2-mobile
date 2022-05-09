part of 'add_new_address_cubit.dart';

@immutable
abstract class AddNewAddressState {}

class AddNewAddressInitial extends AddNewAddressState {}

class AddNewAddressLoading extends AddNewAddressState {}

class AddNewAddressError extends AddNewAddressState {}

class AddNewAddressNetworkError extends AddNewAddressState {}

class AddNewAddressDone extends AddNewAddressState {}

class DefaultStateChanged extends AddNewAddressState {}

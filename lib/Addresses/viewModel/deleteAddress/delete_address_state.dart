part of 'delete_address_cubit.dart';

@immutable
abstract class DeleteAddressState {}

class DeleteAddressInitial extends DeleteAddressState {}

class DeleteAddressLoading extends DeleteAddressState {
  final dynamic addressId;
  DeleteAddressLoading({this.addressId});
}

class DeleteAddressError extends DeleteAddressState {}

class DeleteAddressNetworkError extends DeleteAddressState {}

class DeleteAddressDone extends DeleteAddressState {}

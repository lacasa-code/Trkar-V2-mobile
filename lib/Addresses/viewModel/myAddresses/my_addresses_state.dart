part of 'my_addresses_cubit.dart';

@immutable
abstract class MyAddressesState {}

class MyAddressesInitial extends MyAddressesState {}

class MyAddressesLoading extends MyAddressesState {}

class MyAddressesError extends MyAddressesState {}

class MyAddressesNetworkError extends MyAddressesState {}

class MyAddressesDone extends MyAddressesState {}

class NewAddressAdded extends MyAddressesState {}

class AddressDeleted extends MyAddressesState {}

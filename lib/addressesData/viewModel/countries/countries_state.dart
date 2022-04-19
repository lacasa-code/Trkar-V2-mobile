part of 'countries_cubit.dart';

@immutable
abstract class AddressDataState {}

class AddressDataInitial extends AddressDataState {}

class CountryLoading extends AddressDataState {}

class CityLoading extends AddressDataState {}

class AreaLoading extends AddressDataState {}

class AddressDataError extends AddressDataState {}

class AddressDataDone extends AddressDataState {}

class AddressDataNetworkError extends AddressDataState {}

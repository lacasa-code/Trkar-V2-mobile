part of 'store_type_cubit.dart';

@immutable
abstract class StoreTypeState {}

class StoreTypeInitial extends StoreTypeState {}

class StoreTypeLoading extends StoreTypeState {}

class StoreTypeDone extends StoreTypeState {}

class StoreTypeError extends StoreTypeState {}

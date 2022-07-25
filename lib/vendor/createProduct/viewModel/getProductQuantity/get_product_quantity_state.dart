part of 'get_product_quantity_cubit.dart';

@immutable
abstract class GetProductQuantityState {}

class GetProductQuantityInitial extends GetProductQuantityState {}

class GetProductQuantityLoading extends GetProductQuantityState {}

class DeleteProductQuantityLoading extends GetProductQuantityState {}

class GetProductQuantityError extends GetProductQuantityState {}

class GetProductQuantityDone extends GetProductQuantityState {}

class Deleted extends GetProductQuantityState {}

class Error extends GetProductQuantityState {}

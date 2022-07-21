part of 'products_type_cubit.dart';

@immutable
abstract class ProductsTypeState {}

class ProductsTypeInitial extends ProductsTypeState {}

class ProductsTypeLoading extends ProductsTypeState {}

class ProductsTypeDone extends ProductsTypeState {}

class ProductsTypeError extends ProductsTypeState {}

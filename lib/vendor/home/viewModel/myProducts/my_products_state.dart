part of 'my_products_cubit.dart';

@immutable
abstract class MyProductsState {}

class MyProductsInitial extends MyProductsState {}

class MyProductsLoading extends MyProductsState {}

class MyProductsError extends MyProductsState {}

class MyProductsDone extends MyProductsState {}

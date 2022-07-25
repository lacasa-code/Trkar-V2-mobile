part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsDone extends ProductDetailsState {}

class ProductDetailsError extends ProductDetailsState {}

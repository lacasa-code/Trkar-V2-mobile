part of 'create_product_cubit.dart';

@immutable
abstract class CreateProductState {}

class CreateProductInitial extends CreateProductState {}

class CreateProductLoading extends CreateProductState {}

class CreateProductDone extends CreateProductState {}

class QuantityFieldsAdded extends CreateProductState {}

class CreateProductError extends CreateProductState {}

class ProductImagePicked extends CreateProductState {}

class CategoryDropDownStateChanged extends CreateProductState {}

class ProductTypeStateChanged extends CreateProductState {}

class ViewModeStateChanged extends CreateProductState {}

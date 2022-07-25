part of 'create_product_cubit.dart';

@immutable
abstract class CreateProductState {}

class CreateProductInitial extends CreateProductState {}

class CreateProductLoading extends CreateProductState {}

class CreateProductDone extends CreateProductState {}

class QuantityFieldsAdded extends CreateProductState {}

class CreateProductError extends CreateProductState {}

class ProductImagePicked extends CreateProductState {}

class ProductImageListStateChanged extends CreateProductState {}

class ProductDataFetching extends CreateProductState {
  final int? productId;
  ProductDataFetching({
    this.productId,
  });
}

class ProductDataFetched extends CreateProductState {}

class CategoryDropDownStateChanged extends CreateProductState {}

class ProductTypeStateChanged extends CreateProductState {}

class ViewModeStateChanged extends CreateProductState {}

class CreateProductCarModelLoading extends CreateProductState {}

class CarModelDone extends CreateProductState {}

class CarModelError extends CreateProductState {}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import '../../model/product_type_model.dart';
import '../../repo/product_type_repo.dart';

part 'products_type_state.dart';

class ProductsTypeCubit extends Cubit<ProductsTypeState> {
  ProductsTypeCubit() : super(ProductsTypeInitial());

  Future<void> getProductTypes(
    context,
  ) async {
    emit(ProductsTypeLoading());
    try {
      var productTypesData = await ProductTypeRepo.getProductsType(context);
      if (productTypesData == null) {
        emit(ProductsTypeError());
        return;
      }
      if (productTypesData.status == true) {
        _productTypes = productTypesData.data;
        emit(ProductsTypeDone());
      } else {
        emit(ProductsTypeError());
      }
    } on LaravelException catch (error) {
      emit(ProductsTypeError());
    }
  }

  List<ProductType>? _productTypes = [];
  List<ProductType> get productTypes => [...?_productTypes];
}

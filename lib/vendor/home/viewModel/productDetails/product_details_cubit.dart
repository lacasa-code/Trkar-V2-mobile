import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import '../../model/product_details_model.dart';
import '../../repo/product_details_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  ProductData? _productData;
  ProductData? get productData => _productData;

  Future<void> getProductData(
    context, {
    @required int? productId,
  }) async {
    emit(ProductDetailsLoading());
    try {
      var productDetailsData = await ProductDetailsRepo.getProductDetails(
        context,
        productId: productId,
      );
      if (productDetailsData == null) {
        emit(ProductDetailsError());
        return;
      }
      if (productDetailsData.status == true) {
        _productData = productDetailsData.data;
        emit(ProductDetailsDone());
      } else {
        emit(ProductDetailsError());
      }
    } on LaravelException catch (_) {
      emit(ProductDetailsError());
    }
  }
}

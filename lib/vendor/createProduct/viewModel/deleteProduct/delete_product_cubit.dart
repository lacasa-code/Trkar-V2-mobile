import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trkar/core/components/result_dialog.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/vendor/home/viewModel/myProducts/my_products_cubit.dart';
import '../../repo/delete_product_repo.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit({
    @required this.productId,
  }) : super(DeleteProductInitial());
  final int? productId;

  Future<void> deleteProduct(
    BuildContext context,
  ) async {
    emit(DeleteProductLoading());
    try {
      var deleteData = await DeleteProductRepo.deleteProductById(
        context,
        productId: productId,
      );
      if (deleteData == null) {
        emit(DeleteProductError());
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: 'network'.translate,
          ),
        );
        return;
      }
      if (deleteData.status == true) {
        Fluttertoast.showToast(
          msg: deleteData.message ?? '',
        );
        context.read<MyProductsCubit>().deleteProductById(
              productId,
            );
        emit(DeleteProductDone());
      } else {
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: deleteData.message ?? 'something_wrong'.translate,
          ),
        );
        emit(DeleteProductDone());
      }
    } on LaravelException catch (error) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: error.exception,
        ),
      );
    }
  }
}

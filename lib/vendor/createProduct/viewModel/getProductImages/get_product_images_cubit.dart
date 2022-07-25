import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import '../../../../core/components/result_dialog.dart';
import '../../../../core/extensions/string.dart';
import '../../model/get_product_images_model.dart';
import '../../repo/get_product_images_repo.dart';
import '../../repo/delete_product_image_repo.dart';

part 'get_product_images_state.dart';

class GetProductImagesCubit extends Cubit<GetProductImagesState> {
  GetProductImagesCubit() : super(GetProductImagesInitial());

  List<Images>? _productImages = [];
  List<Images> get productImages => [...?_productImages];

  Future<void> getProductImages(
    context, {
    @required int? productId,
  }) async {
    emit(GetProductImagesLoading());
    try {
      var getProductImagesData = await GetProductImagesRepo.getProductImages(
        context,
        productId: productId,
      );
      if (getProductImagesData == null) {
        emit(GetProductImagesError());
        return;
      }

      if (getProductImagesData.status == true) {
        _productImages = getProductImagesData.data;
        emit(GetProductImagesDone());
      } else {
        emit(GetProductImagesError());
      }
    } on LaravelException catch (e) {
      emit(GetProductImagesError());
    }
  }

  Future<bool> deleteProductImage(
    context, {
    @required int? imageId,
  }) async {
    emit(DeleteLoading());
    try {
      var deleteData = await DeleteProductImageRepo.deleteProductImageById(
        context,
        imageId: imageId,
      );
      if (deleteData == null) {
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: 'network'.translate,
          ),
        );
        emit(Error());

        return false;
      }
      if (deleteData.status == true) {
        Fluttertoast.showToast(
          msg: deleteData.message ?? '',
        );
        //  { _branchQuantity?.removeWhere(
        //     (e) => e.id == quantityId,
        //   );}
        emit(Deleted());
        return true;
      } else {
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: deleteData.message ?? 'something_wrong'.translate,
          ),
        );
        emit(Error());
        return false;
      }
    } on LaravelException catch (_) {
      emit(Error());
      return false;
    }
  }
}

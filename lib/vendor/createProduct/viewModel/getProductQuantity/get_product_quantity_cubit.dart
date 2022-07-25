import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';

import '../../../../core/components/result_dialog.dart';
import '../../model/get_product_branches_quantity_model.dart';
import '../../repo/get_product_branches_quantity_repo.dart';
import '../../repo/delete_branch_quantity_repo.dart';
import '../../../../core/extensions/string.dart';

part 'get_product_quantity_state.dart';

class GetProductQuantityCubit extends Cubit<GetProductQuantityState> {
  GetProductQuantityCubit() : super(GetProductQuantityInitial());

  List<Quantity>? _branchQuantity = [];
  List<Quantity> get branchQuantity => [...?_branchQuantity];

  Future<void> getBranchesQuantity(
    context, {
    @required int? productId,
  }) async {
    emit(GetProductQuantityLoading());

    try {
      var productBranchesQuantityData =
          await GetProductBranchesQuantityRepo.getQuantity(
        context,
        productId: productId,
      );
      if (productBranchesQuantityData == null) {
        emit(GetProductQuantityError());
        return;
      }
      if (productBranchesQuantityData.status == true) {
        _branchQuantity = productBranchesQuantityData.data;
        emit(GetProductQuantityDone());
      } else {
        emit(GetProductQuantityError());
      }
    } on LaravelException catch (_) {
      emit(GetProductQuantityError());
    }
  }

  Future<bool> deleteBranchQuantity(
    context, {
    @required int? quantityId,
  }) async {
    emit(DeleteProductQuantityLoading());
    try {
      var deleteData = await DeleteBranchQuantityRepo.deleteQuantityById(
        context,
        quantityId: quantityId,
      );
      if (deleteData == null) {
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: 'network'.translate,
          ),
        );
        emit(GetProductQuantityError());

        return false;
      }
      if (deleteData.status == true) {
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
      emit(GetProductQuantityError());
      return false;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';

import '../../model/store_branchs_model.dart';
import '../../model/vendor_store_model.dart';

import '../../repo/branches_repo.dart';
import '../../repo/vendor_store_repo.dart';

part 'store_branches_state.dart';

class StoreBranchesCubit extends Cubit<StoreBranchesState> {
  StoreBranchesCubit() : super(StoreBranchesInitial());

  int? _storeId;
  StoreData? _storeData;
  List<Branch>? _branches = [];

  int get storeId => _storeId ?? 0;
  List<Branch> get branches => [...?_branches];
  StoreData? get storeData => _storeData;

  Future<void> getVendorStore(
    context,
  ) async {
    emit(StoreLoading());

    try {
      var storeData = await VendorStoreRepo.getStore(context);

      if (storeData == null) {
        emit(StoreError());
        return;
      }

      if (storeData.status == true) {
        _storeId = storeData.data?.id;
        _storeData = storeData.data;
        emit(StoreDone());
        await Future.delayed(
          const Duration(
            milliseconds: 1,
          ),
        );
        getStoreBranches(context);
      } else {
        emit(StoreError());
      }
    } on LaravelException catch (error) {
      emit(StoreError());
    }
  }

  Future<void> getStoreBranches(context) async {
    emit(BranchesLoading());

    try {
      var branchesData = await BranchesRepo.getBranches(
        context,
        storeId: _storeId ?? 0,
      );

      if (branchesData == null) {
        emit(BranchesError());
        return;
      }

      if (branchesData.status == true) {
        _branches = branchesData.data;
        emit(BranchesDone());
      } else {
        emit(BranchesError());
      }
    } on LaravelException catch (error) {
      emit(BranchesError());
    }
  }
}

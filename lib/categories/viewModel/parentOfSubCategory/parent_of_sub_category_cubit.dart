import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';

import '../../repo/parent_of_sub_category_repo.dart';

part 'parent_of_sub_category_state.dart';

class ParentOfSubCategoryCubit extends Cubit<ParentOfSubCategoryState> {
  ParentOfSubCategoryCubit() : super(ParentOfSubCategoryInitial());

  List<int>? _parentsId = [];
  List<int> get parentsIds => [...?_parentsId];

  Future<bool> parentOfSubCategory(
    context, {
    @required subcategoryId,
  }) async {
    emit(ParentOfSubCategoryLoading());

    try {
      var parentsData = await ParentOfSubCategoryRepo.getParentOfSubCategory(
        context,
        subcategoryId: subcategoryId,
      );

      if (parentsData == null) {
        emit(ParentOfSubCategoryError());
        return false;
      }
      if (parentsData.status == true) {
        _parentsId = parentsData.data;
        emit(ParentOfSubCategoryError());
        return true;
      } else {
        emit(ParentOfSubCategoryError());
        return false;
      }
    } on LaravelException catch (_) {
      emit(ParentOfSubCategoryError());
      return false;
    }
  }
}

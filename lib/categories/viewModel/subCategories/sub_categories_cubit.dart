import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../model/sub_categories_model.dart';
import '../../repo/sub_categories_repo.dart';

part 'sub_categories_state.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit({
    this.parentId,
    this.categoryName,
  }) : super(SubCategoriesInitial());
  dynamic parentId;
  String? categoryName;

  final List<SubCategory>? _subCategories = [];
  List<SubCategory> get subCategories => [...?_subCategories];
  Future<bool> hasSubCategories(
    int categoryId,
    context,
  ) async {
    var subCategoriesData = await SubCategoriesRepo.getSubCategories(
      context,
      parentId: categoryId,
    );
    if (subCategoriesData == null) {
      return false;
    }

    return subCategoriesData.status ?? false;
  }

  init() {
    if (_subCategories!.isNotEmpty) {
      _subCategories!.clear();
      emit(SubCategoriesCleared());
    }
  }

  Future<void> getSubCategories(
    context, {
    int? id,
    String? name,
  }) async {
    emit(SubCategoriesLoading());
    var subCategoriesData = await SubCategoriesRepo.getSubCategories(
      context,
      parentId: id ?? parentId,
    );
    
    if (name != null) {
      categoryName = name;
    }
    if (id != null) {
      parentId = id;
    }

    if (subCategoriesData == null) {
      emit(SubCategoriesNetworkError());

      return;
    }
    if (subCategoriesData.status == true) {
      _subCategories?.addAll(subCategoriesData.data!);
      emit(SubCategoriesDone());
    } else {
      emit(SubCategoriesError());
    }
  }
}

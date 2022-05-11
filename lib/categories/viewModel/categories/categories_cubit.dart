import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import '../../model/categories_model.dart';
import '../../repo/categories_repo.dart';
import '../../../core/extensions/string.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> getCategories(context) async {
    emit(CategoriesLoading());
    try {
      var categoriesData = await CategoriesRepo.getCategories(context);
      if (categoriesData == null) {
        return;
      }
      if (categoriesData.status == true) {
        _category = categoriesData.data;
        emit(CategoriesDone());
      } else {
        emit(CategoriesError(
          msg: categoriesData.message ?? 'something_wrong'.translate,
        ));
      }
    } on LaravelException catch (error) {
      emit(CategoriesError(msg: error.exception));
    }
  }

  Future<void> getAllCategories(context) async {
    log('message');
    emit(AllCategoriesLoading());
    try {
      var categoriesData = await CategoriesRepo.getCategories(
        context,
        allCategories: true,
      );
      if (categoriesData == null) {
        return;
      }
      if (categoriesData.status == true) {
        _allcategory = categoriesData.data;
        _allcategory?.sort((a, b) => a.parentId?.compareTo(b.parentId!) ?? 0);
        emit(CategoriesDone());
      } else {
        emit(CategoriesError(
          msg: categoriesData.message ?? 'something_wrong'.translate,
        ));
      }
    } on LaravelException catch (error) {
      emit(CategoriesError(msg: error.exception));
    }
  }

  int? categoryId;
  List<Category>? _category = [];
  List<Category>? _allcategory = [];
  Category? get selectedCategory => _category?.firstWhere(
        (element) => element.id == categoryId,
      );
  List<Category> get category => [
        ...?_category,
      ];
  List<Category> get maincategory => [
        ...?_allcategory?.where((e) => e.parentId == '0').toList(),
      ];
  List<Category> get allcategory => [...?_allcategory];

  List<Category> subCategories(int parentId) => _allcategory!
      .where((element) => element.parentId == parentId.toString())
      .toList();

  List<Category> get subCategory => [
        ...?_category
            ?.where((e) => e.parentId == categoryId.toString())
            .toList(),
      ];
  bool hasSubCategory(int? parentId) {
    categoryId = parentId;
    return (_category?.indexWhere(
                (element) => element.parentId == categoryId.toString()) ??
            -1) >=
        0;
  }
}

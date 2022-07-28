import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trkar/core/helper/laravel_exception.dart';
import 'package:trkar/search/viewModel/search/search_cubit.dart';
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
    if (_allCategory!.isNotEmpty) {
      return;
    }
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
        _allCategory = categoriesData.data;
        _allCategory?.sort((a, b) => a.parentId?.compareTo(b.parentId!) ?? 0);
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
  List<Categories>? _category = [];
  List<Categories>? _allCategory = [];
  final List<int> _categoriesScreenSubCatIds = [
    // motorcycle parts ..
    519,
    33,
    7,
    2230,
    2182,
    513,
    // e-mobility .. .. ..
  ];
  final List<int> _homeCategoriesIds = [
    34,
    35,
    53,
    36,
    37,
    13,
    39,
    40,
    41,
    43,
    30,
    45,
    31,
    46,
    47,
    518,
    542,
    42,
    49,
    50,
    504,
    505,
    507,
    509,
    563,
    28,
    29,
    510,
    506,
    508,
    511,
    512,
    515,
    514,
    8,
    517,
    516,
  ];
  Categories? get selectedCategory => _category?.firstWhere(
        (element) => element.id == categoryId,
      );
  List<Categories> get category => [
        ...?_category,
      ];
  List<Categories> get mainCategory => [
        ...?_allCategory?.where((e) => e.parentId == '0').toList(),
      ];


  List<Categories> get homeCategories {
    List<Categories> _myCat = [];
    for (var i = 0; i < _homeCategoriesIds.length; i++) {
      var index = _allCategory!
          .indexWhere((element) => element.id == _homeCategoriesIds[i]);
      if (index < 0) {
        continue;
      }
      _myCat.add(_allCategory!
          .firstWhere((element) => element.id == _homeCategoriesIds[i]));
    }
    return _myCat;
    // return [
    //   ...?_allcategory
    //       ?.where((e) =>
    //           _homeCategoriesIds.indexWhere((element) => element == e.id) >= 0)
    //       .toList(),
    // ];
  }

  List<Categories> get categoriesScreenSubCat {
    List<Categories> _myCat = [];
    for (var i = 0; i < _categoriesScreenSubCatIds.length; i++) {
      var index = _allCategory!
          .indexWhere((element) => element.id == _categoriesScreenSubCatIds[i]);
      if (index < 0) {
        continue;
      }
      _myCat.add(_allCategory!.firstWhere(
          (element) => element.id == _categoriesScreenSubCatIds[i]));
    }
    return _myCat;
    // return [
    //   ...?_allcategory
    //       ?.where((e) =>
    //           _homeCategoriesIds.indexWhere((element) => element == e.id) >= 0)
    //       .toList(),
    // ];
  }

  List<Categories> get allCategory => [...?_allCategory];

  List<Categories> subCategories(int parentId) => _allCategory!
      .where((element) => element.parentId == parentId.toString())
      .toList();

  List<Categories> get subCategory => [
        ...?_category
            ?.where((e) => e.parentId == categoryId.toString())
            .toList(),
      ];
  bool hasSubCategory(int? parentId) {
    categoryId = parentId;
    log('categ index ${_allCategory?.indexWhere((element) => element.parentId == categoryId.toString())}');
    return _category!.isNotEmpty
        ? (_category?.indexWhere(
                    (element) => element.parentId == categoryId.toString()) ??
                -1) >=
            0
        : _allCategory!.isNotEmpty
            ? (_allCategory?.indexWhere((element) =>
                        element.parentId == categoryId.toString()) ??
                    -1) >=
                0
            : false;
  }
}

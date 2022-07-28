import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import '../../../search/viewModel/search/search_cubit.dart';
import '../../model/categories_model.dart';
import '../../repo/main_category_with_children_repo.dart';

part 'main_category_with_children_state.dart';

class MainCategoryWithChildrenCubit
    extends Cubit<MainCategoryWithChildrenState> {
  MainCategoryWithChildrenCubit() : super(MainCategoryWithChildrenInitial());

  Future<void> getMainCategories(
    context,
  ) async {
    emit(MainCategoryWithChildrenLoading());
    try {
      var categoriesData = await MainCategoryWithChildrenRepo.getMainCategories(
        context,
      );
      if (categoriesData == null) {
        emit(MainCategoryWithChildrenError());
        return;
      }
      if (categoriesData.status == true) {
        _categories = categoriesData.data;
        emit(MainCategoryWithChildrenDone());
      } else {
        emit(MainCategoryWithChildrenError());
      }
    } on LaravelException catch (_) {
      emit(MainCategoryWithChildrenError());
    }
  }

  onTabBarChanging({
    required BuildContext context,
    required int index,
  }) {
    log('hi From NewMessage');
    if (mainCategories.isNotEmpty) {
      context.read<SearchCubit>().getCarMades(
            context,
            categoryId: mainCategories[index].id,
          );
      emit(TabBarStateChanged());
    }
  }

  double getTabBarSize(int index) => ScreenUtil().setHeight(81.15 *
      ((_categories!.isNotEmpty &&
              subCategoriesByCategoryId(mainCategories[index].id ?? 0).length >
                  40
          ? 40
          : _categories!.isNotEmpty
              ? subCategoriesByCategoryId(mainCategories[index].id ?? 0).length
              : 0)));
  List<Categories>? _categories = [];
  List<Categories> get mainCategories => [
        ...?_categories
            ?.where(
              (element) => element.parentId == '0',
            )
            .toList(),
      ];
  List<Categories> subCategoriesByCategoryId(
    int? categoryId,
  ) =>
      [
        ...?_categories
            ?.where(
              (element) => element.parentId == categoryId.toString(),
            )
            .toList(),
      ];
}

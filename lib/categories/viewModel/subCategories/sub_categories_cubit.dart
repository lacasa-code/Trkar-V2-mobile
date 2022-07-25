import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/helper/helper.dart';
import '../../../core/router/router.gr.dart' as route;
import 'package:flutter/material.dart';
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

  List<SubCategory>? getSubCategoryByParentId(
    int parentId,
  ) =>
      _subCategories
          ?.where(
            (element) => int.parse(element.parentId ?? '0') == parentId,
          )
          .toList();

  Future<void> subCategoriesOnClickHandler({
    required BuildContext context,
    String? catSlug,
    int? catId,
    String? categoryName,
  }) async {
    // log('catId =>${catId}');
    if (catSlug == 'car-accessories') {
      context.router.push(
        route.CarAccessoriesScreen(),
      );
      return;
    }

    if (catSlug == 'tools-equipment') {
      // NavigationService.push(page: ToolsScreen.routeName);
      context.router.push(
        route.ToolsScreen(
          categoryId: catId.toString(),
        ),
      );
      return;
    }
    if (catSlug == 'engine-oil') {
      // NavigationService.push(
      //   page: EngineOilScreen.routeName,
      // );
      context.router.push(
        route.EngineOilScreen(categoryId: catId.toString()),
      );
      return;
    }
    if (catSlug == 'tyres') {
      context.router.push(
        route.TyresScreen(
          tabIndex: catId,
        ),
      );
      return;
    }
    if (catSlug == 'filters') {
      context.router.push(
        route.FilterRouter(
          categoryName: categoryName,
          parentId: catId.toString(),
        ),
      );
      return;
    }
    if (catSlug == 'brakes') {
      context.router.push(
        route.BrakesRouter(
          parentId: catId.toString(),
          categoryName: categoryName,
        ),
      );
      return;
    }
    var hasSubCat = await hasSubCategories(catId ?? 0, context);
    if (hasSubCat) {
      // NavigationService.push(
      //     page: SubCategoriesScreen.routeName,
      //     arguments: {
      //       'category_name':
      //           Helper.currentLanguage == 'ar'
      //               ? cat.nameAr
      //               : cat.nameEn,
      //       'parent_id': catId,
      //     });
      context.router.push(
        route.SubCategoriesScreen(
          categoryName: categoryName,
          parentId: catId.toString(),
        ),
      );
    }
  }
}

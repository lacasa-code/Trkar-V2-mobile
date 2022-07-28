part of 'main_category_with_children_cubit.dart';

@immutable
abstract class MainCategoryWithChildrenState {}

class MainCategoryWithChildrenInitial extends MainCategoryWithChildrenState {}

class MainCategoryWithChildrenLoading extends MainCategoryWithChildrenState {}

class MainCategoryWithChildrenDone extends MainCategoryWithChildrenState {}

class MainCategoryWithChildrenError extends MainCategoryWithChildrenState {}

class TabBarStateChanged extends MainCategoryWithChildrenState {}

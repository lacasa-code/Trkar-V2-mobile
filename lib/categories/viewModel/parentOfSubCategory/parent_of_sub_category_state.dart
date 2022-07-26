part of 'parent_of_sub_category_cubit.dart';

@immutable
abstract class ParentOfSubCategoryState {}

class ParentOfSubCategoryInitial extends ParentOfSubCategoryState {}

class ParentOfSubCategoryLoading extends ParentOfSubCategoryState {}

class ParentOfSubCategoryDone extends ParentOfSubCategoryState {}

class ParentOfSubCategoryError extends ParentOfSubCategoryState {}

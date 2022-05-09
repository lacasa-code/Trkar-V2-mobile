part of 'sub_categories_cubit.dart';

@immutable
abstract class SubCategoriesState {}

class SubCategoriesInitial extends SubCategoriesState {}
class SubCategoriesLoading extends SubCategoriesState {}
class SubCategoriesError extends SubCategoriesState {}
class SubCategoriesNetworkError extends SubCategoriesState {}
class SubCategoriesDone extends SubCategoriesState {}

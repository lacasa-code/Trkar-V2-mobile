part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesError extends CategoriesState {
  CategoriesError({
    this.msg,
  });
  final String? msg;
}

class CategoriesDone extends CategoriesState {}

class CategoriesNetworkError extends CategoriesState {
  CategoriesNetworkError({
    this.msg,
  });
  final String? msg;
}

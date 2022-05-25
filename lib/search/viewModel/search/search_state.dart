part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchTypeChanged extends SearchState {}

class VinNumberLoading extends SearchState {}

class VinNumberDone extends SearchState {}

class VinNumberError extends SearchState {}

class SearchCarMadesLoading extends SearchState {}

class SearchCarEngineError extends SearchState {
  SearchCarEngineError({this.message});
  final String? message;
}

class SearchCarEngineDone extends SearchState {}

class SearchCarModelsLoading extends SearchState {}

class CarModelsError extends SearchState {
  CarModelsError({this.message});
  final String? message;
}

class SearchCarModelsDone extends SearchState {}

class SearchCarEngineLoading extends SearchState {}

class CarMadesError extends SearchState {
  CarMadesError({this.message});
  final String? message;
}

class CarMadesDone extends SearchState {}

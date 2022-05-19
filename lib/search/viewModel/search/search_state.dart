part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchTypeChanged extends SearchState {}

class VinNumberLoading extends SearchState {}

class VinNumberDone extends SearchState {}

class VinNumberError extends SearchState {}

class CarMadesLoading extends SearchState {}

class CarEngineError extends SearchState {
  CarEngineError({this.message});
  final String? message;
}

class CarEngineDone extends SearchState {}

class CarModelsLoading extends SearchState {}

class CarModelsError extends SearchState {
  CarModelsError({this.message});
  final String? message;
}

class CarModelsDone extends SearchState {}

class CarEngineLoading extends SearchState {}

class CarMadesError extends SearchState {
  CarMadesError({this.message});
  final String? message;
}

class CarMadesDone extends SearchState {}

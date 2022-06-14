part of 'engine_oil_cubit.dart';

@immutable
abstract class EngineOilState {}

class EngineOilInitial extends EngineOilState {}

class EngineOilCarMadesLoading extends EngineOilState {}

class OilCarEngineError extends EngineOilState {
  OilCarEngineError({this.message});
  final String? message;
}

class OilCarEngineDone extends EngineOilState {}

class OilCarModelsLoading extends EngineOilState {}

class OilCarModelsError extends EngineOilState {
  OilCarModelsError({this.message});
  final String? message;
}

class OilCarModelsDone extends EngineOilState {}

class OilCarEngineLoading extends EngineOilState {}

class CarMadesError extends EngineOilState {
  CarMadesError({this.message});
  final String? message;
}

class CarMadesDone extends EngineOilState {}

class SearchStateChanged extends EngineOilState {}

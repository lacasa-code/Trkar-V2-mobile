part of 'engine_oil_cubit.dart';

@immutable
abstract class EngineOilState {}

class EngineOilInitial extends EngineOilState {}
class CarMadesLoading extends EngineOilState {}

class CarEngineError extends EngineOilState {
  CarEngineError({this.message});
  final String? message;
}

class CarEngineDone extends EngineOilState {}

class CarModelsLoading extends EngineOilState {}

class CarModelsError extends EngineOilState {
  CarModelsError({this.message});
  final String? message;
}

class CarModelsDone extends EngineOilState {}

class CarEngineLoading extends EngineOilState {}

class CarMadesError extends EngineOilState {
  CarMadesError({this.message});
  final String? message;
}

class CarMadesDone extends EngineOilState {}

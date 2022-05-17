part of 'filter_cars_cubit.dart';

@immutable
abstract class FilterCarsState {}

class FilterCarsInitial extends FilterCarsState {}

class CarMadesLoading extends FilterCarsState {}

class CarMadesEnglishLoading extends FilterCarsState {}

class CarEngineLoading extends FilterCarsState {}

class CarModelsLoading extends FilterCarsState {}

class CarYearsLoading extends FilterCarsState {}

class ManufacturersLoading extends FilterCarsState {}

class OriginalCountriesLoading extends FilterCarsState {}

class FilterCarsDone extends FilterCarsState {}

class FilterCarsError extends FilterCarsState {
  FilterCarsError({
    required this.message,
  });
  final String message;
}

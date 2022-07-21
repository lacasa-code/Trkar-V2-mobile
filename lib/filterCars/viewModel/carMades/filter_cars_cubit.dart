// import 'dart:math';

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import 'package:trkar/core/extensions/string.dart';
import '../../model/car_mades_model.dart';
import '../../repo/car_mades_repo.dart';
import '../../model/manufacturers_model.dart';
import '../../repo/manufacturers_repo.dart';
import '../../model/original_countries_model.dart';
import '../../repo/origin_countries_repo.dart';
import '../../model/car_years_model.dart';
import '../../repo/car_years_repo.dart';
import '../../model/cars_model.dart';
import '../../repo/car_model_repo.dart';
import '../../model/car_engine_model.dart';
import '../../repo/car_engine_repo.dart';

part 'filter_cars_state.dart';

class FilterCarsCubit extends Cubit<FilterCarsState> {
  FilterCarsCubit() : super(FilterCarsInitial());

  Future<void> getCarMades(
    context, {
    categoryId,
    bool isSearch = false,
  }) async {
    _carModels?.clear();
    _carEngines?.clear();
    emit(CarMadesLoading());
    try {
      var carMadesData = await CarMadesRepo.getCarMades(
        context,
        categoryId: categoryId,
        isEnglish: isSearch,
      );
      if (carMadesData == null) {
        emit(FilterCarsError(
          message: 'network'.translate,
        ));
        return;
      }
      if (carMadesData.status == true) {
        _carMades = carMadesData.data;
        emit(FilterCarsDone());
      } else {
        emit(FilterCarsError(message: 'something_wrong'));
      }
    } on LaravelException catch (error) {
      emit(FilterCarsError(
        message: error.exception,
      ));
    }
  }

  Future<void> getCarEngines(
    context, {
    carModelId,
  }) async {
    emit(CarEngineLoading());
    try {
      var carMadesData = await CarEnginesRepo.getCarEngine(
        context,
        carModelId: carModelId,
      );
      if (carMadesData == null) {
        emit(FilterCarsError(
          message: 'network'.translate,
        ));
        return;
      }
      if (carMadesData.status == true) {
        _carEngines = carMadesData.data;
        emit(FilterCarsDone());
      } else {
        emit(FilterCarsError(message: 'something_wrong'));
      }
    } on LaravelException catch (error) {
      emit(FilterCarsError(
        message: error.exception,
      ));
    }
  }

  Future<void> getManufacturer(
    context, {
    categoryId,
  }) async {
    emit(ManufacturersLoading());
    try {
      var manufacturersData = await ManufacturersRepo.getManufacturer(
        context,
        categoryId: categoryId,
      );
      if (manufacturersData == null) {
        emit(FilterCarsError(
          message: 'network'.translate,
        ));
        return;
      }
      if (manufacturersData.status == true) {
        if (categoryId != null) {
          _categoriesManufacturers = manufacturersData.data;
        } else {
          _manufacturers = manufacturersData.data;
        }
        log('length => ${_categoriesManufacturers?.length} ${_manufacturers?.length}');
        emit(FilterCarsDone());
      } else {
        _manufacturers?.clear();
        _categoriesManufacturers?.clear();
        emit(FilterCarsError(message: 'something_wrong'));
      }
    } on LaravelException catch (error) {
      emit(FilterCarsError(
        message: error.exception,
      ));
    }
  }

  Future<void> getOriginCountries(context) async {
    emit(OriginalCountriesLoading());
    try {
      var originalCountriesData =
          await OriginalCountriesRepo.getOriginalCountries(context);
      if (originalCountriesData == null) {
        emit(FilterCarsError(
          message: 'network'.translate,
        ));
        return;
      }
      if (originalCountriesData.status == true) {
        _originalCountry = originalCountriesData.data;
        emit(FilterCarsDone());
      } else {
        emit(FilterCarsError(message: 'something_wrong'));
      }
    } on LaravelException catch (error) {
      emit(FilterCarsError(
        message: error.exception,
      ));
    }
  }

  Future<void> getCarYears(context) async {
    emit(CarYearsLoading());
    try {
      var carYearsData = await CarYearsRepo.getCarYears(context);
      if (carYearsData == null) {
        emit(FilterCarsError(
          message: 'network'.translate,
        ));
        return;
      }
      if (carYearsData.status == true) {
        _carYears = carYearsData.data;
        emit(FilterCarsDone());
      } else {
        emit(FilterCarsError(message: 'something_wrong'));
      }
    } on LaravelException catch (error) {
      emit(FilterCarsError(
        message: error.exception,
      ));
    }
  }

  Future<void> getCarModels(
    context, {
    carMadeId,
  }) async {
    _carEngines?.clear();
    emit(CarModelsLoading());
    try {
      var carYearsData = await CarModelsRepo.getCarModels(
        context,
        carMadeId: carMadeId,
      );
      if (carYearsData == null) {
        emit(FilterCarsError(
          message: 'network'.translate,
        ));
        return;
      }
      if (carYearsData.status == true) {
        _carModels = carYearsData.data;
        emit(FilterCarsDone());
      } else {
        emit(FilterCarsError(message: 'something_wrong'));
      }
    } on LaravelException catch (error) {
      emit(FilterCarsError(
        message: error.exception,
      ));
    }
  }

  /// setters ...

  List<CarMades>? _carMades = [];
  List<Manufacturer>? _manufacturers = [];
  List<Manufacturer>? _categoriesManufacturers = [];
  List<OriginalCountry>? _originalCountry = [];
  List<Year>? _carYears = [];
  List<Car>? _carModels = [];
  List<CarEngine>? _carEngines = [];

  /// getters ...

  List<CarMades> get carMades => [...?_carMades];
  List<Manufacturer> get manufacturers => [...?_manufacturers];
  List<Manufacturer> get categoriesManufacturers =>
      [...?_categoriesManufacturers];
  List<OriginalCountry> get originalCountry => [...?_originalCountry];
  List<Year> get carYears => [...?_carYears];
  List<Car> get carModels => [...?_carModels];
  List<CarEngine> get carEngines => [...?_carEngines];
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/filterCars/model/car_engine_model.dart';
import 'package:trkar/filterCars/model/car_mades_model.dart';
import 'package:trkar/filterCars/model/cars_model.dart';
import 'package:trkar/filterCars/repo/car_model_repo.dart';
import 'package:trkar/filterCars/repo/car_mades_repo.dart';
import 'package:trkar/filterCars/repo/car_engine_repo.dart';

part 'engine_oil_state.dart';

class EngineOilCubit extends Cubit<EngineOilState> {
  EngineOilCubit() : super(EngineOilInitial());

  Future<void> getCarMades(
    context, {
    categoryId,
    String? carMadeName,
  }) async {
    emit(EngineOilCarMadesLoading());
    try {
      _carModels?.clear();

      var carMadesData = await CarMadesRepo.getCarMades(
        context,
        categoryId: categoryId ?? 1,
        isEnglish: true,
      );
      if (carMadesData == null) {
        emit(CarMadesError(
          message: 'network'.translate,
        ));
        return;
      }
      if (carMadesData.status == true) {
        _carMadesEnglish = carMadesData.data;

        emit(CarMadesDone());
      } else {
        emit(CarMadesError(message: 'something_wrong'.translate));
      }
    } on LaravelException catch (error) {
      emit(CarMadesError(
        message: error.exception,
      ));
    }
  }

  Future<void> getCarModels(
    context, {
    carMadeId,
  }) async {
    emit(OilCarModelsLoading());
    try {
      _carEngines?.clear();
      var carYearsData = await CarModelsRepo.getCarModels(
        context,
        carMadeId: carMadeId,
      );
      if (carYearsData == null) {
        emit(OilCarEngineError(
          message: 'network'.translate,
        ));
        return;
      }
      if (carYearsData.status == true) {
        _carModels = carYearsData.data;

        emit(OilCarEngineDone());
      } else {
        emit(OilCarEngineError(message: 'something_wrong'.translate));
      }
    } on LaravelException catch (error) {
      emit(OilCarEngineError(
        message: error.exception,
      ));
    }
  }

  Future<void> getCarEngines(
    context, {
    carModelId,
  }) async {
    emit(OilCarEngineLoading());
    try {
      var carMadesData = await CarEnginesRepo.getCarEngine(
        context,
        carModelId: carModelId,
      );
      if (carMadesData == null) {
        emit(OilCarEngineError(
          message: 'network'.translate,
        ));
        return;
      }
      if (carMadesData.status == true) {
        _carEngines = carMadesData.data;

        emit(OilCarEngineDone());
      } else {
        emit(OilCarEngineError(message: 'something_wrong'.translate));
      }
    } on LaravelException catch (error) {
      emit(OilCarEngineError(
        message: error.exception,
      ));
    }
  }

  void changeSearchType(int? value) {
    if (value == null) {
      return;
    }
    _selectedSearchValue = value;
    emit(SearchStateChanged());
  }

  List<CarMades>? _carMadesEnglish = [];
  List<Car>? _carModels = [];
  List<CarEngine>? _carEngines = [];
  int _selectedSearchValue = 0;

  List<CarMades> get carMadesEnglish => [...?_carMadesEnglish];
  int get selectedSearchValue => _selectedSearchValue;
  List<Car> get carModels => [...?_carModels];
  List<CarEngine> get carEngines => [...?_carEngines];
}

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
    emit(CarMadesLoading());
    try {
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
    emit(CarModelsLoading());
    try {
      var carYearsData = await CarModelsRepo.getCarModels(
        context,
        carMadeId: carMadeId,
      );
      if (carYearsData == null) {
        emit(CarEngineError(
          message: 'network'.translate,
        ));
        return;
      }
      if (carYearsData.status == true) {
        _carModels = carYearsData.data;

        emit(CarEngineDone());
      } else {
        emit(CarEngineError(message: 'something_wrong'.translate));
      }
    } on LaravelException catch (error) {
      emit(CarEngineError(
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
        emit(CarEngineError(
          message: 'network'.translate,
        ));
        return;
      }
      if (carMadesData.status == true) {
        _carEngines = carMadesData.data;

        emit(CarEngineDone());
      } else {
        emit(CarEngineError(message: 'something_wrong'.translate));
      }
    } on LaravelException catch (error) {
      emit(CarEngineError(
        message: error.exception,
      ));
    }
  }

  List<CarMades>? _carMadesEnglish = [];
  List<Car>? _carModels = [];
  List<CarEngine>? _carEngines = [];

  List<CarMades> get carMadesEnglish => [...?_carMadesEnglish];
  List<Car> get carModels => [...?_carModels];
  List<CarEngine> get carEngines => [...?_carEngines];
}

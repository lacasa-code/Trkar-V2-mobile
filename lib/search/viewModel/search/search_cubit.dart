import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import 'package:trkar/filterCars/model/car_engine_model.dart';
import 'package:trkar/filterCars/model/car_mades_model.dart';
import 'package:trkar/filterCars/model/cars_model.dart';
import 'package:trkar/filterCars/repo/car_engine_repo.dart';
import 'package:trkar/filterCars/repo/car_mades_repo.dart';
import 'package:trkar/filterCars/repo/car_model_repo.dart';
import 'package:vin_decoder/vin_decoder.dart';
import '../../repo/car_mades_from_vin_repo.dart';
import '../../../core/extensions/string.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final formKey = GlobalKey<FormState>();
  var vinNumberController = TextEditingController();
  int _searchBy = 0;
  int? _selectedCarMadesItem;
  int? get selectedCarMadesItem => _selectedCarMadesItem;

  /// 1=> show CarMades, 2=>show carModels, 3=> show carEngine
  int get searchBy => _searchBy;
  void onVinNumberChanged(String? value, context) {
    if (value!.length == 17) {
      getCarMadesFromVinNumber(context);
    }
  }

  Future<void> getCarMadesFromVinNumber(context) async {
    var validate = formKey.currentState?.validate() ?? false;
    if (!validate) {
      return;
    }
    emit(VinNumberLoading());

    var carMadesData = await CarMadesFromVinRepo.getCarMadesName(
      context,
      vinNumber: vinNumberController.text,
    );
    if (carMadesData == null) {
      emit(VinNumberError());
      return;
    }
    if (carMadesData.status == true) {
      var carMadeName = carMadesData.data?.split('=').last.trim();
      getCarMades(
        context,
        carMadeName: carMadeName,
      );
      emit(VinNumberDone());
    }
  }

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
        if (carMadeName != null) {
          var index = carMadesData.data?.indexWhere(
                (element) => element.name == carMadeName,
              ) ??
              0;
          if (index >= 0) {
            _selectedCarMadesItem = index;
            getCarModels(
              context,
              carMadeId: carMadesData.data?[index].id,
            );
          }
        } else {
          _selectedCarMadesItem = null;
        }
        _carMadesEnglish = carMadesData.data;
        changeSearchType(2);

        emit(CarMadesDone());
      } else {
        emit(CarMadesError(message: 'something_wrong'));
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
        changeSearchType(2);

        emit(CarEngineDone());
      } else {
        emit(CarEngineError(message: 'something_wrong'));
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
        changeSearchType(3);

        emit(CarEngineDone());
      } else {
        emit(CarEngineError(message: 'something_wrong'));
      }
    } on LaravelException catch (error) {
      emit(CarEngineError(
        message: error.exception,
      ));
    }
  }

  String? vinNumberValidate(String? value) {
    if (value!.isEmpty) {
      return 'vin_number_required'.translate;
    }
    var vin = VIN(number: value, extended: true).valid();
    if (value.length < 17 || !vin) {
      return 'vin_number_invalid'.translate;
    }
    return null;
  }

  void changeSearchType(int type) {
    _searchBy = type;
    emit(SearchTypeChanged());
  }

  List<CarMades>? _carMadesEnglish = [];
  List<Car>? _carModels = [];
  List<CarEngine>? _carEngines = [];

  List<CarMades> get carMadesEnglish => [...?_carMadesEnglish];
  List<Car> get carModels => [...?_carModels];
  List<CarEngine> get carEngines => [...?_carEngines];

  @override
  Future<void> close() {
    vinNumberController.dispose();
    return super.close();
  }
}

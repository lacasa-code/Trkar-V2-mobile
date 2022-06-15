import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../model/country_model.dart';
import '../../repo/country_repo.dart';
import '../../model/city_model.dart';
import '../../repo/city_repo.dart';
import '../../model/area_model.dart';
import '../../repo/area_repo.dart';
part 'countries_state.dart';

class AddressDataCubit extends Cubit<AddressDataState> {
  AddressDataCubit() : super(AddressDataInitial());
  initialProfileScreen(context, {countryId, cityId}) async {
    await getCountries(context);
    if (countryId != null) {
      await getCities(context, countryId: countryId);
      await getArea(context, cityId: cityId);
    }
  }

  Future<void> getCountries(context) async {
    emit(CountryLoading());
    var countryData = await CountryRepo.getCountries(context);
    if (countryData == null) {
      emit(AddressDataNetworkError());
      return;
    }
    if (countryData.status == true) {
      _countries = countryData.data;
      emit(AddressDataDone());
    } else {
      emit(AddressDataError());
    }
  }

  Future<void> getCities(
    context, {
    dynamic countryId,
  }) async {
    emit(CityLoading());
    var cityData = await CityRepo.getCities(
      context,
      countryId: countryId,
    );
    if (cityData == null) {
      emit(AddressDataNetworkError());
      return;
    }
    if (cityData.status == true) {
      _cities = cityData.data;
      emit(AddressDataDone());
    } else {
      emit(AddressDataError());
    }
  }

  Future<void> getArea(
    context, {
    cityId,
  }) async {
    emit(AreaLoading());
    var areaData = await AreaRepo.getAreas(context, cityId: cityId);
    if (areaData == null) {
      emit(AddressDataNetworkError());
      return;
    }
    if (areaData.status == true) {
      _areas = areaData.data;
      emit(AddressDataDone());
    } else {
      emit(AddressDataError());
    }
  }

  Country? getCountryById(int countryId) {
    log('countryId => $countryId');
    return countries.firstWhere((element) => element.id == countryId,
        orElse: () => Country());
  }

  City? getCityById(int cityId) {
    return cities.firstWhere((element) => element.id == cityId);
  }

  Area? getAreaById(int cityId) {
    return areas.firstWhere((element) => element.id == cityId);
  }

  List<Country>? _countries = [];
  List<City>? _cities = [];
  List<Area>? _areas = [];

  List<Country> get countries => [...?_countries];
  List<City> get cities => [...?_cities];
  List<Area> get areas => [...?_areas];
}

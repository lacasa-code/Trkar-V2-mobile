import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../../model/tyres_types_model.dart';
import '../../model/seasons_model.dart';
import '../../model/attributes_model.dart';
import '../../repo/tyres_types_repo.dart';
import '../../repo/seasons_repo.dart';
import '../../../filterCars/model/manufacturers_model.dart';
import '../../../filterCars/repo/manufacturers_repo.dart';
import '../../repo/width_by_seasonid_repo.dart';

part 'tyres_filter_state.dart';

class TyresFilterCubit extends Cubit<TyresFilterState> {
  TyresFilterCubit() : super(TyresFilterInitial());

  Future<void> getTypes(context) async {
    emit(TypesLoaing());
    var typesData = await TyresTypesRepo.getTyresTypes(context);

    if (typesData == null) {
      emit(Error());
      return;
    }
    if (typesData.status == true) {
      _types = typesData.data;

      emit(Done());
    } else {
      emit(Done());
    }
  }

  Future<void> getSeasons(
    context, {
    tabId,
  }) async {
    emit(SeasonsLoading());
    var seasonsData = await SeasonsRepo.getSeasons(
      context,
      tabId: tabId,
    );

    if (seasonsData == null) {
      emit(Error());
      return;
    }
    if (seasonsData.status == true) {
      _seasons = seasonsData.data;
      getWidthBySeasonId(
        NavigationService.context,
        seasonId: _seasons?[0].id,
      );
      emit(Done());
    } else {
      emit(Error());
    }
  }

  Future<void> getWidthBySeasonId(
    context, {
    seasonId,
  }) async {
    emit(WidthLoading());
    var widthData = await AttributesRepo.getAttributeByParentId(
      context,
      path: 'seasons',
      parentId: seasonId,
      typeId: _types?[tabIndex].id,
    );

    if (widthData == null) {
      emit(Error());
      return;
    }

    if (widthData.status == true) {
      _width = widthData.data;
      emit(Done());
    } else {
      emit(Error());
    }
  }

  Future<void> getHeightBySeasonId(
    context, {
    widthId,
  }) async {
    emit(HeightLoading());
    var heightData = await AttributesRepo.getAttributeByParentId(
      context,
      path: 'height',
      parentId: widthId,
      typeId: _types?[tabIndex].id,
    );

    if (heightData == null) {
      emit(Error());
      return;
    }

    if (heightData.status == true) {
      _height = heightData.data;
      emit(Done());
    } else {
      emit(Error());
    }
  }

  Future<void> getDiameterBySeasonId(
    context, {
    heightId,
  }) async {
    emit(DiameterLoading());
    var diameterData = await AttributesRepo.getAttributeByParentId(
      context,
      path: 'diameter',
      parentId: heightId,
      typeId: _types?[tabIndex].id,
    );

    if (diameterData == null) {
      emit(Error());
      return;
    }

    if (diameterData.status == true) {
      _diameter = diameterData.data;
      emit(Done());
    } else {
      emit(Error());
    }
  }

  Future<void> getManufacturerByTabId(context) async {
    log('tabIndex $_tabIndex');
    emit(TyresManufacturersLoading());
    var manufacturersData = await ManufacturersRepo.getManufacturer(
      context,
      categoryId: tabIndex < 3 ? 12 : 844,
    );
    if (manufacturersData == null) {
      emit(Error());
      return;
    }
    if (manufacturersData.status == true) {
      _manufacturer = manufacturersData.data;
      emit(Done());
    } else {
      emit(Error());
    }
  }

  void changeTypesTabIndex(
    index,
    context,
  ) async {
    if (_tabIndex == index) {
      return;
    }
    _tabIndex = index;
    await getSeasons(
      context,
      tabId: _types?[index].id,
    );
    getManufacturerByTabId(context);
    // emit(TypesTabChanged());
  }

  void onSeasonDropdownChanged(
    int? value,
  ) {
    if (value == null) {
      return;
    }
    clearLists();
    _selectedSeasonId = _seasons?[value].id ?? 0;
    getWidthBySeasonId(
      NavigationService.context,
      seasonId: _selectedSeasonId,
    );
  }

  void onWidthDropdownChanged(
    int? value,
  ) {
    if (value == null) {
      return;
    }
    _height?.clear();
    _diameter?.clear();
    getHeightBySeasonId(
      NavigationService.context,
      widthId: _width?[value].id,
    );
  }

  void onHeightDropdownChanged(
    int? value,
  ) {
    if (value == null) {
      return;
    }
    getDiameterBySeasonId(
      NavigationService.context,
      heightId: _height?[value].id,
    );
  }

  void _onScroll() {
    if (!controller.hasClients) {
      return;
    }
    if (controller.position.maxScrollExtent == controller.offset) {
      emit(ScrollPositionChanged());
    } else if (controller.position.minScrollExtent == controller.offset) {
      emit(ScrollPositionChanged());
    }
  }

  init(context) async {
    controller.addListener(_onScroll);
    await getTypes(context);
    await getSeasons(context);
  }

  clearLists() {
    _width?.clear();
    _height?.clear();
    _diameter?.clear();
    _manufacturer?.clear();
  }

  animateTo({
    required bool scrollToEnd,
  }) async {
    controller.animateTo(
      scrollToEnd
          ? controller.position.maxScrollExtent
          : controller.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  List<Season>? _seasons = [];
  List<Attribute>? _width = [];
  List<Attribute>? _height = [];
  List<Attribute>? _diameter = [];
  List<Manufacturer>? _manufacturer = [];
  List<Type>? _types = [];
  int _tabIndex = 0;
  int _selectedSeasonId = 0;
  List<Season> get seasons => [...?_seasons];
  List<Attribute> get width => [...?_width];
  List<Attribute> get height => [...?_height];
  List<Attribute> get diameter => [...?_diameter];
  List<Manufacturer> get manufacturer => [...?_manufacturer];
  List<Type> get types => [...?_types];
  int get tabIndex => _tabIndex;
  int get selectedSeasonId => _selectedSeasonId;
  bool get isMax => !controller.hasClients
      ? false
      : controller.position.maxScrollExtent == controller.offset;
  var controller = ScrollController();

  @override
  Future<void> close() {
    controller.removeListener(_onScroll);
    controller.dispose();
    return super.close();
  }
}

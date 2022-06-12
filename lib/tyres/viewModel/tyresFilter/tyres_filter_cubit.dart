import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../../model/tyres_types_model.dart';
import '../../model/seasons_model.dart';
import '../../../core/extensions/string.dart';
import '../../model/attributes_model.dart';
import '../../repo/tyres_types_repo.dart';
import '../../repo/seasons_repo.dart';
import '../../../filterCars/model/manufacturers_model.dart';
import '../../../filterCars/repo/manufacturers_repo.dart';
import '../../repo/width_by_seasonid_repo.dart';

part 'tyres_filter_state.dart';

class TyresFilterCubit extends Cubit<TyresFilterState> {
  TyresFilterCubit({
    this.myTabIndex,
  }) : super(TyresFilterInitial());
  final int? myTabIndex;

  Future<void> getTypes(context) async {
    emit(TypesLoaing());
    var typesData = await TyresTypesRepo.getTyresTypes(context);

    if (typesData == null) {
      emit(Error());
      return;
    }
    if (typesData.status == true) {
      _types = typesData.data;
      getManufacturerByTabId(context);

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
        null,
        seasonIndex: _seasons?[_selectedSeasonIndex].id,
      );
      emit(Done());
    } else {
      emit(Error());
    }
  }

  Future<void> getWidthBySeasonId(
    context, {
    seasonIndex,
  }) async {
    emit(WidthLoading());
    var widthData = await AttributesRepo.getAttributeByParentId(
      context,
      path: 'seasons',
      parentId: _seasons?[seasonIndex].id,
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

  Future<void> getManufacturersByWidthId(
    context, {
    widthId,
  }) async {
    emit(TyresManufacturersLoading());
    var manufacturers = await AttributesRepo.getAttributeByParentId(
      context,
      path: 'manufactuere/$widthId',
    );

    if (manufacturers == null) {
      emit(Error());
      return;
    }

    if (manufacturers.status == true) {
      _manufacturersByWidth = manufacturers.data;
      emit(Done());
    } else {
      emit(Error());
    }
  }

  Future<void> getSpeedRatingByWidthId(
    context, {
    widthId,
  }) async {
    emit(
      SpeedRatingLoading(),
    );
    log('id is $widthId');
    var speedRating = await AttributesRepo.getAttributeByParentId(
      context,
      path: 'speed/rate/$widthId',
    );

    if (speedRating == null) {
      emit(Error());
      return;
    }

    if (speedRating.status == true) {
      _speedRating = speedRating.data;
      emit(Done());
    } else {
      emit(Error());
    }
  }

  Future<void> getDiameterByHeightId(
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
    _speedRating?.clear();
    _manufacturersByWidth?.clear();
    _speedRating?.clear();
    await getSeasons(
      context,
      tabId: _types?[index].id,
    );
    getManufacturerByTabId(context);
    // emit(TypesTabChanged());
  }

  void onSeasonDropdownChanged(
    String? value,
  ) {
    if (value == null) {
      return;
    }
    clearLists();
    _selectedSeasonIndex =
        _seasons?.indexWhere((element) => element.name == value) ?? 0;
    getWidthBySeasonId(
      null,
      seasonIndex: _selectedSeasonIndex,
    );
  }

  void onWidthDropdownChanged(
    String? value,
  ) {
    if (value == null) {
      return;
    }
    log('diameterVal => $_selectedDiameterValue');
    _selectedDiameterValueIndex++;
    _height?.clear();
    _diameter?.clear();
    var index = _width?.indexWhere((element) => element.value == value) ?? 0;
    if (index < 0) {
      return;
    }
    getHeightBySeasonId(
      null,
      widthId: _width?[index].id,
    );
    getManufacturersByWidthId(
      null,
      widthId: _width?[index].id,
    );
    getSpeedRatingByWidthId(
      null,
      widthId: _width?[index].id,
    );
  }

  void onHeightDropdownChanged(
    String? value,
  ) {
    log('value $value');
    if (value == null) {
      return;
    }
    _diameter?.clear();
    _selectedDiameterValueIndex++;
    emit(ValueChanged());
    var index = _height?.indexWhere((element) => element.value == value) ?? 0;
    if (index < 0) {
      return;
    }
    getDiameterByHeightId(
      null,
      // NavigationService.context,
      heightId: _height?[index].id,
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

    if (myTabIndex != null) {
      _tabIndex = myTabIndex == 844 ? 3 : 0;
      log('tab => $_tabIndex');
      if (_tabIndex == 3) {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            animateTo(scrollToEnd: true);
          },
        );
      }
    }

    await getTypes(context);
    await getSeasons(context);
  }

  clearLists() {
    _selectedWidthValueIndex++;
    _selectedHeightValueIndex++;
    _selectedDiameterValueIndex++;
    _height?.clear();
    _diameter?.clear();
    _manufacturersByWidth?.clear();
    _speedRating?.clear();

    emit(Cleared());
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
  List<Attribute>? _speedRating = [];
  List<Attribute>? _manufacturersByWidth = [];
  List<Manufacturer>? _manufacturer = [];
  List<Type>? _types = [];
  int _tabIndex = 0;
  DropdownEditingController<String> diameterKey =
      DropdownEditingController<String>();
  String? _selectedWidthValue = 'select'.translate;
  String? _selectedHeightValue = 'select'.translate;
  String _selectedManufactorValue = 'select'.translate;
  String? _selectedDiameterValue = 'select'.translate;
  int _selectedWidthValueIndex = 0;
  int get selectedWidthValueIndex => _selectedWidthValueIndex;
  int _selectedHeightValueIndex = 0;
  int get selectedHeightValueIndex => _selectedHeightValueIndex;
  int _selectedDiameterValueIndex = 0;
  int get selectedDiameterValueIndex => _selectedDiameterValueIndex;

  String? get selectedWidthValue => _selectedWidthValue;
  String? get selectedHeightValue => _selectedHeightValue;
  String? get selectedManufactorValue => _selectedManufactorValue;
  String? get selectedDiameterValue => _selectedDiameterValue;
  int _selectedSeasonIndex = 0;
  bool get canBeCleared =>
      (width.length > 1 && height.length > 1 && diameter.length > 1);
  List<Season> get seasons => [...?_seasons];
  List<String> get width => [
        ...?_width?.map((e) => e.value ?? '').toList()
          ?..insert(
            0,
            'select'.translate,
          )
      ];
  List<String> get height => [
        ...?_height?.map((e) => e.value ?? '').toList()
          ?..insert(
            0,
            'select'.translate,
          )
      ];
  List<String> get diameter => [
        ...?_diameter?.map((e) => e.value ?? '').toList()
          ?..insert(
            0,
            'select'.translate,
          )
      ];
  List<String> get speedRating =>
      [...?_speedRating?.map((e) => e.value ?? '').toList()];
  List<String> get manufacturer => [
        ...?(_manufacturersByWidth!.isEmpty
            ? _manufacturer?.map((e) => e.name ?? '').toList()
            : _manufacturersByWidth?.map((e) => e.value ?? '').toList()),
      ];
  List<Type> get types => [...?_types];
  int get tabIndex => _tabIndex;
  int get selectedSeasonIndex => _selectedSeasonIndex;
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

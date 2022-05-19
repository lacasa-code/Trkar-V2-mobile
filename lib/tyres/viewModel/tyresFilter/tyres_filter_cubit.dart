import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../../model/tyres_types_model.dart';
import '../../model/seasons_model.dart';
import '../../model/attributes_model.dart';
import '../../repo/tyres_types_repo.dart';
import '../../repo/seasons_repo.dart';
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
    emit(WidthLoading());
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
    }
  }

  void changeTypesTabIndex(index) {
    _tabIndex = index;
    emit(TypesTabChanged());
  }

  void onSeasonDropdownChanged(
    int? value,
  ) {
    if (value == null) {
      return;
    }
    getWidthBySeasonId(
      NavigationService.context,
      seasonId: _seasons?[value].id,
    );
  }

  void onWidthDropdownChanged(
    int? value,
  ) {
    if (value == null) {
      return;
    }
    getHeightBySeasonId(
      NavigationService.context,
      widthId: _width?[value].id,
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
  List<Type>? _types = [];
  int _tabIndex = 0;
  List<Season> get seasons => [...?_seasons];
  List<Attribute> get width => [...?_width];
  List<Attribute> get height => [...?_height];
  List<Type> get types => [...?_types];
  int get tabIndex => _tabIndex;
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

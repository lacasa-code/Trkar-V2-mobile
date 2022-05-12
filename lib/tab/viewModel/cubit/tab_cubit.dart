import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/navigator.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabInitial());

  var _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void changeTabIndex(int index) {
    _tabIndex = index;
    emit(
      TabIndexChanged(),
    );
  }

  Future<bool> onBackButtonPressed(BuildContext context) async {
    var canPop = Navigator.canPop(context);
    if (canPop) {
      NavigationService.goBack();
      return true;
    } else {
      changeTabIndex(0);
      return false;
    }
  }
}

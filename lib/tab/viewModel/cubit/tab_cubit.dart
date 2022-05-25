import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/auth/view/login_screen.dart';
import 'package:trkar/core/components/custom_new_dialog.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/extensions/string.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabInitial());

  var _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void changeTabIndex(int index, [context]) {
    if ((index == 2 || index == 3) && !Helper.isLoggedIn) {
      CustomDialog().showOptionDialog(
        context: context,
        msg: 'login_required'.translate,
        okMsg: 'login',
        okFun: () {
          NavigationService.push(
            page: LoginScreen.routeName,
          );
        },
        cancelMsg: 'cancel',
        cancelFun: () {},
      );
      return;
    }
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

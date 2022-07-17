import 'package:bloc/bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../../auth/view/login_screen.dart';
import '../../../core/helper/navigator.dart';

import '../../../../core/helper/app_localization.dart';
import '../../model/language_model.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());
  Future<void> changeLanguage({
    required BuildContext context,
  }) async {
    emit(
      LoadingState(),
    );
    await GetStorage().write(
      'language',
      _currentLanguage,
    );
    await GetStorage().write(
      'lang',
      true,
    );
    await localization.setNewLanguage(
      _currentLanguage,
      true,
    );
    emit(
      ChosenLanguage(
        language: _currentLanguage,
      ),
    );
    // var canPop = context.router.canNavigateBack;
    context.router.pushAndPopUntil(
      const SplashRouter(),
      predicate: (_) => false,
    );

    // NavigationService.pushAndRemoveUntil(
    //   page: canPop ? '/' : LoginScreen.routeName,
    //   isNamed: true,
    //   predicate: (_) => false,
    // );
    Phoenix.rebirth(context);
  }

  String _currentLanguage = localization.currentLanguage.toString();
  String get currentLanguage => _currentLanguage;

  void chooseLanguage(
    String? code,
    BuildContext context,
  ) {
    if (code == null || code == Helper.currentLanguage) {
      context.router.pop();
      return;
    }
    _currentLanguage = code;
    emit(
      ChosenLanguage(
        language: code,
      ),
    );
    changeLanguage(
      context: context,
    );
  }

  List<Languages> langs = [
    Languages(
      language: 'العربية',
      code: 'ar',
      flag: 'assets/icons/lang/arabic.png',
    ),
    Languages(
      language: 'English',
      code: 'en',
      flag: 'assets/icons/lang/english.png',
    ),
  ];
}

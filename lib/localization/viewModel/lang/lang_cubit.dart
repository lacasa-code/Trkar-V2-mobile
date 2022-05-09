import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_storage/get_storage.dart';
import '../../../auth/view/login_screen.dart';
import '../../../core/helper/navigator.dart';

import '../../../../core/helper/app_localization.dart';
import '../../model/language_model.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());
  Future<void> changeLanguage({
    required BuildContext context,
    required bool canPop,
  }) async {
    emit(
      LoadingState(),
    );
    await GetStorage().write(
      'language',
      _currentLanugage,
    );
    await GetStorage().write(
      'lang',
      true,
    );
    await localization.setNewLanguage(
      _currentLanugage,
      true,
    );
    emit(
      ChosenLanguage(
        language: _currentLanugage,
      ),
    );
    NavigationService.pushAndRemoveUntil(
      page: canPop
          ?  '/'
          : LoginScreen.routeName,
          isNamed: true,
      predicate: (_) => false,
    );
    Phoenix.rebirth(context);
  }

  String _currentLanugage = localization.currentLanguage.toString();
  String get currentLanguage => _currentLanugage;

  void chooseLanguage(String code) {
    _currentLanugage = code;
    emit(
      ChosenLanguage(
        language: code,
      ),
    );
  }

  List<Languages> langs = [
    Languages(
      language: 'العربية',
      code: 'ar',
      flag: 'assets/icons/lang/ar.png',
    ),
    Languages(
      language: 'English',
      code: 'en',
      flag: 'assets/icons/lang/en.png',
    ),
  ];
}

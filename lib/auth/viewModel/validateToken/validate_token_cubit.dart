import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/auth/view/login_screen.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../../repo/validate_token_repo.dart';
import '../../repo/refresh_token_repo.dart';

part 'validate_token_state.dart';

class ValidateTokenCubit extends Cubit<ValidateTokenState> {
  ValidateTokenCubit() : super(ValidateTokenInitial());
  Future<void> validateToken(context) async {
    var validateTokenData = await ValidateTokenRepo.validateToken(context);
    if (validateTokenData == null) {
      return;
    }

    if (validateTokenData.data == false) {
      NavigationService.pushReplacementAll(
        page: LoginScreen.routeName,
      );
    }
  }
  Future<void> refreshToken(context) async {
    var refreshTokenData = await RefreshTokenRepo.refreshToken(context);
    if (refreshTokenData == null) {
      return;
    }

    if (refreshTokenData.status==true) {
      await Helper.storeNewUserData(refreshTokenData);
      
    }
  }
}

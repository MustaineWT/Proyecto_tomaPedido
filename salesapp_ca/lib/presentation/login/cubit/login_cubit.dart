import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/domain/exceptions/auth_exception.dart';
import 'package:salesapp_ca/domain/usercase/auth_usecase.dart';
import 'package:salesapp_ca/utils/colors_constants.dart';

enum LoginState {
  none,
  typing,
  existing_user,
  error,
  failed,
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authUseCase) : super(LoginState.none);
  final AuthUseCase _authUseCase;

  void init() async {
    final result = await _authUseCase.onInit();
    if (result) {
      emit(LoginState.existing_user);
    } else {
      emit(LoginState.none);
    }
  }

  void onSubmit() async {
    try {
      final result = await _authUseCase.onSubmit();
      CircularProgressIndicator(
          strokeWidth: 5, valueColor: new AlwaysStoppedAnimation<Color>(gray));
      await Future.delayed(Duration(seconds: 4));

      emit(LoginState.none);

      if (result == true) {
        emit(LoginState.existing_user);
      } else {
        emit(LoginState.failed);
      }
    } on AuthException catch (ex) {
      if (ex.error == AuthErrorCode.not_server) {
        emit(LoginState.error);
      } else if (ex.error == AuthErrorCode.not_auth) {
        emit(LoginState.failed);
      } else if (ex.error == AuthErrorCode.not_typing) {
        emit(LoginState.typing);
      } else {
        emit(LoginState.none);
      }
    }
  }
}

class LoginCubitLogout extends Cubit<LoginState> {
  LoginCubitLogout(this._authUseCase) : super(LoginState.none);
  final AuthUseCase _authUseCase;

  void onLogout() async {
    await _authUseCase.onLogout();
    emit(LoginState.none);
  }
}

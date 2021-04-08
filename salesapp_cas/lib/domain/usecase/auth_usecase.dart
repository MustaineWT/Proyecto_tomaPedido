import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/logs.dart';
import '../../domain/exceptions/auth_exception.dart';
import '../../domain/repositories/local/local_auth_repository.dart';
import '../../domain/repositories/remote/authentication_repository.dart';

class AuthUseCase {
  AuthUseCase(this._authenticationRepository, this._localAuthRepository);
  final AuthenticationRepository _authenticationRepository;
  final LocalAuthRepository _localAuthRepository;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String _username = '', _password = '';

  void changedUserName(String username) {
    _username = username;
  }

  void changedPassword(String password) {
    _password = password;
  }

  Future<int> onInit() async {
    await Future.delayed(Duration(seconds: 3));
    final requestToken = await _localAuthRepository.getSession();
    return requestToken;
  }

  Future<String> onSubmit() async {
    await Future.delayed(Duration(seconds: 3));
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      try {
        final authRequestToken = await _authenticationRepository
            .validateWithLogin(_username, _password);
        if (authRequestToken.status) {
          await _localAuthRepository.setSession(authRequestToken);
          return 'entry';
        } else {
          return 'not entry';
        }
      } on DioError catch (dioError) {
        Logs.p.e(dioError);
        throw AppException.fromDioError(dioError);
      }
    } else {
      return 'typing';
    }
  }

  Future<bool> onLogout() async {
    await _authenticationRepository.logoutSession();
    return true;
  }

  onDispose() {
    usernameController.clear();
    passwordController.clear();
  }
}

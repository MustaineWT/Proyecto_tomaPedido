import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_ca/data/models/responses/requestToken.dart';
import 'package:salesapp_ca/domain/exceptions/auth_exception.dart';
import 'package:salesapp_ca/domain/repositories/local/local_auth_repository.dart';
import 'package:salesapp_ca/domain/repositories/remote/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> onInit() async {
    final requestToken = await _localAuthRepository.getSession();
    if (requestToken) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> onSubmit() async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      try {
        final authRequestToken = await _authenticationRepository
            .validateWithLogin(_username, _password);
        if (authRequestToken.status == true) {
          await _localAuthRepository.setSession(authRequestToken);
          return true;
        }
        throw AuthException(AuthErrorCode.not_auth);
      } catch (e) {
        if (e is DioError) {
          if (e.response!.statusCode == 400) {
            throw AuthException(AuthErrorCode.not_auth);
          }
          throw AuthException(AuthErrorCode.not_server);
        }
        throw AuthException(AuthErrorCode.not_auth);
      }
    }
    throw AuthException(AuthErrorCode.not_typing);
  }

  Future<bool> onLogout() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.clear();
    return true;
  }
}

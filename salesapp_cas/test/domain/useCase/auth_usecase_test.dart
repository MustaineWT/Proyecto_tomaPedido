import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salesapp_cas/domain/usecase/auth_usecase.dart';
import 'package:salesapp_cas/helpers/DependencyInjection.dart';
import 'package:salesapp_cas/helpers/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.initialize();

  group('AuthUseCase', () {
    test('onInit valid sessión', () async {
      final _getAuthUseCases = _getAuthUseCase();
      final int _getOnInitTk = await _getAuthUseCases.onInit();
      //expect(_getOnInitTk, 0); //Not token
      //expect(_getOnInitTk, 1); //Not token
      expect(_getOnInitTk, 2); //Not token
    });
    test('onSubmit valid session not with credential', () async {
      final _getAuthUseCases = _getAuthUseCase();
      final String _getOnSubmit = await _getAuthUseCases.onSubmit();

      expect(_getOnSubmit, 'typing'); //Not token
    });
    test(
        'onSubmit valid session with credential incorrect and typing controllers',
        () async {
      final _getAuthUseCases = _getAuthUseCase();
      _getAuthUseCases.usernameController.text = 'wtorr';
      _getAuthUseCases.passwordController.text = '1234';
      _getAuthUseCases.changedUserName('wtorr');
      _getAuthUseCases.changedPassword('1234');
      final String _getOnSubmit = await _getAuthUseCases.onSubmit();

      expect(_getOnSubmit, 'not entry'); //Not token
    });
    test('onSubmit valid session with credential correct', () async {
      final _getAuthUseCases = _getAuthUseCase();
      _getAuthUseCases.usernameController.text = 'wtorres';
      _getAuthUseCases.passwordController.text = '123456';
      _getAuthUseCases.changedUserName('wtorres');
      _getAuthUseCases.changedPassword('123456');
      final String _getOnSubmit = await _getAuthUseCases.onSubmit();

      expect(_getOnSubmit, 'entry'); //Not token
    });
    test('onLogout clear session to sharedpreferences', () async {
      final _getAuthUseCases = _getAuthUseCase();
      final bool _getOnSubmit = await _getAuthUseCases.onLogout();

      expect(_getOnSubmit, true); //Not token
    });
  });
}

AuthUseCase _getAuthUseCase() => Get.i.find<AuthUseCase>();

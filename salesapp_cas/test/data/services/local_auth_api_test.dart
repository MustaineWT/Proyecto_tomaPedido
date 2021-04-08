import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salesapp_cas/data/services/local/local_auth_api.dart';
import 'package:salesapp_cas/helpers/DependencyInjection.dart';
import 'package:salesapp_cas/helpers/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.initialize();
  test('get valid credential is true or not', () async {
    final _getLocalAuthApi = _getSession();
    final int _getSessiontk = await _getLocalAuthApi.getSession();
    expect(_getSessiontk, 2); //Not token
  });
}

LocalAuthApi _getSession() => Get.i.find<LocalAuthApi>();

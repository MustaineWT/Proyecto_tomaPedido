import 'package:flutter_test/flutter_test.dart';
import 'package:salesapp_cas/data/services/local/local_auth_api.dart';

void main() {
  test('get valid credential is true or not', () async {
    final getSession = _getSession();
    final int _getSessiontk = await getSession.getSession();
    expect(_getSessiontk, 1); //Not token
  });
}

LocalAuthApi _getSession() => LocalAuthApi();

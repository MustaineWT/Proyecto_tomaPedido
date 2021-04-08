import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/responses/requestToken.dart';
import '../../../domain/repositories/local/local_auth_repository.dart';

const KEY = "session";

class LocalAuthApi extends LocalAuthRepository {
  SharedPreferences _preferences;
  LocalAuthApi(this._preferences);

  static const KEY = "session";
  @override
  Future<void> clearSession() async {
    await _preferences.remove(KEY);
  }

  Future<int> getSession() async {
    final String? data = _preferences.get(KEY) as String?;

    if (data != null) {
      final RequestToken requestToken = RequestToken.fromJson(jsonDecode(data));
      final DateTime currentDate = DateTime.now();
      final DateTime createdAt = requestToken.createAt!;
      final int expiresIn = requestToken.expire!;
      final int diff = currentDate.difference(createdAt).inSeconds;

      if (expiresIn - diff >= 30) {
        return 1;
      } else {
        return 0;
      }
    }
    return 2;
  }

  Future<RequestToken> getUserSession() async {
    final String? data = _preferences.get(KEY) as String?;
    final RequestToken requestToken = RequestToken.fromJson(jsonDecode(data!));
    return requestToken;
  }

  Future<RequestToken> setSession(RequestToken requestToken) async {
    await _preferences.setString(KEY, jsonEncode(requestToken.toJson()));
    return requestToken;
  }
}

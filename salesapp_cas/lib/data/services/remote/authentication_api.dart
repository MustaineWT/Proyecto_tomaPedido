import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/logs.dart';
import '../../../data/models/responses/requestToken.dart';
import '../../../domain/repositories/remote/authentication_repository.dart';

class AuthenticationApi extends AuthenticationRepository {
  final Dio _dio;

  AuthenticationApi(this._dio);
  Future<RequestToken> validateWithLogin(
      String username, String password) async {
    final response = await _dio.post(
      '/login',
      data: {"usuario": username, "password": password},
    );
    Logs.p.i(response.data);
    return RequestToken.fromJson(response.data);
  }

  @override
  Future<void> logoutSession() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.clear();
  }
}

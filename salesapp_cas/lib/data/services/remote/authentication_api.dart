import 'package:dio/dio.dart';
import 'package:salesapp_cas/utils/logs.dart';
import '../../../data/models/responses/requestToken.dart';
import '../../../domain/repositories/remote/authentication_repository.dart';
import '../../../utils/dio.dart';

class AuthenticationApi extends AuthenticationRepository {
  final Dio _dio = dio;

  Future<RequestToken> validateWithLogin(
      String username, String password) async {
    final response = await _dio.post(
      '/login',
      data: {"usuario": username, "password": password},
    );
    Logs.p.i(response.data);
    return RequestToken.fromJson(response.data);
  }
}

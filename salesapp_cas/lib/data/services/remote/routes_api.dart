import 'package:dio/dio.dart';
import 'package:salesapp_cas/data/models/responses/requestToken.dart';
import 'package:salesapp_cas/data/models/route/routes.dart';
import 'package:salesapp_cas/domain/repositories/remote/route_repository.dart';
import 'package:salesapp_cas/utils/logs.dart';

class RoutesApi extends RouteRepository {
  final Dio _dio;

  RoutesApi(this._dio);
  @override
  Future<RequestToken> registerRoute(
      token,
      int companyId,
      int branchOfficeId,
      String route,
      String description,
      String zone,
      int mo,
      int tu,
      int we,
      int th,
      int fr,
      int sa,
      int su,
      String ffvv) async {
    final response = await _dio.post(
      '/Route',
      data: {
        'CompanyId': companyId,
        'BranchOfficeId': branchOfficeId,
        'Route': route,
        'Description': description,
        'Zone': zone,
        'Mo': zone,
        'Tu': zone,
        'We': zone,
        'Th': zone,
        'Fr': zone,
        'Sa': zone,
        'Su': zone,
        'Ffvv': ffvv
      },
      options: Options(
        headers: {
          'token': token, // set content-length
        },
      ),
    );
    Logs.p.i(response.data);
    return RequestToken.fromJson(response.data);
  }

  @override
  Future<List<Routes>> getRoute(
      token, int companyId, int branchOfficeId) async {
    final response = await _dio.get(
      '/Route',
      queryParameters: {
        'CompanyId': companyId,
        'BranchOfficeId': branchOfficeId,
      },
      options: Options(
        headers: {
          'token': token, // set content-length
        },
      ),
    );
    Logs.p.i(response.data);
    return (response.data['route'] as List)
        .map((e) => Routes.fromJson(e))
        .toList();
  }
}

import 'package:dio/dio.dart';
import 'package:salesapp_cas/data/models/responses/requestToken.dart';
import 'package:salesapp_cas/data/models/zone/zone.dart';
import 'package:salesapp_cas/domain/repositories/remote/zone_repository.dart';
import 'package:salesapp_cas/utils/logs.dart';

class ZoneApi extends ZoneRepository {
  final Dio _dio;

  ZoneApi(this._dio);
  @override
  Future<RequestToken> registerZone(token, int companyId, int branchOfficeId,
      String zone, String description, int ffvv) async {
    final response = await _dio.post(
      '/Zone',
      data: {
        'CompanyId': companyId,
        'BranchOfficeId': branchOfficeId,
        'Zone': zone,
        'Description': description,
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
  Future<List<Zone>> getZone(token, int companyId, int branchOfficeId) async {
    final response = await _dio.get(
      '/Zone',
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
    return (response.data['zone'] as List)
        .map((e) => Zone.fromJson(e))
        .toList();
  }

  @override
  Future<RequestToken> deleteZone(
      token, int companyId, int branchOfficeId, String zone) async {
    final response = await _dio.delete(
      '/Zone',
      data: {
        'CompanyId': companyId,
        'BranchOfficeId': branchOfficeId,
        'zone': zone
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
}

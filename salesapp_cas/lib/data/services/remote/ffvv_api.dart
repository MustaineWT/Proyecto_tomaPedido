import 'package:dio/dio.dart';
import 'package:salesapp_cas/data/models/ffvv/ffvv.dart';
import 'package:salesapp_cas/data/models/responses/requestToken.dart';
import 'package:salesapp_cas/domain/repositories/remote/ffvv_repository.dart';
import 'package:salesapp_cas/utils/logs.dart';

class FfvvApi extends FfvvRepository {
  final Dio _dio;

  FfvvApi(this._dio);
  @override
  Future<RequestToken> registerFfvv(token, int companyId, int branchOfficeId,
      int ffvv, String description) async {
    final response = await _dio.post(
      '/Ffvv',
      data: {
        'CompanyId': companyId,
        'BranchOfficeId': branchOfficeId,
        'Ffvv': ffvv,
        'Description': description
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
  Future<List<Ffvv>> getFfvv(token, int companyId, int branchOfficeId) async {
    final response = await _dio.get(
      '/Ffvv',
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
    return (response.data['ffvv'] as List)
        .map((e) => Ffvv.fromJson(e))
        .toList();
  }

  @override
  Future<RequestToken> deleteFfvv(
      token, int companyId, int branchOfficeId, int ffvv) async {
    final response = await _dio.delete(
      '/Ffvv',
      data: {
        'CompanyId': companyId,
        'BranchOfficeId': branchOfficeId,
        'ffvv': ffvv
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

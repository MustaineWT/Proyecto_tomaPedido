import 'package:dio/dio.dart';
import 'package:salesapp_cas/data/models/responses/requestToken.dart';
import 'package:salesapp_cas/data/models/seller/seller.dart';
import 'package:salesapp_cas/domain/repositories/remote/seller_repository.dart';
import 'package:salesapp_cas/utils/logs.dart';

class SellerApi extends SellerRepository {
  final Dio _dio;

  SellerApi(this._dio);
  @override
  Future<RequestToken> registerSeller(
      token,
      int companyId,
      int branchOfficeId,
      String name,
      String lastName,
      String direction,
      String city,
      String country,
      String dni,
      String phone,
      String email,
      int typePersonaid,
      String user,
      String password) async {
    final response = await _dio.post(
      '/UserSeller',
      data: {
        'CompanyId': companyId,
        'BranchOfficeId': branchOfficeId,
        'Name': name,
        'LastName': lastName,
        'Direction': direction,
        'City': city,
        'Country': country,
        'Dni': dni,
        'Phone': phone,
        'Email': email,
        'TypePersonId': typePersonaid,
        'User': user,
        'Password': password
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
  Future<List<Seller>> getSeller(
      token, int companyId, int branchOfficeId) async {
    final response = await _dio.get(
      '/UserSeller',
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
    return (response.data['seller'] as List)
        .map((e) => Seller.fromJson(e))
        .toList();
  }
}

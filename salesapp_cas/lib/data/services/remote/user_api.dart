import 'package:dio/dio.dart';
import 'package:salesapp_cas/data/models/user.dart';
import '../../../utils/logs.dart';
import '../../models/responses/requestToken.dart';
import '../../../domain/repositories/remote/user_repository.dart';

class UserApi extends UserRepository {
  final Dio _dio;
  UserApi(this._dio);
  Future<RequestToken> registerUser(
      String bussinesName,
      String ruc,
      String direction,
      String city,
      String country,
      String phone,
      String emailCompany,
      String name,
      String lastName,
      String dni,
      int typePersonaid,
      String emailAdmin,
      String directionAdmin,
      String cityAdmin,
      String countryAdmin,
      String user,
      String password) async {
    final response = await _dio.post(
      '/UserAdmin',
      data: {
        'BussinesName': bussinesName,
        'Ruc': ruc,
        'Direction': direction,
        'City': city,
        'Country': country,
        'Phone': phone,
        'EmailCompany': emailCompany,
        'Name': name,
        'LastName': lastName,
        'Dni': dni,
        'TypePersonId': typePersonaid,
        'EmailAdmin': emailAdmin,
        'DirectionAdmin': directionAdmin,
        'CityAdmin': cityAdmin,
        'CountryAdmin': countryAdmin,
        'User': user,
        'Password': password
      },
    );
    Logs.p.i(response.data);
    return RequestToken.fromJson(response.data);
  }

  Future<User> getUser(token, int personid) async {
    final response = await _dio.get(
      '/User',
      queryParameters: {
        'personid': personid,
      },
      options: Options(
        headers: {
          'token': token, // set content-length
        },
      ),
    );
    Logs.p.i(response.data);
    return User.fromJson(response.data);
  }
}

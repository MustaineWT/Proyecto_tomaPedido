import 'package:dio/dio.dart';
import 'package:salesapp_cas/utils/logs.dart';
import '../../models/responses/requestToken.dart';
import '../../../domain/repositories/remote/useradmin_repository.dart';
import '../../../utils/dio.dart';

class UserAdminApi extends UserAdminRepository {
  final Dio _dio = dio;

  Future<RequestToken> registerUserAdmin(
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
        "BussinesName": bussinesName,
        "Ruc": ruc,
        "Direction": direction,
        "City": city,
        "Country": country,
        "Phone": phone,
        "EmailCompany": emailCompany,
        "Name": name,
        "LastName": lastName,
        "Dni": dni,
        "TypePersonId": typePersonaid,
        "EmailAdmin": emailAdmin,
        "DirectionAdmin": directionAdmin,
        "CityAdmin": cityAdmin,
        "CountryAdmin": countryAdmin,
        "User": user,
        "Password": password
      },
    );
    Logs.p.i(response.data);
    return RequestToken.fromJson(response.data);
  }
}

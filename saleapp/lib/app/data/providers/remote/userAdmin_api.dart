import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:saleapp/app/data/models/responses/responseprocess.dart';

class UserAdminAPI {
  final Dio _dio = Get.find<Dio>();

  Future<ResponseProcess> onRegisterUserAdmin(
      {required String name,
      required String lastname,
      required String bussinesname,
      required String ruc,
      required String direction,
      required String city,
      required String country,
      required String dni,
      required String phone,
      required String emailcompany,
      required int typepersonid,
      required String emailadmin,
      required String directionadmin,
      required String cityadmin,
      required String countryadmin,
      required String user,
      required String password}) async {
    final response = await _dio.post(
      '/UserAdmin',
      data: {
        'Name': name,
        'LastName': lastname,
        'BussinesName': bussinesname,
        'Ruc': ruc,
        'Direction': direction,
        'City': city,
        'Country': country,
        'Dni': dni,
        'Phone': phone,
        'EmailCompany': emailcompany,
        'TypePersonId': typepersonid,
        'EmailAdmin': emailadmin,
        'DirectionAdmin': directionadmin,
        'CityAdmin': cityadmin,
        'CountryAdmin': countryadmin,
        'User': user,
        'Password': password
      },
      /* options: Options(
        headers: {
          'token': token, // set content-length
        },
      ), */
    );
    return ResponseProcess.fromJson(response.data);
  }
}

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:saleapp/app/data/models/responses/responseprocess.dart';
import 'package:saleapp/app/data/models/client.dart';

class ClientAPI {
  final Dio _dio = Get.find<Dio>();

  Future<List<Client?>> getClient(
      {required token, required companyid, required branchofficeid}) async {
    final response = await _dio.get(
      '/client',
      queryParameters: {
        'companyid': companyid,
        'branchofficeid': branchofficeid
      },
      options: Options(
        headers: {
          'token': token, // set content-length
        },
      ),
    );
    return (response.data['listclient'] as List)
        .map((e) => Client?.fromJson(e))
        .toList();
  }

  Future<ResponseProcess> onRegisterContacto(
      {required token,
      required int id,
      required String compania,
      required String sucursal,
      required String nombrecompleto,
      required int pais,
      required int tipocontacto,
      required String nombrecontacto,
      required String correocontacto,
      required String telefonocontacto,
      required int division,
      required int volumen,
      required String usercreateat,
      required String userupdateat}) async {
    final response = await _dio.post(
      '/client',
      data: {
        'id': id,
        'compania': compania,
        'sucursal': sucursal,
        'nombrecompleto': nombrecompleto,
        'pais': pais,
        'tipocontacto': tipocontacto,
        'nombrecontacto': nombrecontacto,
        'correocontacto': correocontacto,
        'telefonocontacto': telefonocontacto,
        'division': division,
        'volumen': volumen,
        'usercreate_at': usercreateat,
        'userupdate_at': userupdateat
      },
      options: Options(
        headers: {
          'token': token, // set content-length
        },
      ),
    );
    return ResponseProcess.fromJson(response.data);
  }
}

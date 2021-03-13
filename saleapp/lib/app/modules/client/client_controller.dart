import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saleapp/app/data/models/client.dart';
import 'package:saleapp/app/data/repositories/local/local_auth_repository.dart';
import 'package:saleapp/app/data/repositories/remote/client_repository.dart';
import 'package:saleapp/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final ClientRepository _clientRepository = Get.find<ClientRepository>();

  List<Client?> _listClient = [];
  List<Client?> get listWidgets => _listClient;

  @override
  void onReady() {
    onLoadClient();
  }

  Future<String?> onLoadClient() async {
    print('ingreso');
    try {
      final requestToken = await _localAuthRepository.session;
      _listClient = await _clientRepository.getClient(
          token: requestToken!.token, companyid: 1, branchofficeid: 2);
      update();
      return 'Terminado';
    } catch (e) {
      print(e);
    }
  }

  /* Future<String> onRegisterUsuario() async {
    try {
      String _procesado = '';
      final RequestTokenModel requestToken = await _localAuthRepository.session;
      _responseProcess = await _empleadoRepository.onRegisterEmpleado(
          token: requestToken.token,
          id: 0,
          compania: '0001',
          sucursal: '01',
          nombres: _nombres,
          apellidopa: _apellidopa,
          apellidoma: _apellidoma,
          dni: _dni,
          direccion: _direccion,
          distrito: _distrito,
          provincia: _provincia,
          pais: _pais,
          telefono: _telefono,
          email: _email,
          estado: 'A',
          usercreateat: 'WTORRES',
          userupdateat: 'WTORRES');
      _procesado = _responseProcess.message;

      return _procesado;
    } catch (e) {
      print(e);
      String message = "";
      if (e is DioError) {
        if (e.response != null) {
          message = e.response.data['err']['message'];
        } else {
          message = e.response.statusMessage;
        }
      }
      Get.dialog(
        AlertDialog(
          title: Text("Información del Sistema"),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      );
    }
  } */

  Future<void> onLogout() async {
    Get.dialog(
      AlertDialog(
        title: Text("Información del Sistema"),
        content: Text('¿Desea salir del sistema?'),
        actions: [
          TextButton(
            child: Text("Si"),
            onPressed: () async {
              SharedPreferences _storage =
                  await SharedPreferences.getInstance();
              await _storage.clear();
              Get.offNamedUntil(AppRoutes.LOGIN, (_) => false);
            },
          ),
          TextButton(
            child: Text("No"),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}

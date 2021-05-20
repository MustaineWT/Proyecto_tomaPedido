import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_cas/data/datasource/userdb.dart';
import 'package:salesapp_cas/data/datasource/zonedb.dart';
import 'package:salesapp_cas/data/models/zone/zone.dart';
import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/repositories/local/local_auth_repository.dart';
import 'package:salesapp_cas/domain/repositories/remote/authentication_repository.dart';
import 'package:salesapp_cas/domain/repositories/remote/zone_repository.dart';
import 'package:salesapp_cas/utils/logs.dart';

class ZoneUseCase {
  ZoneUseCase(this._zoneRepository, this._localAuthRepository, this._zoneDB,
      this._userDB, this._authenticationRepository);
  final ZoneRepository _zoneRepository;
  final LocalAuthRepository _localAuthRepository;
  final AuthenticationRepository _authenticationRepository;
  final ZoneDB _zoneDB;
  final UserDB _userDB;

  final descriptionController = TextEditingController();
  final zoneController = TextEditingController();
  final ffvvController = TextEditingController();

  String _description = '';
  String _zone = '';
  int _ffvv = 0;

  void changedDescription(String description) {
    _description = description;
  }

  void changedFfvv(String ffvv) {
    _ffvv = int.parse(ffvv);
  }

  void changedZone(String zone) {
    _zone = zone;
  }

  Future<String> registerZone() async {
    //*Registra en la Api.
    await Future.delayed(Duration(seconds: 3));
    final requestToken = await _localAuthRepository.getUserSession();

    if (zoneController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        ffvvController.text.isNotEmpty) {
      List user = await _userDB.getAllUsers();
      int _companyId = user[0].companyId;
      int _branchOfficeId = user[0].branchOfficeId;
      try {
        final response = await _zoneRepository.registerZone(requestToken.token,
            _companyId, _branchOfficeId, _zone, _description, _ffvv);
        if (response.status) {
          final zone = Zone(
              companyId: _companyId,
              branchOfficeId: _branchOfficeId,
              zone: _zone,
              description: _description,
              ffvv: _ffvv,
              state: 'A');
          await registerZoneDB(zone);
          if (response.message == 'Proceso Completado.') {
            cleanController();
          }
        }

        return response.message!;
      } on DioError catch (dioError) {
        Logs.p.e(dioError);
        if (dioError.response!.statusCode! == 400) {
          _authenticationRepository.logoutSession();
        }
        throw AppException.fromDioError(dioError);
      }
    } else {
      return 'Debe llenar todos los datos.';
    }
  }

  /*  getRouteDB() async {
    *Obtiene todos los datos del Hive.
    try {
      final route = await _routesDB.getAllRoutes();
      if (route != null) {
        return route;
      }
    } on DioError catch (dioError) {
      Logs.p.e(dioError);
      throw AppException.fromDioError(dioError);
    }
  } */

  disposeZoneDB() async {
    await _zoneDB.disposeZone();
  }

  openZoneDB() async {
    await _zoneDB.openBoxZoneDB();
  }

  registerZoneDB(Zone zone) async {
    //*los registra en Hive
    await _zoneDB.addZone(zone);
    return zone;
  }

  deleteFfvvDB(int index) async {
    final requestToken = await _localAuthRepository.getUserSession();
    List _user = await _userDB.getAllUsers();
    int _companyId = _user[0].companyId;
    int _branchOfficeId = _user[0].branchOfficeId;
    final Zone result = await _zoneDB.getZone(index);
    try {
      final response = await _zoneRepository.deleteZone(
          requestToken.token, _companyId, _branchOfficeId, result.zone);
      if (response.message == 'Proceso Completado.') {
        await _zoneDB.deleteZone(index);
      } else {
        return 'Error de Servidor';
      }
      return response.message;
    } on DioError catch (dioError) {
      Logs.p.e(dioError);
      if (dioError.response!.statusCode! == 400) {
        _authenticationRepository.logoutSession();
      }
      throw AppException.fromDioError(dioError);
    }
  }

  registerAllWithFfvvDB() async {
    //*Obtiene todos los Sellers del Api y los registra en Hive
    final requestToken = await _localAuthRepository.getUserSession();
    List _user = await _userDB.getAllUsers();
    int _companyId = _user[0].companyId;
    int _branchOfficeId = _user[0].branchOfficeId;
    try {
      List<Zone> zone = await _zoneRepository.getZone(
        requestToken.token,
        _companyId,
        _branchOfficeId,
      );
      // ignore: unnecessary_null_comparison
      if (zone != null) {
        for (int i = 0; i < zone.length; i++) {
          await _zoneDB.addZone(zone[i]);
        }
        return zone;
      }
    } on DioError catch (dioError) {
      Logs.p.e(dioError);
      if (dioError.response!.statusCode! == 400) {
        _authenticationRepository.logoutSession();
      }
      throw AppException.fromDioError(dioError);
    }
  }

  cleanController() {
    descriptionController.clear();
    ffvvController.clear();
    descriptionController.text = '';
    ffvvController.text = '';
    _description = '';
    _ffvv = 0;
    _zone = '';
  }
}

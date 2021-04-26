import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_cas/data/datasource/routesdb.dart';
import 'package:salesapp_cas/data/datasource/userdb.dart';
import 'package:salesapp_cas/data/models/route/routes.dart';
import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/repositories/local/local_auth_repository.dart';
import 'package:salesapp_cas/domain/repositories/remote/route_repository.dart';
import 'package:salesapp_cas/utils/logs.dart';

class RoutesUseCase {
  RoutesUseCase(this._routeRepository, this._localAuthRepository,
      this._routesDB, this._userDB);
  final RouteRepository _routeRepository;
  final LocalAuthRepository _localAuthRepository;
  final RoutesDB _routesDB;
  final UserDB _userDB;

  final routeController = TextEditingController();
  final descriptionController = TextEditingController();
  final zoneController = TextEditingController();
  final ffvvController = TextEditingController();

  String _route = '', _description = '', _zone = '', _ffvv = '';

  void changedRoute(String route) {
    _route = route;
  }

  void changedDescription(String description) {
    _description = description;
  }

  void changedZone(String zone) {
    _zone = zone;
  }

  void changedFfvv(String ffvv) {
    _ffvv = ffvv;
  }

  Future<String> registerRoute() async {
    //*Registra en la Api.
    await Future.delayed(Duration(seconds: 3));
    final requestToken = await _localAuthRepository.getUserSession();

    if (routeController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        zoneController.text.isNotEmpty &&
        ffvvController.text.isNotEmpty) {
      List user = await _userDB.getAllUsers();
      int _companyId = user[0].companyId;
      int _branchOfficeId = user[0].branchOfficeId;
      try {
        final response = await _routeRepository.registerRoute(
            requestToken.token,
            _companyId,
            _branchOfficeId,
            _route,
            _description,
            _zone,
            _ffvv);
        if (response.status) {
          final route = Routes(
              companyId: _companyId,
              branchOfficeId: _branchOfficeId,
              route: _route,
              description: _description,
              zone: _zone,
              ffvv: int.parse(_ffvv),
              state: 'A');
          await registerRouteDB(route);
        }
        return response.message!;
      } on DioError catch (dioError) {
        Logs.p.e(dioError);
        throw AppException.fromDioError(dioError);
      }
    } else {
      return 'Debe llenar todos los datos.';
    }
  }

  getRouteDB() async {
    //*Obtiene todos los datos del Hive.
    try {
      final route = await _routesDB.getAllRoutes();
      if (route != null) {
        return route;
      }
    } on DioError catch (dioError) {
      Logs.p.e(dioError);
      throw AppException.fromDioError(dioError);
    }
  }

  registerRouteDB(Routes route) async {
    //*los registra en Hive
    try {
      await _routesDB.addRoute(route);
    } on Exception catch (e) {
      print(e);
    }
    return route;
  }

  registerAllWithRouteDB() async {
    //*Obtiene todos los Sellers del Api y los registra en Hive
    final requestToken = await _localAuthRepository.getUserSession();
    List _user = await _userDB.getAllUsers();
    int _companyId = _user[0].companyId;
    int _branchOfficeId = _user[0].branchOfficeId;
    try {
      List<Routes> route = await _routeRepository.getRoute(
        requestToken.token,
        _companyId,
        _branchOfficeId,
      );
      // ignore: unnecessary_null_comparison
      if (route != null) {
        for (int i = 0; i < route.length; i++) {
          await _routesDB.addRoute(route[i]);
        }
        return route;
      }
    } on DioError catch (dioError) {
      Logs.p.e(dioError);
      throw AppException.fromDioError(dioError);
    }
  }
}

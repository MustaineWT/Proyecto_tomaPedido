import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_cas/data/datasource/ffvvdb.dart';
import 'package:salesapp_cas/data/datasource/userdb.dart';
import 'package:salesapp_cas/data/models/ffvv/ffvv.dart';
import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/repositories/local/local_auth_repository.dart';
import 'package:salesapp_cas/domain/repositories/remote/authentication_repository.dart';
import 'package:salesapp_cas/domain/repositories/remote/ffvv_repository.dart';
import 'package:salesapp_cas/utils/logs.dart';

class FfvvUseCase {
  FfvvUseCase(this._ffvvRepository, this._localAuthRepository, this._ffvvDB,
      this._userDB, this._authenticationRepository);
  final FfvvRepository _ffvvRepository;
  final LocalAuthRepository _localAuthRepository;
  final AuthenticationRepository _authenticationRepository;
  final FfvvDB _ffvvDB;
  final UserDB _userDB;

  final descriptionController = TextEditingController();
  final ffvvController = TextEditingController();

  String _description = '';
  int _ffvv = 0;

  void changedDescription(String description) {
    _description = description;
  }

  void changedFfvv(String ffvv) {
    _ffvv = int.parse(ffvv);
  }

  Future<String> registerFfvv() async {
    //*Registra en la Api.
    await Future.delayed(Duration(seconds: 3));
    final requestToken = await _localAuthRepository.getUserSession();

    if (descriptionController.text.isNotEmpty &&
        ffvvController.text.isNotEmpty) {
      List user = await _userDB.getAllUsers();
      int _companyId = user[0].companyId;
      int _branchOfficeId = user[0].branchOfficeId;
      try {
        final response = await _ffvvRepository.registerFfvv(requestToken.token,
            _companyId, _branchOfficeId, _ffvv, _description);
        if (response.status) {
          final ffvv = Ffvv(
              companyId: _companyId,
              branchOfficeId: _branchOfficeId,
              ffvv: _ffvv,
              description: _description,
              state: 'A');
          await registerFfvvDB(ffvv);
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

  disposeFfvvDB() async {
    await _ffvvDB.disposeFfvv();
  }

  openFfvvDB() async {
    await _ffvvDB.openBoxFfvvDB();
  }

  registerFfvvDB(Ffvv ffvv) async {
    //*los registra en Hive
    await _ffvvDB.addFfvv(ffvv);
    return ffvv;
  }

  deleteFfvvDB(int index) async {
    final requestToken = await _localAuthRepository.getUserSession();
    List _user = await _userDB.getAllUsers();
    int _companyId = _user[0].companyId;
    int _branchOfficeId = _user[0].branchOfficeId;
    final Ffvv result = await _ffvvDB.getFfvv(index);
    try {
      final response = await _ffvvRepository.deleteFfvv(
          requestToken.token, _companyId, _branchOfficeId, result.ffvv);
      if (response.message == 'Proceso Completado.') {
        await _ffvvDB.deleteFfvv(index);
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
      List<Ffvv> ffvv = await _ffvvRepository.getFfvv(
        requestToken.token,
        _companyId,
        _branchOfficeId,
      );
      // ignore: unnecessary_null_comparison
      if (ffvv != null) {
        for (int i = 0; i < ffvv.length; i++) {
          await _ffvvDB.addFfvv(ffvv[i]);
        }
        return ffvv;
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
  }
}

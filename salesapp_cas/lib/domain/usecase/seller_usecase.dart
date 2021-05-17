import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_cas/data/datasource/sellerdb.dart';
import 'package:salesapp_cas/data/datasource/userdb.dart';
import 'package:salesapp_cas/data/models/seller/seller.dart';
import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/repositories/local/local_auth_repository.dart';
import 'package:salesapp_cas/domain/repositories/remote/authentication_repository.dart';
import 'package:salesapp_cas/domain/repositories/remote/seller_repository.dart';
import 'package:salesapp_cas/utils/logs.dart';

class SellerUseCase {
  SellerUseCase(this._sellerRepository, this._localAuthRepository,
      this._sellerDB, this._userDB, this._authenticationRepository);
  final SellerRepository _sellerRepository;
  final LocalAuthRepository _localAuthRepository;
  final AuthenticationRepository _authenticationRepository;
  final SellerDB _sellerDB;
  final UserDB _userDB;

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final directionController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final dniController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  String _name = '',
      _lastName = '',
      _direction = '',
      // ignore: unused_field
      _city = '',
      _country = '',
      _dni = '',
      _phone = '',
      _email = '',
      // ignore: unused_field
      _typePersonid = '',
      _user = '',
      _password = '';

  void changedName(String name) {
    _name = name;
  }

  void changedLastName(String lastName) {
    _lastName = lastName;
  }

  void changedDirection(String direction) {
    _direction = direction;
  }

  void changedCity(String city) {
    _city = city;
  }

  void changedCountry(String country) {
    _country = country;
  }

  void changedDni(String dni) {
    _dni = dni;
  }

  void changedPhone(String phone) {
    _phone = phone;
  }

  void changedEmail(String email) {
    _email = email;
  }

  void changedUser(String user) {
    _user = user;
  }

  void changedPassword(String password) {
    _password = password;
  }

  Future<String> registerSeller() async {
    //*Registra en la Api.
    await Future.delayed(Duration(seconds: 3));
    final requestToken = await _localAuthRepository.getUserSession();

    if (nameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        directionController.text.isNotEmpty &&
        countryController.text.isNotEmpty &&
        dniController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        userController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      List user = await _userDB.getAllUsers();
      int _companyId = user[0].companyId;
      int _branchOfficeId = user[0].branchOfficeId;
      try {
        final response = await _sellerRepository.registerSeller(
          requestToken.token,
          _companyId,
          _branchOfficeId,
          _name,
          _lastName,
          _direction,
          'Peru',
          _country,
          _dni,
          _phone,
          _email,
          3,
          _user,
          _password,
        );
        if (response.status) {
          final seller = Seller(
              companyId: _companyId,
              branchOfficeId: _branchOfficeId,
              personId: requestToken.personid!,
              name: _name,
              lastName: _lastName,
              dni: _dni,
              phone: _phone,
              description: 'Vendedor',
              email: _email,
              direction: _direction,
              city: 'Peru',
              country: _country,
              state: 'A');
          await registerSellerDB(seller);
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

  /* getSellerDB() async {
    *Obtiene todos los datos del Hive.
    try {
      final seller = await _sellerDB.getAllSellers();
      if (seller != null) {
        return seller;
      }
    } on DioError catch (dioError) {
      Logs.p.e(dioError);
      throw AppException.fromDioError(dioError);
    }
  } */
  disposeSellerDB() async {
    await _sellerDB.disposeSeller();
  }

  openSellerDB() async {
    await _sellerDB.openBoxSellerDB();
  }

  registerSellerDB(Seller seller) async {
    //*los registra en Hive
    try {
      await _sellerDB.addSeller(seller);
    } on Exception catch (e) {
      print(e);
    }
    return seller;
  }

  registerAllWithSellerDB() async {
    //*Obtiene todos los Sellers del Api y los registra en Hive
    final requestToken = await _localAuthRepository.getUserSession();
    List _user = await _userDB.getAllUsers();
    int _companyId = _user[0].companyId;
    int _branchOfficeId = _user[0].branchOfficeId;
    try {
      List<Seller> seller = await _sellerRepository.getSeller(
        requestToken.token,
        _companyId,
        _branchOfficeId,
      );
      // ignore: unnecessary_null_comparison
      if (seller != null) {
        for (int i = 0; i < seller.length; i++) {
          _sellerDB.addSeller(seller[i]);
        }
        return seller;
      }
    } on DioError catch (dioError) {
      Logs.p.e(dioError);
      if (dioError.response!.statusCode! == 400) {
        _authenticationRepository.logoutSession();
      }
      throw AppException.fromDioError(dioError);
    }
  }
}

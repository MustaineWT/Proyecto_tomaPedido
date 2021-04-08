import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_cas/data/models/user.dart';
import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/repositories/local/local_auth_repository.dart';
import 'package:salesapp_cas/domain/repositories/remote/authentication_repository.dart';
import 'package:salesapp_cas/domain/repositories/remote/user_repository.dart';
import 'package:salesapp_cas/utils/logs.dart';

class UserUseCase {
  UserUseCase(this._userRepository, this._localAuthRepository);
  final UserRepository _userRepository;
  final LocalAuthRepository _localAuthRepository;

  final bussinesNameController = TextEditingController();
  final rucController = TextEditingController();
  final directionController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();
  final emailCompanyController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dniController = TextEditingController();
  final typePersonidController = TextEditingController();
  final emailAdminController = TextEditingController();
  final directionAdminController = TextEditingController();
  final cityAdminController = TextEditingController();
  final countryAdminController = TextEditingController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  String _bussinesName = '',
      _ruc = '',
      _direction = '',
      _city = '',
      _country = '',
      _phone = '',
      _emailCompany = '',
      _name = '',
      _lastName = '',
      _dni = '',
      _typePersonid = '',
      _emailAdmin = '',
      _directionAdmin = '',
      _cityAdmin = '',
      _countryAdmin = '',
      _user = '',
      _password = '';

  void changedBussinesName(String bussinesName) {
    _bussinesName = bussinesName;
  }

  void changedRuc(String ruc) {
    _ruc = ruc;
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

  void changedPhone(String phone) {
    _phone = phone;
  }

  void changedEmailCompany(String emailCompany) {
    _emailCompany = emailCompany;
  }

  void changedName(String name) {
    _name = name;
  }

  void changedLastName(String lastName) {
    _lastName = lastName;
  }

  void changedDni(String dni) {
    _dni = dni;
  }

  void changedEmailAdmin(String emailAdmin) {
    _emailAdmin = emailAdmin;
  }

  void changedDirectionAdmin(String directionAdmin) {
    _directionAdmin = directionAdmin;
  }

  void changedCityAdmin(String cityAdmin) {
    _cityAdmin = cityAdmin;
  }

  void changedCountryAdmin(String countryAdmin) {
    _countryAdmin = countryAdmin;
  }

  void changedUser(String user) {
    _user = user;
  }

  void changedPassword(String password) {
    _password = password;
  }

  Future<User> getUser() async {
    final requestToken = await _localAuthRepository.getUserSession();

    final user = _userRepository.getUser(
      requestToken.token,
      requestToken.personid!,
    );
    return user;
  }

  Future<String> registerUserAdmin() async {
    await Future.delayed(Duration(seconds: 3));
    if (bussinesNameController.text.isNotEmpty &&
        rucController.text.isNotEmpty &&
        directionController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        countryController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailCompanyController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailAdminController.text.isNotEmpty &&
        directionAdminController.text.isNotEmpty &&
        cityAdminController.text.isNotEmpty &&
        countryAdminController.text.isNotEmpty &&
        userController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      try {
        final requestToken = await _userRepository.registerUser(
          _bussinesName,
          _ruc,
          _direction,
          _city,
          _country,
          _phone,
          _emailCompany,
          _name,
          _lastName,
          _dni,
          1,
          _emailAdmin,
          _directionAdmin,
          _cityAdmin,
          _countryAdmin,
          _user,
          _password,
        );
        return requestToken.message!;
      } on DioError catch (dioError) {
        Logs.p.e(dioError);
        throw AppException.fromDioError(dioError);
      }
    } else {
      return 'typing';
    }
  }
}

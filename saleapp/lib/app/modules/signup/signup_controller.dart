import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saleapp/app/data/models/responses/responseprocess.dart';
import 'package:saleapp/app/data/repositories/local/local_auth_repository.dart';
import 'package:saleapp/app/data/repositories/remote/userAdmin_repository.dart';
import 'package:saleapp/app/routes/app_pages.dart';

class SignUpController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final UserAdminRepository _userAdminRepository =
      Get.find<UserAdminRepository>();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _bussinesNameController = new TextEditingController();
  TextEditingController _rucController = new TextEditingController();
  TextEditingController _directionController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _countryController = new TextEditingController();
  TextEditingController _dniController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailCompanyController = new TextEditingController();
  TextEditingController _typePersonIdController = new TextEditingController();
  TextEditingController _emailAdminController = new TextEditingController();
  TextEditingController _directionAdminController = new TextEditingController();
  TextEditingController _cityAdminController = new TextEditingController();
  TextEditingController _countryAdminController = new TextEditingController();
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  TextEditingController get nameControllers => _nameController;
  TextEditingController get lastNameControllers => _lastNameController;
  TextEditingController get bussinesNameControllers => _bussinesNameController;
  TextEditingController get rucControllers => _rucController;
  TextEditingController get directionControllers => _directionController;
  TextEditingController get cityControllers => _cityController;
  TextEditingController get countryControllers => _countryController;
  TextEditingController get dniControllers => _dniController;
  TextEditingController get phoneControllers => _phoneController;
  TextEditingController get emailCompanyControllers => _emailCompanyController;
  TextEditingController get typePersonIdControllers => _typePersonIdController;
  TextEditingController get emailAdminControllers => _emailAdminController;
  TextEditingController get directionAdminControllers =>
      _directionAdminController;
  TextEditingController get cityAdminControllers => _cityAdminController;
  TextEditingController get countryAdminControllers => _countryAdminController;
  TextEditingController get userControllers => _userController;
  TextEditingController get passwordControllers => _passwordController;

  late ResponseProcess _responseProcess;

  bool _value = true;
  bool get values => _value;

  bool _secureText = true;
  bool get secureTexts => _secureText;

  void onPressedIcon() {
    _secureText = !_secureText;
    update();
  }

  String _name = '',
      _lastName = '',
      _bussinesName = '',
      _ruc = '',
      _direction = '',
      _city = '',
      _country = '',
      _dni = '',
      _phone = '',
      _emailCompany = '',
      _emailAdmin = '',
      _directionAdmin = '',
      _cityAdmin = '',
      _countryAdmin = '',
      _user = '',
      _password = '';
  int _typePersonId = 0;
  void onChangedName(String text) {
    _name = text;
  }

  void onChangedLastName(String text) {
    _lastName = text;
  }

  void onChangedBussinesName(String text) {
    _bussinesName = text;
  }

  void onChangedRuc(String text) {
    _ruc = text;
  }

  void onChangedDirection(String text) {
    _direction = text;
  }

  void onChangedCity(String text) {
    _city = text;
  }

  void onChangedCountry(String text) {
    _country = text;
  }

  void onChangedDni(String text) {
    _dni = text;
  }

  void onChangedPhone(String text) {
    _phone = text;
  }

  void onChangedEmailCompany(String text) {
    _emailCompany = text;
  }

  void onChangedTypePersonId(int value) {
    _typePersonId = value;
  }

  void onChangedEmailAdmin(String text) {
    _emailAdmin = text;
  }

  void onChangedDirectionAdmin(String text) {
    _directionAdmin = text;
  }

  void onChangedCityAdmin(String text) {
    _cityAdmin = text;
  }

  void onChangedCountryAdmin(String text) {
    _countryAdmin = text;
  }

  void onChangedUser(String text) {
    _user = text;
  }

  void onChangedPassword(String text) {
    _password = text;
  }

  Future<String?> onRegisterSignUp() async {
    if (_name.isNotEmpty &&
        _lastName.isNotEmpty &&
        _bussinesName.isNotEmpty &&
        _ruc.isNotEmpty &&
        _direction.isNotEmpty &&
        _city.isNotEmpty &&
        _country.isNotEmpty &&
        _dni.isNotEmpty &&
        _phone.isNotEmpty &&
        _emailCompany.isNotEmpty &&
        _emailAdmin.isNotEmpty &&
        _directionAdmin.isNotEmpty &&
        _cityAdmin.isNotEmpty &&
        _countryAdmin.isNotEmpty &&
        _user.isNotEmpty &&
        _password.isNotEmpty) {
      _value = true;
      update();
      try {
        String _procesado = '';
        _responseProcess = await _userAdminRepository.onRegisterUserAdmin(
            name: _name,
            lastname: _lastName,
            bussinesname: _bussinesName,
            ruc: _ruc,
            direction: _direction,
            city: _city,
            country: _country,
            dni: _dni,
            phone: _phone,
            emailcompany: _emailCompany,
            typepersonid: 1,
            emailadmin: _emailAdmin,
            directionadmin: _directionAdmin,
            cityadmin: _cityAdmin,
            countryadmin: _countryAdmin,
            user: _user,
            password: _password);
        _procesado = _responseProcess.response;
        if (_responseProcess.status) {
          clearTextFields();
          return Get.dialog(
            AlertDialog(
              title: Text("Información."),
              content: Text(_procesado),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    clearTextFields();
                    Get.offNamedUntil(AppRoutes.LOGIN, (_) => false);
                  },
                )
              ],
            ),
          );
        } else {
          return Get.dialog(
            AlertDialog(
              title: Text("Información del Sistema"),
              content: Text(_procesado),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            ),
          );
        }
      } catch (e) {
        print('error:' + e.toString());
        String message = "";
        if (e is DioError) {
          if (e.response != null) {
            message = e.response!.data['err'];
          } else {
            message = e.response!.statusMessage!;
          }
        }
        Get.dialog(
          AlertDialog(
            title: Text("Información del Sistema"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ),
        );
      }
    } else {
      _value = false;
      update();
    }
  }

  void clearTextFields() {
    _nameController.text = '';
    _lastNameController.text = '';
    _bussinesNameController.text = '';
    _rucController.text = '';
    _directionController.text = '';
    _cityController.text = '';
    _countryController.text = '';
    _dniController.text = '';
    _phoneController.text = '';
    _emailCompanyController.text = '';
    _typePersonIdController.text = '';
    _emailAdminController.text = '';
    _directionAdminController.text = '';
    _cityAdminController.text = '';
    _countryAdminController.text = '';
    _userController.text = '';
    _passwordController.text = '';
    _name = '';
    _lastName = '';
    _bussinesName = '';
    _ruc = '';
    _direction = '';
    _city = '';
    _country = '';
    _dni = '';
    _phone = '';
    _emailCompany = '';
    _emailAdmin = '';
    _directionAdmin = '';
    _cityAdmin = '';
    _countryAdmin = '';
    _user = '';
    _password = '';
  }

  Future<void> onGoToLogin() async {
    Get.dialog(
      AlertDialog(
        title: Text("Información."),
        content: Text('¿Desea regresar al Login?'),
        actions: [
          TextButton(
            child: Text("Si"),
            onPressed: () async {
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
}

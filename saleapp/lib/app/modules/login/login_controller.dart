import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saleapp/app/data/models/responses/requestToken.dart';
import 'package:saleapp/app/data/repositories/local/local_auth_repository.dart';
import 'package:saleapp/app/data/repositories/remote/authentication_repository.dart';
import 'package:saleapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthenticationRepository? _authenticationRepository =
      Get.find<AuthenticationRepository>();
  final LocalAuthRepository? _localAuthRepository =
      Get.find<LocalAuthRepository>();

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController get usernameControllers => _usernameController;
  TextEditingController get passwordControllers => _passwordController;

  String _username = '', _password = '';

  bool _value = true;
  bool get values => _value;

  bool _secureText = true;

  bool get secureTexts => _secureText;

  void onChangedUsername(String text) {
    _username = text;
  }

  void onChangedPassword(String text) {
    _password = text;
  }

  void onPressedIcon() {
    _secureText = !_secureText;
    update();
  }

  onSignUp() {
    Get.toNamed(AppRoutes.SIGNUP);
  }

  Future<void> onSubmit() async {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      _value = true;
      update();
      try {
        final RequestTokenModel authRequestToken =
            await _authenticationRepository!
                .authWithLogin(username: _username, password: _password);
        await _localAuthRepository!.setSession(authRequestToken);
        Get.offNamed(AppRoutes.HOME);
      } catch (e) {
        String? message = "";
        if (e is DioError) {
          print(e.response);
          if (e.response != null) {
            message = e.response!.data['response'];
          } else {
            message = e.response!.statusMessage;
          }
        }
        Get.dialog(
          AlertDialog(
            title: Text("Información del Sistema"),
            content: Text(message!),
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
}

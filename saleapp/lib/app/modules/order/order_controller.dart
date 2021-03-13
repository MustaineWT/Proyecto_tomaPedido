import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:saleapp/app/data/repositories/local/local_auth_repository.dart';
import 'package:saleapp/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  //final LocalAuthRepository _localAuthRepository =
  //Get.find<LocalAuthRepository>();

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
}

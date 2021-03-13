import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:saleapp/app/data/repositories/local/local_auth_repository.dart';
import 'package:saleapp/app/modules/client/client_view.dart';
import 'package:saleapp/app/modules/inibody/inibody_view.dart';
import 'package:saleapp/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //final LocalAuthRepository _localAuthRepository =
  //   Get.find<LocalAuthRepository>();
  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchControllers => _searchController;
  bool stateColorSelectClient = false;
  bool stateColorSelectOrders = false;
  bool stateColorSelectArticle = false;
  bool stateColorSelectReport = false;
  bool stateColorSelectSetting = false;
  bool stateColorSelectInformation = false;

  List<Widget> _listWidget = [
    IniBodyView(),
    ClientView(),
    ClientView(),
    ClientView(),
    ClientView(),
    ClientView(),
    ClientView()
  ];
  List<Widget> get listWidgets => _listWidget;
  int _value = 0;
  int get values => _value;
  String _search = '';
  String get searchs => _search;
  String _nameOpcion = '';
  String get nameOpcions => _nameOpcion;

  void onChangedSearch(String text) {
    _search = text;
  }

  void onPressedOpcion(bool valor, int opcion) {
    switch (opcion) {
      case 1:
        stateColorSelectClient = !stateColorSelectClient;
        stateColorSelectOrders = false;
        stateColorSelectArticle = false;
        stateColorSelectReport = false;
        stateColorSelectSetting = false;
        stateColorSelectInformation = false;
        _value = 1;
        _nameOpcion = 'Clientes';
        update();
        break;
      case 2:
        stateColorSelectOrders = !stateColorSelectOrders;
        stateColorSelectClient = false;
        stateColorSelectArticle = false;
        stateColorSelectReport = false;
        stateColorSelectSetting = false;
        stateColorSelectInformation = false;
        _value = 2;
        _nameOpcion = 'Pedidos';
        update();
        break;
      case 3:
        stateColorSelectArticle = !stateColorSelectArticle;
        stateColorSelectReport = false;
        stateColorSelectOrders = false;
        stateColorSelectClient = false;
        stateColorSelectSetting = false;
        stateColorSelectInformation = false;
        _value = 3;
        _nameOpcion = 'Articulos';
        update();
        break;
      case 4:
        stateColorSelectReport = !stateColorSelectReport;
        stateColorSelectOrders = false;
        stateColorSelectClient = false;
        stateColorSelectSetting = false;
        stateColorSelectInformation = false;
        stateColorSelectArticle = false;
        _value = 4;
        _nameOpcion = 'Reportes';
        update();
        break;
      case 5:
        stateColorSelectSetting = !stateColorSelectSetting;
        stateColorSelectOrders = false;
        stateColorSelectArticle = false;
        stateColorSelectReport = false;
        stateColorSelectClient = false;
        stateColorSelectInformation = false;
        _value = 5;
        _nameOpcion = 'Configuración';
        update();
        break;

      case 6:
        stateColorSelectInformation = !stateColorSelectInformation;
        stateColorSelectOrders = false;
        stateColorSelectArticle = false;
        stateColorSelectReport = false;
        stateColorSelectSetting = false;
        stateColorSelectClient = false;
        _value = 6;
        _nameOpcion = 'Información';
        update();
        break;
      default:
        _value = 0;
        break;
    }
    update();
  }

  void onPressedClient() {}

  void onPressedOrders() {}

  void onPressedArticle() {}

  void onPressedSetting() {}

  void onPressedInformation() {}

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

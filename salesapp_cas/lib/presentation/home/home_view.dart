import 'package:flutter/material.dart';
import 'package:salesapp_cas/presentation/client/client_view.dart';
import 'package:salesapp_cas/presentation/inibody/inibody_view.dart';
import '../../presentation/widgets/ShowDialogMessage.dart';
import '../../data/services/local/local_auth_api.dart';
import '../../data/services/remote/authentication_api.dart';
import '../../domain/usecase/auth_usecase.dart';

import 'local_widget/AppBarPersonalize.dart';
import 'local_widget/MenuDrawer.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() =>
      _HomeViewState(AuthUseCase(AuthenticationApi(), LocalAuthApi()));
}

class _HomeViewState extends State<HomeView> {
  final AuthUseCase _authUseCase;

  _HomeViewState(this._authUseCase);
  TextEditingController _searchController = TextEditingController();
  bool _stateColorSelectClient = false;
  bool _stateColorSelectOrders = false;
  bool _stateColorSelectArticle = false;
  bool _stateColorSelectReport = false;
  bool _stateColorSelectSetting = false;
  bool _stateColorSelectInformation = false;

  List<Widget> _listWidget = [
    IniBodyView(),
    ClientView(),
    ClientView(),
    ClientView(),
    ClientView(),
    ClientView(),
    ClientView()
  ];

  int _value = 0;
  String _search = '';
  String _nameOpcion = '';

  _onPressedOpcion(bool valor, int opcion) {
    switch (opcion) {
      case 1:
        _stateColorSelectClient = !_stateColorSelectClient;
        _stateColorSelectOrders = false;
        _stateColorSelectArticle = false;
        _stateColorSelectReport = false;
        _stateColorSelectSetting = false;
        _stateColorSelectInformation = false;
        _value = 1;
        _nameOpcion = 'Clientes';
        setState(() {});
        break;
      case 2:
        _stateColorSelectOrders = !_stateColorSelectOrders;
        _stateColorSelectClient = false;
        _stateColorSelectArticle = false;
        _stateColorSelectReport = false;
        _stateColorSelectSetting = false;
        _stateColorSelectInformation = false;
        _value = 2;
        _nameOpcion = 'Pedidos';
        setState(() {});
        break;
      case 3:
        _stateColorSelectArticle = !_stateColorSelectArticle;
        _stateColorSelectReport = false;
        _stateColorSelectOrders = false;
        _stateColorSelectClient = false;
        _stateColorSelectSetting = false;
        _stateColorSelectInformation = false;
        _value = 3;
        _nameOpcion = 'Articulos';
        setState(() {});
        break;
      case 4:
        _stateColorSelectReport = !_stateColorSelectReport;
        _stateColorSelectOrders = false;
        _stateColorSelectClient = false;
        _stateColorSelectSetting = false;
        _stateColorSelectInformation = false;
        _stateColorSelectArticle = false;
        _value = 4;
        _nameOpcion = 'Reportes';
        setState(() {});
        break;
      case 5:
        _stateColorSelectSetting = !_stateColorSelectSetting;
        _stateColorSelectOrders = false;
        _stateColorSelectArticle = false;
        _stateColorSelectReport = false;
        _stateColorSelectClient = false;
        _stateColorSelectInformation = false;
        _value = 5;
        _nameOpcion = 'Configuración';
        setState(() {});
        break;

      case 6:
        _stateColorSelectInformation = !_stateColorSelectInformation;
        _stateColorSelectOrders = false;
        _stateColorSelectArticle = false;
        _stateColorSelectReport = false;
        _stateColorSelectSetting = false;
        _stateColorSelectClient = false;
        _value = 6;
        _nameOpcion = 'Información';
        setState(() {});
        break;
      default:
        _value = 0;
        break;
    }
  }

  _onChangedSearch(String text) {
    _search = text;
  }

  _onLogout() {
    ShowDialogMessage.showDialogMessageWithFunc(
        context, 'Información', 'Desea cerrar sesión.', _authUseCase.onLogout);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 40),
        child: AppBarPersonalize(
          onlogout: () => _onLogout(),
          value: _value,
          title: _nameOpcion,
          searchController: _searchController,
          onChange: _onChangedSearch,
          valor: 1,
        ),
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: MenuDrawer(
          onPressedClient: () {
            _onPressedOpcion(true, 1);
            Navigator.pop(context);
          },
          onPressedOrders: () {
            _onPressedOpcion(true, 2);
            Navigator.pop(context);
          },
          onPressedArticles: () {
            _onPressedOpcion(true, 3);
            Navigator.pop(context);
          },
          onPressedReports: () {
            _onPressedOpcion(true, 4);
            Navigator.pop(context);
          },
          onPressedSetting: () {
            _onPressedOpcion(true, 5);
            Navigator.pop(context);
          },
          onPressedInformation: () {
            _onPressedOpcion(true, 6);
            Navigator.pop(context);
          },
          stateColorClient: _stateColorSelectClient,
          stateColorOrders: _stateColorSelectOrders,
          stateColorArticle: _stateColorSelectArticle,
          stateColorReport: _stateColorSelectReport,
          stateColorSetting: _stateColorSelectSetting,
          stateColorInformation: _stateColorSelectInformation,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: _listWidget[_value],
      ),
    );
  }
}

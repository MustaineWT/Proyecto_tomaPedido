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
  List<bool> options = [false, false, false, false, false, false];
  int _value = 0;
  String _search = '';
  String _nameOpcion = '';

  _onPressedOpcion(int opcion, String nameOpcion) {
    _value = opcion + 1;
    _nameOpcion = nameOpcion;
    List<bool> opcions = [
      _stateColorSelectClient,
      _stateColorSelectOrders,
      _stateColorSelectArticle,
      _stateColorSelectReport,
      _stateColorSelectSetting,
      _stateColorSelectInformation
    ];
    for (int i = 0; i < opcions.length; i++) {
      opcions[i] = false;
    }
    opcions[opcion] = true;
    options = opcions;
    setState(() {});
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
            _onPressedOpcion(0, 'Clientes');
            Navigator.pop(context);
          },
          onPressedOrders: () {
            _onPressedOpcion(1, 'Pedidos');
            Navigator.pop(context);
          },
          onPressedArticles: () {
            _onPressedOpcion(2, 'Articulos');
            Navigator.pop(context);
          },
          onPressedReports: () {
            _onPressedOpcion(3, 'Reportes');
            Navigator.pop(context);
          },
          onPressedSetting: () {
            _onPressedOpcion(4, 'Configuración');
            Navigator.pop(context);
          },
          onPressedInformation: () {
            _onPressedOpcion(5, 'Información');
            Navigator.pop(context);
          },
          stateColorClient: options[0],
          stateColorOrders: options[1],
          stateColorArticle: options[2],
          stateColorReport: options[3],
          stateColorSetting: options[4],
          stateColorInformation: options[5],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: _listWidget[_value],
      ),
    );
  }
}

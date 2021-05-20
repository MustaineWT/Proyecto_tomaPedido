import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:salesapp_cas/data/datasource/userdb.dart';
import 'package:salesapp_cas/data/models/user/user.dart';
import 'package:salesapp_cas/presentation/useradministrator/ffvvA/ffvvAdmin_view.dart';
import 'package:salesapp_cas/presentation/useradministrator/routeA/routeAdmin_view.dart';
import 'package:salesapp_cas/presentation/useradministrator/sellerA/sellerAdmin_view.dart';
import '../inibodyA/inibody_view.dart';
import '../../../helpers/get.dart';
import '../../../presentation/widgets/ShowDialogMessage.dart';
import '../../../domain/usecase/auth_usecase.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'local_widget/AppBarPersonalize.dart';
import 'local_widget/MenuDrawer.dart';

class HomeAdminView extends StatefulWidget {
  @override
  _HomeAdminViewState createState() => _HomeAdminViewState();
}

class _HomeAdminViewState extends State<HomeAdminView> {
  final _authUseCase = Get.i.find<AuthUseCase>();

  TextEditingController _searchController = TextEditingController();

  bool _stateColorSelectSellers = false;
  bool _stateColorSelectRoutes = false;
  bool _stateColorSelectFfvv = false;
  bool _stateColorSelectListPrice = false;
  bool _stateColorSelectArticle = false;
  bool _stateColorSelectPromotion = false;
  bool _stateColorSelectInformation = false;

  List<Widget> _listWidget = [
    IniBodyView(),
    SellerAdminView(),
    RouteAdminView(),
    FfvvAdminView(),
    IniBodyView(),
    IniBodyView(),
    IniBodyView(),
    IniBodyView(),
  ];
  List<bool> options = [false, false, false, false, false, false, false];
  int _value = 0;
  // ignore: unused_field
  String _search = '';
  String _nameOpcion = '';

  _onPressedOpcion(int opcion, String nameOpcion) {
    _value = opcion + 1;
    _nameOpcion = nameOpcion;
    List<bool> opcions = [
      _stateColorSelectSellers,
      _stateColorSelectRoutes,
      _stateColorSelectFfvv,
      _stateColorSelectListPrice,
      _stateColorSelectArticle,
      _stateColorSelectPromotion,
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

  String result = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
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
        child: ValueListenableBuilder(
            valueListenable: Hive.box<User>(USER).listenable(),
            builder: (context, Box<User> box, _) {
              final _user = box.values.toList();
              return MenuDrawer(
                nameCompany: _user[0].bussinesName,
                directionCompany: _user[0].direction,
                cityCompany: _user[0].cityBranch,
                countryCompany: _user[0].country,
                nameAdmin: _user[0].name,
                lastNameAdmin: _user[0].lastName,
                //fecha: _user.fecha.toString().substring(0, 10),
                fecha: _user[0].fecha.toString().substring(0, 10),
                onPressedSellers: () {
                  _onPressedOpcion(0, 'Vendedores');
                  Navigator.pop(context);
                },
                onPressedRoutes: () {
                  _onPressedOpcion(1, 'Rutas');
                  Navigator.pop(context);
                },
                onPressedFfvv: () {
                  _onPressedOpcion(2, 'Fuerza de Venta');
                  Navigator.pop(context);
                },
                onPressedListPrice: () {
                  _onPressedOpcion(3, 'Precios');
                  Navigator.pop(context);
                },
                onPressedArticles: () {
                  _onPressedOpcion(4, 'Articulos');
                  Navigator.pop(context);
                },
                onPressedPromotion: () {
                  _onPressedOpcion(5, 'Promociones');
                  Navigator.pop(context);
                },
                onPressedInformation: () {
                  _onPressedOpcion(6, 'Información');
                  Navigator.pop(context);
                },
                stateColorSelectSellers: options[0],
                stateColorSelectRoutes: options[1],
                stateColorSelectFfvv: options[2],
                stateColorSelectListPrice: options[3],
                stateColorSelectArticle: options[4],
                stateColorSelectPromotion: options[5],
                stateColorSelectInformation: options[6],
              );
            }),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: _listWidget[_value],
      ),
    );
  }
}

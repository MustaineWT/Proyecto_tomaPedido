import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../utils/colors_constants.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
    this.nameCompany,
    this.directionCompany,
    this.cityCompany,
    this.countryCompany,
    this.nameAdmin,
    this.lastNameAdmin,
    this.fecha,
    required this.onPressedSellers,
    required this.onPressedRoutes,
    required this.onPressedArticles,
    required this.onPressedListPrice,
    required this.onPressedVisitinProgram,
    required this.onPressedPromotion,
    required this.onPressedInformation,
    required this.stateColorSelectSellers,
    required this.stateColorSelectRoutes,
    required this.stateColorSelectArticle,
    required this.stateColorSelectListPrice,
    required this.stateColorSelectVisitingProgram,
    required this.stateColorSelectPromotion,
    required this.stateColorSelectInformation,
  }) : super(key: key);

  final String? nameCompany;
  final String? directionCompany;
  final String? cityCompany;
  final String? countryCompany;
  final String? nameAdmin;
  final String? lastNameAdmin;
  final String? fecha;
  final Function() onPressedSellers;
  final Function() onPressedRoutes;
  final Function() onPressedArticles;
  final Function() onPressedListPrice;
  final Function() onPressedVisitinProgram;
  final Function() onPressedPromotion;
  final Function() onPressedInformation;

  final bool stateColorSelectSellers;
  final bool stateColorSelectRoutes;
  final bool stateColorSelectArticle;
  final bool stateColorSelectListPrice;
  final bool stateColorSelectVisitingProgram;
  final bool stateColorSelectPromotion;
  final bool stateColorSelectInformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft - Alignment(0.0, 0.80),
                child: CircleAvatar(
                  backgroundColor: gray,
                  radius: 40.0,
                  child: Text(
                    'A',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    CupertinoIcons.xmark_circle,
                    color: gray,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight + Alignment(0, 0.3),
                child: Text(
                  '$nameAdmin',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 16,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight + Alignment(0, 0.6),
                child: Text(
                  'Apellidos: $lastNameAdmin',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 14,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight + Alignment(0, 0.9),
                child: Text(
                  'Pais: $cityCompany',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 14,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight + Alignment(0, 1.2),
                child: Text(
                  'Ciudad: $countryCompany',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 14,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight + Alignment(0, 1.5),
                child: Text(
                  'Fecha: $fecha',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                width: 180,
                child: Align(
                  alignment: Alignment.topLeft + Alignment(0, 1.5),
                  child: Text(
                    '$nameCompany',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: gray,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft + Alignment(0, 1.9),
                child: Text(
                  '$directionCompany',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          //color: white,
          child: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  onTap: onPressedSellers,
                  leading: Icon(CupertinoIcons.person_3_fill,
                      color: stateColorSelectSellers ? Colors.blue : gray),
                  title: Text(
                    'Vendedores',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorSelectSellers ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedRoutes,
                  leading: Icon(CupertinoIcons.arrow_swap,
                      color: stateColorSelectRoutes ? Colors.blue : gray),
                  title: Text(
                    'Rutas',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorSelectRoutes ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedArticles,
                  leading: Icon(CupertinoIcons.square_stack_3d_down_right,
                      color: stateColorSelectArticle ? Colors.blue : gray),
                  title: Text(
                    'Articulos',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorSelectArticle ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedListPrice,
                  leading: Icon(Icons.monetization_on_outlined,
                      color: stateColorSelectListPrice ? Colors.blue : gray),
                  title: Text(
                    'Listas Precios',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorSelectListPrice ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedVisitinProgram,
                  leading: Icon(Icons.account_tree_outlined,
                      color:
                          stateColorSelectVisitingProgram ? Colors.blue : gray),
                  title: Text(
                    'Programación Visita',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color:
                          stateColorSelectVisitingProgram ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedPromotion,
                  leading: Icon(Icons.account_balance_wallet_outlined,
                      color: stateColorSelectPromotion ? Colors.blue : gray),
                  title: Text(
                    'Promociones',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorSelectPromotion ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedInformation,
                  leading: Icon(Icons.info_outline_rounded,
                      color: stateColorSelectInformation ? Colors.blue : gray),
                  title: Text(
                    'Información',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorSelectInformation ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

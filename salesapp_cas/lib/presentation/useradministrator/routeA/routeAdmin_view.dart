import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:salesapp_cas/data/datasource/routesdb.dart';
import 'package:salesapp_cas/data/models/route/routes.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'local_widgets/card_info.dart';

class RouteAdminView extends StatefulWidget {
  @override
  _RouteAdminViewState createState() => _RouteAdminViewState();
}

class _RouteAdminViewState extends State<RouteAdminView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(children: [
      Container(
        width: size.width,
        height: size.height - 63,
        decoration: BoxDecoration(color: white),
        child: ValueListenableBuilder(
            valueListenable: RoutesDB.getOpenRouteBox().listenable(),
            builder: (context, Box<Routes> _routeBox, _) {
              return ListView.builder(
                itemCount: _routeBox.values.length,
                itemBuilder: (context, index) {
                  final _routes = _routeBox.getAt(index);
                  // ignore: unnecessary_null_comparison
                  return CardInfo(
                    constrains: size,
                    route: _routes!.route,
                    description: _routes.description,
                    zone: _routes.zone,
                    ffvv: _routes.ffvv,
                    state: _routes.state,
                  );
                },
              );
            }),
      ),
      Positioned(
        bottom: 5.0,
        right: 5.0,
        child: Container(
          height: 45,
          width: 45,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: gray,
            onPressed: () async {
              Navigator.of(context)
                  .pushNamed("/regroutes")
                  .then((value) => setState(() {}));
            },
          ),
        ),
      ),
      //ButtonAdd(),
    ]);
  }
}

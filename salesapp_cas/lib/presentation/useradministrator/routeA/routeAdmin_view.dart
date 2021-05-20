import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:salesapp_cas/data/datasource/routesdb.dart';
import 'package:salesapp_cas/data/models/route/routes.dart';
import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/usecase/routes_usecase.dart';
import 'package:salesapp_cas/helpers/get.dart';
import 'package:salesapp_cas/presentation/widgets/ShowDialogMessage.dart';
import 'package:salesapp_cas/presentation/widgets/dismissible_widget.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';
import 'package:salesapp_cas/utils/dialogs.dart';

import 'local_widgets/card_info.dart';

class RouteAdminView extends StatefulWidget {
  @override
  _RouteAdminViewState createState() => _RouteAdminViewState();
}

class _RouteAdminViewState extends State<RouteAdminView> {
  final _routesUseCase = Get.i.find<RoutesUseCase>();
  void dismissItem(
      BuildContext context, int index, DismissDirection direction) async {
    try {
      ProgressDialogp.show(context);
      final result = await _routesUseCase.deleteRouteDB(index);
      ProgressDialogp.dissmiss(context);
      if (result == 'Proceso Completado.') {
        setState(() {});
        return ShowDialogMessage.showDialogMessageWithRegisterPersonalice(
            context, 'Información', 'Ruta Eliminada correctamente.');
      } else {
        return ShowDialogMessage.showDialogMessage(
            context, 'Información', result);
      }
    } on AppException catch (ex) {
      print(ex);
      return ShowDialogMessage.showDialogMessage(
          context, 'Información', 'Servidor sin respuesta.');
    }
  }

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
              return ListView.separated(
                itemCount: _routeBox.values.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (context, index) {
                  final _routes = _routeBox.getAt(index);
                  return DismissbleWidget(
                    item: _routes,
                    child: CardInfo(
                      constrains: size,
                      route: _routes!.route,
                      description: _routes.description,
                      zone: _routes.zone,
                      mo: _routes.mo,
                      tu: _routes.tu,
                      we: _routes.we,
                      th: _routes.th,
                      fr: _routes.fr,
                      sa: _routes.sa,
                      su: _routes.su,
                      ffvv: _routes.ffvv,
                      state: _routes.state,
                    ),
                    onDismissed: (direction) =>
                        dismissItem(context, index, direction),
                  );
                },
              );
            }),
      ),
      Positioned(
        bottom: 5.0,
        right: 5.0,
        child: Container(
          height: 42,
          width: 42,
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

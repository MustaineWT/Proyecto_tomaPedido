import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:salesapp_cas/data/datasource/ffvvdb.dart';
import 'package:salesapp_cas/data/models/ffvv/ffvv.dart';
import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/usecase/zone_usecase.dart';
import 'package:salesapp_cas/helpers/get.dart';
import 'package:salesapp_cas/presentation/widgets/ShowDialogMessage.dart';
import 'package:salesapp_cas/presentation/widgets/dismissible_widget.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';
import 'package:salesapp_cas/utils/dialogs.dart';

import 'local_widgets/card_info.dart';

class ZoneAdminView extends StatefulWidget {
  @override
  _ZoneAdminViewState createState() => _ZoneAdminViewState();
}

class _ZoneAdminViewState extends State<ZoneAdminView> {
  final _zoneUseCase = Get.i.find<ZoneUseCase>();
  void dismissItem(
      BuildContext context, int index, DismissDirection direction) async {
    try {
      ProgressDialogp.show(context);
      final result = await _zoneUseCase.deleteFfvvDB(index);
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
            valueListenable: FfvvDB.getOpenFfvvBox().listenable(),
            builder: (context, Box<Ffvv> _ffvvBox, _) {
              return ListView.separated(
                itemCount: _ffvvBox.values.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (context, index) {
                  final _ffvv = _ffvvBox.getAt(index);
                  return DismissbleWidget(
                    item: _ffvv,
                    child: CardInfo(
                      constrains: size,
                      description: _ffvv!.description,
                      ffvv: _ffvv.ffvv,
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

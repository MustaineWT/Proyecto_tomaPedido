import 'package:flutter/material.dart';

import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/usecase/routes_usecase.dart';
import 'package:salesapp_cas/helpers/get.dart';
import 'package:salesapp_cas/presentation/widgets/CurvePainter.dart';
import 'package:salesapp_cas/presentation/widgets/ShowDialogMessage.dart';
import 'package:salesapp_cas/utils/dialogs.dart';

import 'form_routes.dart';

class FormRegisterRoutes extends StatefulWidget {
  const FormRegisterRoutes({
    Key? key,
  }) : super(key: key);
  @override
  _FormRegisterRoutesState createState() => _FormRegisterRoutesState();
}

class _FormRegisterRoutesState extends State<FormRegisterRoutes> {
  final _routesUseCase = Get.i.find<RoutesUseCase>();

  Future<void> _onRegisterRoutes() async {
    try {
      ProgressDialogp.show(context);
      final result = await _routesUseCase.registerRoute();
      ProgressDialogp.dissmiss(context);
      if (result == 'Proceso Completado.') {
        return ShowDialogMessage.showDialogMessageWithRegisterPersonalice(
            context, 'Información', 'Ruta registrada correctamente.');
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.blue[900]!,
                Colors.blue[800]!,
                Colors.blue[600]!,
              ])),
              child: CustomPaint(
                painter: CurvePainter(),
                child: FormRoutes(
                  routesUseCase: _routesUseCase,
                  constraints: constraints,
                  register: _onRegisterRoutes,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

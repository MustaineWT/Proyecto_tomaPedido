import 'package:flutter/material.dart';

import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/usecase/ffvv_usecase.dart';
import 'package:salesapp_cas/helpers/get.dart';
import 'package:salesapp_cas/presentation/widgets/CurvePainter.dart';
import 'package:salesapp_cas/presentation/widgets/ShowDialogMessage.dart';
import 'package:salesapp_cas/utils/dialogs.dart';

import 'form_zone.dart';

class FormRegisterFfvv extends StatefulWidget {
  const FormRegisterFfvv({
    Key? key,
  }) : super(key: key);
  @override
  _FormRegisterFfvvState createState() => _FormRegisterFfvvState();
}

class _FormRegisterFfvvState extends State<FormRegisterFfvv> {
  final _ffvvUseCase = Get.i.find<FfvvUseCase>();

  Future<void> _onRegisterFfvv() async {
    try {
      ProgressDialogp.show(context);
      final result = await _ffvvUseCase.registerFfvv();
      ProgressDialogp.dissmiss(context);
      if (result == 'Proceso Completado.') {
        return ShowDialogMessage.showDialogMessageWithRegisterPersonalice(
            context, 'Información', 'Ffvv registrada correctamente.');
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
                child: FormFfvv(
                  ffvvUseCase: _ffvvUseCase,
                  constraints: constraints,
                  register: _onRegisterFfvv,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

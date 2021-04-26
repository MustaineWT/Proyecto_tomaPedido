import 'package:flutter/material.dart';

import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/usecase/seller_usecase.dart';
import 'package:salesapp_cas/helpers/get.dart';
import 'package:salesapp_cas/presentation/widgets/CurvePainter.dart';
import 'package:salesapp_cas/presentation/widgets/ShowDialogMessage.dart';
import 'package:salesapp_cas/utils/dialogs.dart';

import 'form_seller.dart';

class FormRegisterSeller extends StatefulWidget {
  const FormRegisterSeller({
    Key? key,
  }) : super(key: key);
  @override
  _FormRegisterSellerState createState() => _FormRegisterSellerState();
}

class _FormRegisterSellerState extends State<FormRegisterSeller> {
  final _sellerUseCase = Get.i.find<SellerUseCase>();

  Future<void> _onRegisterSeller() async {
    try {
      ProgressDialogp.show(context);
      final result = await _sellerUseCase.registerSeller();
      ProgressDialogp.dissmiss(context);
      if (result == 'Vendedor Registrado') {
        return ShowDialogMessage.showDialogMessageWithRegisterPersonalice(
            context, 'Información', 'Vendedor registrado correctamente.');
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
                child: FormSeller(
                  sellerUseCase: _sellerUseCase,
                  constraints: constraints,
                  register: _onRegisterSeller,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

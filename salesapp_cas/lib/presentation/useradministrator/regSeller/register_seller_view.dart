import 'package:flutter/material.dart';

import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/usecase/seller_usecase.dart';
import 'package:salesapp_cas/helpers/get.dart';
import 'package:salesapp_cas/presentation/widgets/CurvePainter.dart';
import 'package:salesapp_cas/presentation/widgets/ShowDialogMessage.dart';
import 'package:salesapp_cas/utils/dialogs.dart';

import 'local_widget/formRegisterSeller.dart';

class RegisterSellerView extends StatefulWidget {
  const RegisterSellerView({
    Key? key,
  }) : super(key: key);
  @override
  _RegisterSellerViewState createState() => _RegisterSellerViewState();
}

class _RegisterSellerViewState extends State<RegisterSellerView> {
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
                child: FormRegisterSeller(
                  sellerUseCase: _sellerUseCase,
                  constraints: constraints,
                  singUp: _onRegisterSeller,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

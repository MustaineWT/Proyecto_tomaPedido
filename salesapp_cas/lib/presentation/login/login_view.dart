import 'package:flutter/material.dart';
import 'package:salesapp_cas/domain/usecase/routes_usecase.dart';
import 'package:salesapp_cas/domain/usecase/seller_usecase.dart';
import 'package:salesapp_cas/domain/usecase/user_usecase.dart';
import 'package:salesapp_cas/presentation/userseller/homeS/homeSeller_view.dart';
import '../../presentation/useradministrator/homeA/homeAdmin_view.dart';
import '../../presentation/signup/signup_view.dart';
import '../../helpers/get.dart';
import '../../presentation/widgets/CurvePainter.dart';
import '../../domain/exceptions/auth_exception.dart';
import '../../domain/usecase/auth_usecase.dart';
import '../../data/models/user/user.dart';
import '../../presentation/widgets/ShowDialogMessage.dart';
import '../../utils/colors_constants.dart';
import '../../utils/dialogs.dart';
import '../../utils/navigator_utils.dart';
import 'local_widget/ButtonLogin.dart';
import 'local_widget/TextFieldPassword.dart';
import 'local_widget/TextFieldUserName.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var percentage = 0.0;
  final _authUseCase = Get.i.find<AuthUseCase>();
  final _userUseCase = Get.i.find<UserUseCase>();
  final _sellerUseCase = Get.i.find<SellerUseCase>();
  final _routesUseCase = Get.i.find<RoutesUseCase>();

  bool _vPass = true;

  _viewPass() {
    _vPass = !_vPass;
    setState(() {});
  }

  _goSignUp() async {
    return pushToPage(context, SignUpView());
  }

  Future<void> _onLogIn() async {
    try {
      ProgressDialogp.show(context);
      final result = await _authUseCase.onLogIn();
      ProgressDialogp.dissmiss(context);

      if (result == 'entry') {
        List<User> user = await _userUseCase.getUserDB();
        if (user.length > 0) {
          if (user[0].description == 'Administrador') {
            return popAllAndPush(context, HomeAdminView());
          } else {
            return popAllAndPush(context, HomeSellerView());
          }
        } else {
          await _userUseCase.registerUserDB();
          List<User> user = await _userUseCase.getUserDB();
          if (user[0].description == 'Administrador') {
            ProgressDialogp.showLoadInformation(context, 'Información');
            await Future.delayed(Duration(seconds: 3));
            await _sellerUseCase.registerAllWithSellerDB();
            await _routesUseCase.registerAllWithRouteDB();
            ProgressDialogp.dissmiss(context);
            return popAllAndPush(context, HomeAdminView());
          } else {
            return popAllAndPush(context, HomeSellerView());
          }
        }
      }
      return ShowDialogMessage.showDialogMessage(
          context, 'Información', result);
    } on AppException catch (ex) {
      print(ex);
      ProgressDialogp.dissmiss(context);
      return ShowDialogMessage.showDialogMessage(
          context, 'Información', 'Servidor sin respuesta.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.blue[900]!,
              Colors.blue[800]!,
              Colors.blue[600]!,
            ])),
            child: CustomPaint(
              painter: CurvePainter(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('Sales App',
                            style: TextStyle(
                              color: blackv2,
                              fontSize: 40,
                              fontFamily: 'Oswald',
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Bienvenidos',
                            style: TextStyle(
                              color: blackv2,
                              fontSize: 20,
                              fontFamily: 'Oswald',
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: blackv2,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            )),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                30, 144, 255, .3),
                                            blurRadius: 20,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: [
                                      TextFieldUserName(
                                        usuarioController:
                                            _authUseCase.usernameController,
                                        onChangedUserName:
                                            _authUseCase.changedUserName,
                                      ),
                                      TextFieldPassword(
                                        passwordController:
                                            _authUseCase.passwordController,
                                        secureText: _vPass,
                                        onPressedIcon: _viewPass,
                                        onChangedPasssword:
                                            _authUseCase.changedPassword,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        '¿Perdiste tu contraseña?',
                                        style: TextStyle(
                                            fontFamily: 'Oswald',
                                            color: gray,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      ButtonLogin(
                                          value: true, onSubmit: _onLogIn),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: _goSignUp,
                                        child: Text(
                                          'Registrate',
                                          style: TextStyle(
                                              fontFamily: 'Oswald',
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

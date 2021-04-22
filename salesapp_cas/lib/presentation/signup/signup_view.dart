import 'package:flutter/material.dart';
import '../../domain/exceptions/auth_exception.dart';
import '../../domain/usecase/user_usecase.dart';
import '../../presentation/widgets/ShowDialogMessage.dart';
import '../../utils/TextFieldPerzonalice.dart';
import '../../utils/dialogs.dart';
import '../../helpers/get.dart';
import '../../presentation/signup/local_widget/ButtonSignUp.dart';
import '../../presentation/widgets/CurvePainter.dart';
import '../../utils/colors_constants.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _userAdminUseCase = Get.i.find<UserUseCase>();

  Future<void> _onRegisterUserAdmin() async {
    try {
      ProgressDialogp.show(context);
      final result = await _userAdminUseCase.registerUserAdmin();
      ProgressDialogp.dissmiss(context);
      if (result == 'Usuario Registrado') {
        return ShowDialogMessage.showDialogMessageWithRegister(
            context, 'Información', 'Usuario registrado correctamente.');
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
    //  Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
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
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: blue,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(30, 144, 255, .3),
                                          blurRadius: 30,
                                          offset: Offset(0, 10))
                                    ]),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: white,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                              Text('Sales App - Registro Adminitrador',
                                  style: TextStyle(
                                      fontFamily: 'Oswald',
                                      color: blackv2,
                                      fontSize: constraints.maxHeight * 0.025)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(
                        child: Container(
                          // height: size.height * .88,
                          decoration: BoxDecoration(
                            color: blackv2,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  30, 144, 255, .3),
                                              blurRadius: 30,
                                              offset: Offset(0, 10))
                                        ]),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Datos de Empresa',
                                          style: TextStyle(
                                            color: blueOpac,
                                            fontFamily: 'Oswald',
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          //color: Colors.red,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText: 'Razón Social',
                                            labelText:
                                                'Razón Social de Empresa:',
                                            onChanged: _userAdminUseCase
                                                .changedBussinesName,
                                            textController: _userAdminUseCase
                                                .bussinesNameController,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText: 'Ruc de la empresa',
                                            labelText: 'Ruc de Empresa:',
                                            onChanged:
                                                _userAdminUseCase.changedRuc,
                                            textController:
                                                _userAdminUseCase.rucController,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText: 'Dirección de empresa',
                                            labelText: 'Dirección de Empresa:',
                                            onChanged: _userAdminUseCase
                                                .changedDirection,
                                            textController: _userAdminUseCase
                                                .directionController,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText: 'Ciudad de empresa',
                                            labelText: 'Ciudad:',
                                            onChanged:
                                                _userAdminUseCase.changedCity,
                                            textController: _userAdminUseCase
                                                .cityController,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText: 'Email de la empresa',
                                            labelText: 'Email Empresa:',
                                            onChanged: _userAdminUseCase
                                                .changedEmailCompany,
                                            textController: _userAdminUseCase
                                                .emailCompanyController,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText: 'Teléfono de la empresa',
                                            labelText: 'Teléfono:',
                                            onChanged:
                                                _userAdminUseCase.changedPhone,
                                            textController: _userAdminUseCase
                                                .phoneController,
                                          ),
                                        ),
                                        Divider(
                                          height: 5,
                                          thickness: 2,
                                          color: black,
                                        ),
                                        Text(
                                          'Datos de Administrador',
                                          style: TextStyle(
                                            color: blueOpac,
                                            fontFamily: 'Oswald',
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText:
                                                'Tus nombres de administrador',
                                            labelText: 'Nombres:',
                                            onChanged:
                                                _userAdminUseCase.changedName,
                                            textController: _userAdminUseCase
                                                .nameController,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText:
                                                'Tus apellidos de administrador',
                                            labelText: 'Apellidos:',
                                            onChanged: _userAdminUseCase
                                                .changedLastName,
                                            textController: _userAdminUseCase
                                                .lastNameController,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText:
                                                'Nro de dni o registro de identidad',
                                            labelText: 'Dni:',
                                            onChanged:
                                                _userAdminUseCase.changedDni,
                                            textController:
                                                _userAdminUseCase.dniController,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText: 'Email de administrador',
                                            labelText: 'Email:',
                                            onChanged: _userAdminUseCase
                                                .changedEmailAdmin,
                                            textController: _userAdminUseCase
                                                .emailAdminController,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText:
                                                'Usuario de administrador',
                                            labelText: 'Usuario:',
                                            onChanged:
                                                _userAdminUseCase.changedUser,
                                            textController: _userAdminUseCase
                                                .userController,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.all(0),
                                          height: 45,
                                          width: constraints.maxWidth * 0.87,
                                          child: TextFieldPerzonalice(
                                            constraints: constraints,
                                            hintText:
                                                'Contraseña de administrador',
                                            labelText: 'Contraseña:',
                                            onChanged: _userAdminUseCase
                                                .changedPassword,
                                            textController: _userAdminUseCase
                                                .passwordController,
                                            oscureText: true,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ButtonSignUp(
                                          value: true,
                                          onSubmit: _onRegisterUserAdmin,
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
            ),
          );
        },
      ),
    );
  }
}

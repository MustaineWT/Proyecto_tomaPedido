import 'package:flutter/material.dart';
import 'package:salesapp_cas/data/services/remote/useradmin_api.dart';
import 'package:salesapp_cas/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cas/domain/usecase/useradmin_usecase.dart';
import 'package:salesapp_cas/presentation/widgets/ShowDialogMessage.dart';
import 'package:salesapp_cas/utils/TextFieldPerzonalice.dart';
import 'package:salesapp_cas/utils/dialogs.dart';
import '../../presentation/signup/local_widget/ButtonSignUp.dart';
import '../../presentation/widgets/CurvePainter.dart';
import '../../utils/colors_constants.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() =>
      _SignUpViewState(UserAdminUseCase(UserAdminApi()));
}

class _SignUpViewState extends State<SignUpView> {
  final UserAdminUseCase _userAdminUseCase;
  _SignUpViewState(this._userAdminUseCase);

  Future<void> _onRegisterUserAdmin() async {
    try {
      ProgressDialog.show(context);
      final result = await _userAdminUseCase.registerUserAdmin();
      ProgressDialog.dissmiss(context);
      if (result == 'Usuario Registrado') {
        return ShowDialogMessage.showDialogMessageWithSignUp(
            context, 'Información', 'Usuario registrado correctamente.');
      }
      if (result == 'Compania ya Existe') {
        return ShowDialogMessage.showDialogMessage(
            context, 'Información', 'Ruc de empresa ya fue registrado.');
      }
      if (result == 'Usuario ya Existe') {
        return ShowDialogMessage.showDialogMessage(
            context, 'Información', 'Usuario ya fue registrado.');
      }
      if (result == 'typing') {
        return ShowDialogMessage.showDialogMessage(
            context, 'Información', 'Por favor llenar los datos necesarios.');
      }
    } on AppException catch (ex) {
      print(ex);
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
                child: SingleChildScrollView(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                30, 144, 255, .3),
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
                                Text('Sales App - Registro',
                                    style: TextStyle(
                                        fontFamily: 'Oswald',
                                        color: blackv2,
                                        fontSize:
                                            constraints.maxHeight * 0.04)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                  'Registrate para poder acceder a todas\n las funcionalidades del app.',
                                  style: TextStyle(
                                      fontFamily: 'Oswald',
                                      color: blackv2,
                                      fontSize: constraints.maxHeight * 0.02)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.002,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(
                          child: Container(
                            height: constraints.maxHeight * 0.77,
                            decoration: BoxDecoration(
                              color: blackv2,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
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
                                            width: constraints.maxWidth * 0.87,
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
                                            width: constraints.maxWidth * 0.87,
                                            child: TextFieldPerzonalice(
                                              constraints: constraints,
                                              hintText: 'Ruc de la empresa',
                                              labelText: 'Ruc de Empresa:',
                                              onChanged:
                                                  _userAdminUseCase.changedRuc,
                                              textController: _userAdminUseCase
                                                  .rucController,
                                            ),
                                          ),
                                          Container(
                                            width: constraints.maxWidth * 0.87,
                                            child: TextFieldPerzonalice(
                                              constraints: constraints,
                                              hintText: 'Dirección de empresa',
                                              labelText:
                                                  'Dirección de Empresa:',
                                              onChanged: _userAdminUseCase
                                                  .changedDirection,
                                              textController: _userAdminUseCase
                                                  .directionController,
                                            ),
                                          ),
                                          Container(
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
                                            width: constraints.maxWidth * 0.87,
                                            child: TextFieldPerzonalice(
                                              constraints: constraints,
                                              hintText:
                                                  'País donde reside la empresa',
                                              labelText: 'País:',
                                              onChanged: _userAdminUseCase
                                                  .changedCountry,
                                              textController: _userAdminUseCase
                                                  .countryController,
                                            ),
                                          ),
                                          Container(
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
                                            width: constraints.maxWidth * 0.87,
                                            child: TextFieldPerzonalice(
                                              constraints: constraints,
                                              hintText:
                                                  'Teléfono de la empresa',
                                              labelText: 'Teléfono:',
                                              onChanged: _userAdminUseCase
                                                  .changedPhone,
                                              textController: _userAdminUseCase
                                                  .phoneController,
                                            ),
                                          ),
                                          Divider(
                                            height: 5,
                                            thickness: 2,
                                            color: black,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              'Datos de Administrador',
                                              style: TextStyle(
                                                color: blueOpac,
                                                fontFamily: 'Oswald',
                                              ),
                                            ),
                                          ),
                                          Container(
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
                                            width: constraints.maxWidth * 0.87,
                                            child: TextFieldPerzonalice(
                                              constraints: constraints,
                                              hintText:
                                                  'Email de administrador',
                                              labelText: 'Email:',
                                              onChanged: _userAdminUseCase
                                                  .changedEmailAdmin,
                                              textController: _userAdminUseCase
                                                  .emailAdminController,
                                            ),
                                          ),
                                          Container(
                                            width: constraints.maxWidth * 0.87,
                                            child: TextFieldPerzonalice(
                                              constraints: constraints,
                                              hintText:
                                                  'Nro de dni o registro de identidad',
                                              labelText: 'Dni:',
                                              onChanged:
                                                  _userAdminUseCase.changedDni,
                                              textController: _userAdminUseCase
                                                  .dniController,
                                            ),
                                          ),
                                          Container(
                                            width: constraints.maxWidth * 0.87,
                                            child: TextFieldPerzonalice(
                                              constraints: constraints,
                                              hintText:
                                                  'Dirección de administrador',
                                              labelText: 'Dirección:',
                                              onChanged: _userAdminUseCase
                                                  .changedDirectionAdmin,
                                              textController: _userAdminUseCase
                                                  .directionAdminController,
                                            ),
                                          ),
                                          Container(
                                            width: constraints.maxWidth * 0.87,
                                            child: TextFieldPerzonalice(
                                              constraints: constraints,
                                              hintText:
                                                  'Ciudad de administrador',
                                              labelText: 'Ciudad:',
                                              onChanged: _userAdminUseCase
                                                  .changedCityAdmin,
                                              textController: _userAdminUseCase
                                                  .cityAdminController,
                                            ),
                                          ),
                                          Container(
                                            width: constraints.maxWidth * 0.87,
                                            child: TextFieldPerzonalice(
                                              constraints: constraints,
                                              hintText: 'País de administrador',
                                              labelText: 'País:',
                                              onChanged: _userAdminUseCase
                                                  .changedCountryAdmin,
                                              textController: _userAdminUseCase
                                                  .countryAdminController,
                                            ),
                                          ),
                                          Container(
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
                                            height:
                                                constraints.maxHeight * 0.01,
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
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'local_widget/ButtonLogin.dart';
import 'local_widget/TextFieldPerzonalice.dart';
import 'local_widget/TextFieldUserPassword.dart';

import 'signup_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.blue[900]!,
              Colors.blue[800]!,
              Colors.blue[500]!,
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Registro',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30)),
                          GestureDetector(
                            onTap: _.onGoToLogin,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Registrate como vendedor o empresa y comienza a trabajar.',
                          style: TextStyle(color: Colors.white, fontSize: 14))
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(30, 144, 255, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFieldPerzonalice(
                                    perzonaliceController: _.nameControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Nombre',
                                    labelText: 'Nombres',
                                    onChangedPerzonalice: _.onChangedName,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController:
                                        _.lastNameControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Apellidos',
                                    labelText: 'Apellidos',
                                    onChangedPerzonalice: _.onChangedLastName,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController:
                                        _.bussinesNameControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Razón Social',
                                    labelText: 'Razón Social',
                                    onChangedPerzonalice:
                                        _.onChangedBussinesName,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController: _.rucControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Ruc',
                                    labelText: 'Ruc',
                                    onChangedPerzonalice: _.onChangedRuc,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController:
                                        _.directionControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Dirección',
                                    labelText: 'Dirección',
                                    onChangedPerzonalice: _.onChangedDirection,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController: _.cityControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Ciudad',
                                    labelText: 'Ciudad',
                                    onChangedPerzonalice: _.onChangedCity,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController: _.countryControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Pais',
                                    labelText: 'Pais',
                                    onChangedPerzonalice: _.onChangedCountry,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController: _.dniControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Dni',
                                    labelText: 'Dni',
                                    onChangedPerzonalice: _.onChangedDni,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController: _.phoneControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Telefono',
                                    labelText: 'Telefono',
                                    onChangedPerzonalice: _.onChangedPhone,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController:
                                        _.emailCompanyControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Email Empresa',
                                    labelText: 'Email Empresa',
                                    onChangedPerzonalice:
                                        _.onChangedEmailCompany,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController:
                                        _.emailAdminControllers,
                                    value: _.values,
                                    errorMessage:
                                        'No ingreso Email Administrador',
                                    labelText: 'Email Administrador',
                                    onChangedPerzonalice: _.onChangedEmailAdmin,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController:
                                        _.directionAdminControllers,
                                    value: _.values,
                                    errorMessage:
                                        'No ingreso Dirección Administrador',
                                    labelText: 'Dirección Administrador',
                                    onChangedPerzonalice:
                                        _.onChangedDirectionAdmin,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController:
                                        _.cityAdminControllers,
                                    value: _.values,
                                    errorMessage:
                                        'No ingreso Ciudad Administrador',
                                    labelText: 'Ciudad Administrador',
                                    onChangedPerzonalice: _.onChangedCityAdmin,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController:
                                        _.countryAdminControllers,
                                    value: _.values,
                                    errorMessage:
                                        'No ingreso Pais Administrador',
                                    labelText: 'Pais Administrador',
                                    onChangedPerzonalice:
                                        _.onChangedCountryAdmin,
                                  ),
                                  TextFieldPerzonalice(
                                    perzonaliceController: _.userControllers,
                                    value: _.values,
                                    errorMessage: 'No ingreso Usuario',
                                    labelText: 'Usuario Administrador',
                                    onChangedPerzonalice: _.onChangedUser,
                                  ),
                                  TextFieldUserPassword(
                                    passwordController: _.passwordControllers,
                                    value: _.values,
                                    secureText: _.secureTexts,
                                    onPressedIcon: _.onPressedIcon,
                                    onChangedPasssword: _.onChangedPassword,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  ButtonLogin(
                                    value: _.values,
                                    onSubmit: _.onRegisterSignUp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

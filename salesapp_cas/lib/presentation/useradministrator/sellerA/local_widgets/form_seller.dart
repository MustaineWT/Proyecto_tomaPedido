import 'package:flutter/material.dart';
import 'package:salesapp_cas/domain/usecase/seller_usecase.dart';
import 'package:salesapp_cas/utils/TextFieldPerzonalice.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

import 'button_register.dart';

class FormSeller extends StatelessWidget {
  const FormSeller({
    Key? key,
    required SellerUseCase sellerUseCase,
    required this.constraints,
    required this.register,
  })   : _sellerUseCase = sellerUseCase,
        super(key: key);

  final SellerUseCase _sellerUseCase;
  final BoxConstraints constraints;
  final Function() register;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
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
                              color: Color.fromRGBO(30, 144, 255, .3),
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
                  Text('Registro de Vendedor',
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          color: blackv2,
                          fontSize: constraints.maxWidth * 0.07)),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            //height: size.height * 0.88,
            decoration: BoxDecoration(
              color: blackv2,
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(30, 144, 255, .3),
                            blurRadius: 30,
                            offset: Offset(0, 10))
                      ]),
                      child: Column(
                        children: [
                          Text(
                            'Datos del Vendedor',
                            style: TextStyle(
                              color: blueOpac,
                              fontFamily: 'Oswald',
                            ),
                          ),
                          TextFieldPerzonalice(
                              constraints: constraints,
                              hintText: 'Nombres',
                              labelText: 'Nombres Completos:',
                              onChanged: _sellerUseCase.changedName,
                              textController: _sellerUseCase.nameController),
                          TextFieldPerzonalice(
                              constraints: constraints,
                              hintText: 'Apellidos',
                              labelText: 'Apellidos Completos:',
                              onChanged: _sellerUseCase.changedLastName,
                              textController:
                                  _sellerUseCase.lastNameController),
                          TextFieldPerzonalice(
                            constraints: constraints,
                            hintText: 'Dirección',
                            labelText: 'Dirección:',
                            onChanged: _sellerUseCase.changedDirection,
                            textController: _sellerUseCase.directionController,
                          ),
                          TextFieldPerzonalice(
                              constraints: constraints,
                              hintText: 'Ciudad',
                              labelText: 'Ciudad:',
                              onChanged: _sellerUseCase.changedCountry,
                              textController: _sellerUseCase.countryController),
                          TextFieldPerzonalice(
                              constraints: constraints,
                              hintText: 'Dni',
                              labelText: 'Dni:',
                              onChanged: _sellerUseCase.changedDni,
                              textController: _sellerUseCase.dniController),
                          TextFieldPerzonalice(
                            constraints: constraints,
                            hintText: 'Teléfono',
                            labelText: 'Teléfono:',
                            onChanged: _sellerUseCase.changedPhone,
                            textController: _sellerUseCase.phoneController,
                          ),
                          TextFieldPerzonalice(
                              constraints: constraints,
                              hintText: 'Correo',
                              labelText: 'Correo:',
                              onChanged: _sellerUseCase.changedEmail,
                              textController: _sellerUseCase.emailController),
                          TextFieldPerzonalice(
                              constraints: constraints,
                              hintText: 'Usuario',
                              labelText: 'Usuario:',
                              onChanged: _sellerUseCase.changedUser,
                              textController: _sellerUseCase.userController),
                          TextFieldPerzonalice(
                              constraints: constraints,
                              oscureText: true,
                              hintText: 'Contraseña',
                              labelText: 'Contraseña:',
                              onChanged: _sellerUseCase.changedPassword,
                              textController:
                                  _sellerUseCase.passwordController),
                          SizedBox(
                            height: 10,
                          ),
                          ButtonRegister(
                            value: true,
                            onSubmit: register,
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
      ],
    );
  }
}

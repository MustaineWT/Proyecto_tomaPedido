import 'package:flutter/material.dart';
import 'package:salesapp_cas/domain/usecase/routes_usecase.dart';
import 'package:salesapp_cas/utils/TextFieldPerzonalice.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

import 'button_register.dart';

class FormRoutes extends StatelessWidget {
  const FormRoutes({
    Key? key,
    required RoutesUseCase routesUseCase,
    required this.constraints,
    required this.register,
  })   : _routesUseCase = routesUseCase,
        super(key: key);

  final RoutesUseCase _routesUseCase;
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
                          Container(
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            height: 45,
                            width: constraints.maxWidth * 0.87,
                            child: TextFieldPerzonalice(
                                constraints: constraints,
                                hintText: 'Ruta',
                                labelText: 'Nro de Ruta:',
                                onChanged: _routesUseCase.changedRoute,
                                textController: _routesUseCase.routeController),
                          ),
                          Container(
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            height: 45,
                            width: constraints.maxWidth * 0.87,
                            child: TextFieldPerzonalice(
                                constraints: constraints,
                                hintText: 'Descripción',
                                labelText: 'Descripción de ruta:',
                                onChanged: _routesUseCase.changedDescription,
                                textController:
                                    _routesUseCase.descriptionController),
                          ),
                          Container(
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            height: 45,
                            width: constraints.maxWidth * 0.87,
                            child: TextFieldPerzonalice(
                              constraints: constraints,
                              hintText: 'Zona',
                              labelText: 'Nro Zona:',
                              onChanged: _routesUseCase.changedZone,
                              textController: _routesUseCase.zoneController,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            height: 45,
                            width: constraints.maxWidth * 0.87,
                            child: TextFieldPerzonalice(
                                constraints: constraints,
                                hintText: 'Fuerza de Venta',
                                labelText: 'FFVV:',
                                onChanged: _routesUseCase.changedFfvv,
                                textController: _routesUseCase.ffvvController),
                          ),
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

import 'package:flutter/material.dart';
import 'package:salesapp_cas/domain/usecase/routes_usecase.dart';
import 'package:salesapp_cas/utils/TextFieldPerzonalice.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

import 'button_back.dart';
import 'button_register.dart';
import 'button_visit.dart';
import 'text_title.dart';

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
                  ButtonBack(),
                  TextTitle(constraints: constraints),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
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
                            'Datos del Ruta',
                            style: TextStyle(
                              color: blueOpac,
                              fontFamily: 'Oswald',
                            ),
                          ),
                          TextFieldPerzonalice(
                              constraints: constraints,
                              hintText: 'Ruta',
                              labelText: 'Nro de Ruta:',
                              onChanged: _routesUseCase.changedRoute,
                              textController: _routesUseCase.routeController),
                          TextFieldPerzonalice(
                              constraints: constraints,
                              hintText: 'Descripción',
                              labelText: 'Descripción de ruta:',
                              onChanged: _routesUseCase.changedDescription,
                              textController:
                                  _routesUseCase.descriptionController),
                          TextFieldPerzonalice(
                            constraints: constraints,
                            hintText: 'Zona',
                            labelText: 'Nro Zona:',
                            onChanged: _routesUseCase.changedZone,
                            textController: _routesUseCase.zoneController,
                          ),
                          TextFieldPerzonalice(
                              constraints: constraints,
                              hintText: 'Fuerza de Venta',
                              labelText: 'FFVV:',
                              onChanged: _routesUseCase.changedFfvv,
                              textController: _routesUseCase.ffvvController),
                          Container(
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            height: 20,
                            width: constraints.maxWidth * 0.87,
                            child: Text('Frecuencia de Visita'),
                          ),
                          Container(
                            width: constraints.maxWidth,
                            height: 80,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ButtonVisit(
                                    nameCard: 'LU',
                                    constraints: constraints,
                                    value: true,
                                    onTap: () {}),
                                ButtonVisit(
                                    nameCard: 'MA',
                                    constraints: constraints,
                                    value: false,
                                    onTap: () {}),
                                ButtonVisit(
                                    nameCard: 'MI',
                                    constraints: constraints,
                                    value: true,
                                    onTap: () {}),
                                ButtonVisit(
                                    nameCard: 'JU',
                                    constraints: constraints,
                                    value: false,
                                    onTap: () {}),
                                ButtonVisit(
                                    nameCard: 'VI',
                                    constraints: constraints,
                                    value: true,
                                    onTap: () {}),
                                ButtonVisit(
                                    nameCard: 'SA',
                                    constraints: constraints,
                                    value: true,
                                    onTap: () {}),
                                ButtonVisit(
                                    nameCard: 'DO',
                                    constraints: constraints,
                                    value: true,
                                    onTap: () {}),
                              ],
                            ),
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

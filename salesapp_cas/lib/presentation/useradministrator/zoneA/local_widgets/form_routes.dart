import 'package:flutter/material.dart';
import 'package:salesapp_cas/domain/usecase/routes_usecase.dart';
import 'package:salesapp_cas/utils/TextFieldPerzonalice.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

import 'button_back.dart';
import 'button_register.dart';
import 'button_visit.dart';
import 'text_title.dart';

class FormRoutes extends StatefulWidget {
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
  _FormRoutesState createState() => _FormRoutesState();
}

class _FormRoutesState extends State<FormRoutes> {
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
                  TextTitle(constraints: widget.constraints),
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
                              constraints: widget.constraints,
                              hintText: 'Ruta',
                              labelText: 'Nro de Ruta:',
                              onChanged: widget._routesUseCase.changedRoute,
                              textController:
                                  widget._routesUseCase.routeController),
                          TextFieldPerzonalice(
                              constraints: widget.constraints,
                              hintText: 'Descripción',
                              labelText: 'Descripción de ruta:',
                              onChanged:
                                  widget._routesUseCase.changedDescription,
                              textController:
                                  widget._routesUseCase.descriptionController),
                          TextFieldPerzonalice(
                            constraints: widget.constraints,
                            hintText: 'Zona',
                            labelText: 'Nro Zona:',
                            onChanged: widget._routesUseCase.changedZone,
                            textController:
                                widget._routesUseCase.zoneController,
                          ),
                          TextFieldPerzonalice(
                              constraints: widget.constraints,
                              hintText: 'Fuerza de Venta',
                              labelText: 'FFVV:',
                              onChanged: widget._routesUseCase.changedFfvv,
                              textController:
                                  widget._routesUseCase.ffvvController),
                          Container(
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            height: 20,
                            width: widget.constraints.maxWidth * 0.87,
                            child: Text('Frecuencia de Visita'),
                          ),
                          Container(
                            width: widget.constraints.maxWidth,
                            height: 80,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ButtonVisit(
                                    nameCard: 'LU',
                                    constraints: widget.constraints,
                                    value: widget._routesUseCase.mo,
                                    onTap: () {
                                      setState(() {
                                        if (widget._routesUseCase.mo == 0) {
                                          widget._routesUseCase.changedMo(1);
                                        } else {
                                          widget._routesUseCase.changedMo(0);
                                        }
                                      });
                                    }),
                                ButtonVisit(
                                    nameCard: 'MA',
                                    constraints: widget.constraints,
                                    value: widget._routesUseCase.tu,
                                    onTap: () {
                                      if (widget._routesUseCase.tu == 0) {
                                        widget._routesUseCase.changedTu(1);
                                      } else {
                                        widget._routesUseCase.changedTu(0);
                                      }
                                      setState(() {});
                                    }),
                                ButtonVisit(
                                    nameCard: 'MI',
                                    constraints: widget.constraints,
                                    value: widget._routesUseCase.we,
                                    onTap: () {
                                      if (widget._routesUseCase.we == 0) {
                                        widget._routesUseCase.changedWe(1);
                                      } else {
                                        widget._routesUseCase.changedWe(0);
                                      }
                                      setState(() {});
                                    }),
                                ButtonVisit(
                                    nameCard: 'JU',
                                    constraints: widget.constraints,
                                    value: widget._routesUseCase.th,
                                    onTap: () {
                                      if (widget._routesUseCase.th == 0) {
                                        widget._routesUseCase.changedTh(1);
                                      } else {
                                        widget._routesUseCase.changedTh(0);
                                      }
                                      setState(() {});
                                    }),
                                ButtonVisit(
                                    nameCard: 'VI',
                                    constraints: widget.constraints,
                                    value: widget._routesUseCase.fr,
                                    onTap: () {
                                      if (widget._routesUseCase.fr == 0) {
                                        widget._routesUseCase.changedFr(1);
                                      } else {
                                        widget._routesUseCase.changedFr(0);
                                      }
                                      setState(() {});
                                    }),
                                ButtonVisit(
                                    nameCard: 'SA',
                                    constraints: widget.constraints,
                                    value: widget._routesUseCase.sa,
                                    onTap: () {
                                      if (widget._routesUseCase.sa == 0) {
                                        widget._routesUseCase.changedSa(1);
                                      } else {
                                        widget._routesUseCase.changedSa(0);
                                      }
                                      setState(() {});
                                    }),
                                ButtonVisit(
                                    nameCard: 'DO',
                                    constraints: widget.constraints,
                                    value: widget._routesUseCase.su,
                                    onTap: () {
                                      if (widget._routesUseCase.su == 0) {
                                        widget._routesUseCase.changedSu(1);
                                      } else {
                                        widget._routesUseCase.changedSu(0);
                                      }
                                      setState(() {});
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ButtonRegister(
                            value: true,
                            onSubmit: widget.register,
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

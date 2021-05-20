import 'package:flutter/material.dart';
import 'package:salesapp_cas/domain/usecase/ffvv_usecase.dart';
import 'package:salesapp_cas/utils/TextFieldPerzonalice.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

import 'button_back.dart';
import 'button_register.dart';
import 'text_title.dart';

class FormFfvv extends StatefulWidget {
  const FormFfvv({
    Key? key,
    required FfvvUseCase ffvvUseCase,
    required this.constraints,
    required this.register,
  })   : _ffvvUseCase = ffvvUseCase,
        super(key: key);

  final FfvvUseCase _ffvvUseCase;
  final BoxConstraints constraints;
  final Function() register;

  @override
  _FormFfvvState createState() => _FormFfvvState();
}

class _FormFfvvState extends State<FormFfvv> {
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
                            'Datos de FFVV',
                            style: TextStyle(
                              color: blueOpac,
                              fontFamily: 'Oswald',
                            ),
                          ),
                          TextFieldPerzonalice(
                              constraints: widget.constraints,
                              hintText: 'FFVV',
                              labelText: 'Nro de FFVV:',
                              onChanged: widget._ffvvUseCase.changedFfvv,
                              textController:
                                  widget._ffvvUseCase.ffvvController),
                          TextFieldPerzonalice(
                              constraints: widget.constraints,
                              hintText: 'Descripción',
                              labelText: 'Descripción de ffvv:',
                              onChanged: widget._ffvvUseCase.changedDescription,
                              textController:
                                  widget._ffvvUseCase.descriptionController),
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

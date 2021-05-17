import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Text('Registro de Ruta',
        style: TextStyle(
            fontFamily: 'Oswald',
            color: blackv2,
            fontSize: constraints.maxWidth * 0.07));
  }
}

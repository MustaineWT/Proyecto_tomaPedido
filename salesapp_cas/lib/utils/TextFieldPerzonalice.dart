import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'colors_constants.dart';

class TextFieldPerzonalice extends StatelessWidget {
  const TextFieldPerzonalice({
    Key? key,
    required this.constraints,
    required this.onChanged,
    required this.textController,
    required this.labelText,
    required this.hintText,
    this.oscureText = false,
  }) : super(key: key);

  final BoxConstraints constraints;
  final Function(String) onChanged;
  final TextEditingController textController;
  final String labelText;
  final String hintText;
  final bool oscureText;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.topLeft,
          child: Text(
            labelText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          )),
      Container(
        height: 40,
        width: constraints.maxWidth,
        padding: EdgeInsets.only(left: 0.5, right: 0.5, top: 0.0, bottom: 0.0),
        child: TextFormField(
          controller: textController,
          onChanged: onChanged,
          scrollPadding: EdgeInsets.all(0),
          style: TextStyle(color: blueOpac, fontSize: 11),
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
          ),
          obscureText: oscureText,
        ),
      ),
    ]);
  }
}

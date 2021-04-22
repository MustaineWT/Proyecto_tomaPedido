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
    return Container(
      width: constraints.minWidth * 0.98,
      padding: EdgeInsets.only(left: 0.5, right: 0.5, top: 0.0, bottom: 0.0),
      child: TextFormField(
        controller: textController,
        onChanged: onChanged,
        scrollPadding: EdgeInsets.all(0),
        style: TextStyle(color: blueOpac, fontSize: 12),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: black, fontSize: 12),
          hintText: hintText,
          hintStyle: TextStyle(color: greyOsc, fontSize: 11),
          border: InputBorder.none,
        ),
        obscureText: oscureText,
      ),
    );
  }
}

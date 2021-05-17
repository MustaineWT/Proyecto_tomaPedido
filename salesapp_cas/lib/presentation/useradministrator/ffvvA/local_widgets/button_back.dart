import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

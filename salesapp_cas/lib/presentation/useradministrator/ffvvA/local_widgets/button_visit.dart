import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

class ButtonVisit extends StatelessWidget {
  const ButtonVisit({
    Key? key,
    required this.constraints,
    required this.value,
    required this.onTap,
    required this.nameCard,
  }) : super(key: key);

  final BoxConstraints constraints;
  final int value;
  final Function() onTap;
  final String nameCard;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth / 8,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          margin: EdgeInsets.all(2),
          elevation: 2.5,
          semanticContainer: false,
          color: value == 0 ? greyOsc : greenOpac,
          child: Center(
              child: Text(
            nameCard,
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

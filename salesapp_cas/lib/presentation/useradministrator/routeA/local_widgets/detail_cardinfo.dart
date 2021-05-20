import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

class DetailCardInfo extends StatelessWidget {
  const DetailCardInfo({
    Key? key,
    required this.zone,
    required this.ffvv,
  }) : super(key: key);

  final String zone;
  final int ffvv;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 22,
      left: 50,
      right: 0,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(
          'Zona: $zone',
          style: TextStyle(
            fontFamily: 'Oswald',
            color: gray,
            fontSize: 12,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'ffvv: $ffvv',
          style: TextStyle(
            fontFamily: 'Oswald',
            color: gray,
            fontSize: 12,
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

class CardInfo extends StatelessWidget {
  const CardInfo(
      {Key? key,
      required this.constrains,
      this.route = '100',
      this.description = 'Oficina',
      this.mo = 'Lu',
      this.tu = 'Ma',
      this.we = 'Mi',
      this.th = 'Ju',
      this.fr = 'Vi',
      this.sa = 'Sa',
      this.su = 'Do',
      this.zone = '1000',
      this.ffvv = 1,
      this.state = 'A'})
      : super(key: key);
  final Size constrains;
  final String route;
  final String description;
  final String zone;
  final String mo;
  final String tu;
  final String we;
  final String th;
  final String fr;
  final String sa;
  final String su;
  final int ffvv;
  final String state;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: constrains.width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(children: [
          Positioned(
            top: 8,
            left: 6,
            child: CircleAvatar(
              backgroundColor: gray,
              radius: 15.0,
              child: Icon(
                Icons.rounded_corner_rounded,
                color: white,
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 50,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$description',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: gray,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$route',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: gray,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
          Positioned(
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
          ),
        ]),
      ),
    );
  }
}

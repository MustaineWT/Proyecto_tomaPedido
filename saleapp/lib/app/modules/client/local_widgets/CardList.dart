import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saleapp/app/utils/colors_constants.dart';

class CardList extends StatelessWidget {
  const CardList(
      {Key? key,
      this.constrains,
      this.nameClient = 'WILLIAMS M. TORRES',
      this.rucClient = '45415098',
      this.codClient = '1',
      this.lPriceClient = '1',
      this.secClient = '1',
      this.phoneClient = '982057542',
      this.observationClient = 'Visita medio dia.',
      this.directionClient = 'Jiron Martir Olaya 1097 SMP',
      this.valueGeoreference = true})
      : super(key: key);
  final BoxConstraints? constrains;
  final String nameClient;
  final String rucClient;
  final String codClient;
  final String lPriceClient;
  final String secClient;
  final String phoneClient;
  final String observationClient;
  final String directionClient;
  final bool valueGeoreference;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: constrains!.maxWidth,
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
            top: 20,
            left: 0,
            child: CircleAvatar(
              backgroundColor: gray,
              radius: 15.0,
              child: Icon(
                Icons.people,
                color: white,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 40.0,
            child: Text(
              '$nameClient',
              style: TextStyle(
                fontFamily: 'Oswald',
                color: gray,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Icon(
                valueGeoreference
                    ? CupertinoIcons.placemark_fill
                    : CupertinoIcons.placemark,
                color: valueGeoreference
                    ? Colors.lightGreen
                    : Colors.grey), //placemark_fill
          ),
          Positioned(
            top: 20,
            left: 40.0,
            right: 50,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'DNI: $rucClient',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: gray,
                  fontSize: 11,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Código: $codClient',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: gray,
                  fontSize: 11,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'LPrecio: $lPriceClient',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: gray,
                  fontSize: 11,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Sec: $secClient',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: gray,
                  fontSize: 11,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Tlf: $phoneClient',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: gray,
                  fontSize: 11,
                ),
              ),
            ]),
          ),
          Positioned(
            top: 33,
            left: 40.0,
            child: Text(
              'Observación: $observationClient',
              style: TextStyle(
                fontFamily: 'Oswald',
                color: gray,
                fontSize: 11,
              ),
            ),
          ),
          Positioned(
            top: 47,
            left: 40.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: constrains!.maxWidth,
                    child: Text(
                      '$directionClient',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        color: gray,
                        fontSize: 11,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}

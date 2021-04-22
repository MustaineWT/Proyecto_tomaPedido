import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

class CardList extends StatelessWidget {
  const CardList(
      {Key? key,
      required this.constrains,
      this.personId = 1017,
      this.name = 'Williams M.',
      this.lastName = 'Torres Bajonero',
      this.dni = '45415098',
      this.phone = '932580766',
      this.description = 'Vendedor',
      this.email = 'wmtorresb@gmail.com',
      this.direction = 'Jiron Martir Olaya 1097 SMP',
      this.city = 'Peru',
      this.country = 'Lima',
      this.state = 'A'})
      : super(key: key);
  final Size constrains;
  final int personId;
  final String name;
  final String lastName;
  final String dni;
  final String phone;
  final String description;
  final String email;
  final String direction;
  final String city;
  final String country;
  final String state;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
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
            top: 23,
            left: 6,
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
              left: 50,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$name $lastName',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: gray,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Tipo: $description',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: gray,
                      fontSize: 12,
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
                'DNI: $dni',
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
                'Código: $personId',
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
                'Telefono: $phone',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: gray,
                  fontSize: 12,
                ),
              ),
            ]),
          ),
          Positioned(
            top: 35,
            left: 50,
            child: Text(
              'Correo: $email',
              style: TextStyle(
                fontFamily: 'Oswald',
                color: gray,
                fontSize: 12,
              ),
            ),
          ),
          Positioned(
              top: 47,
              left: 50,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Pais: $city',
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
                    'Ciudad: $country',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: gray,
                      fontSize: 12,
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 60,
            left: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: constrains.width,
                    child: Text(
                      '$direction',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        color: gray,
                        fontSize: 12,
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

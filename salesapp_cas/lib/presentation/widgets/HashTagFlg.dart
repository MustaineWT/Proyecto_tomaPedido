import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

class HashtagFlg extends StatelessWidget {
  const HashtagFlg({
    Key? key,
    required this.name,
    required this.activate,
  }) : super(key: key);
  final String name;
  final int activate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: activate == 1 ? greenOsc : greyOsc,
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontFamily: 'Oswald',
              color: white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

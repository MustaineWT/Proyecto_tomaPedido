import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

import 'avatarcircle_cardinfo.dart';
import 'description_cardinfo.dart';

class CardInfo extends StatelessWidget {
  const CardInfo(
      {Key? key,
      required this.constrains,
      this.zone = 'Zone',
      this.description = 'General',
      this.ffvv = 1,
      this.state = 'A'})
      : super(key: key);
  final Size constrains;
  final String description;
  final String zone;
  final int ffvv;
  final String state;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
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
          AvatarCircleCardInfo(),
          DescriptionZoneCardInfo(
              zone: zone, description: description, ffvv: ffvv),
        ]),
      ),
    );
  }
}

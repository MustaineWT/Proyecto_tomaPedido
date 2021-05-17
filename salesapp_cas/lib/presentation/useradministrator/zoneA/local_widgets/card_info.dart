import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

import 'avatarcircle_cardinfo.dart';
import 'description_cardinfo.dart';
import 'listviewday_cardinfo.dart';
import 'zoneffvv_cardinfo.dart';

class CardInfo extends StatelessWidget {
  const CardInfo(
      {Key? key,
      required this.constrains,
      this.route = '100',
      this.description = 'Oficina',
      this.mo = 1,
      this.tu = 1,
      this.we = 1,
      this.th = 1,
      this.fr = 1,
      this.sa = 1,
      this.su = 1,
      this.zone = '1000',
      this.ffvv = 1,
      this.state = 'A'})
      : super(key: key);
  final Size constrains;
  final String route;
  final String description;
  final String zone;
  final int mo;
  final int tu;
  final int we;
  final int th;
  final int fr;
  final int sa;
  final int su;
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
          DescriptionRouteCardInfo(description: description, route: route),
          ZoneFFVVCardInfo(zone: zone, ffvv: ffvv),
          ListViewDaysCardInfo(
              constrains: constrains,
              mo: mo,
              tu: tu,
              we: we,
              th: th,
              fr: fr,
              sa: sa,
              su: su),
        ]),
      ),
    );
  }
}

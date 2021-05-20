import 'package:flutter/material.dart';
import 'package:salesapp_cas/presentation/widgets/HashTagFlg.dart';

class ListViewDaysCardInfo extends StatelessWidget {
  const ListViewDaysCardInfo({
    Key? key,
    required this.constrains,
    required this.mo,
    required this.tu,
    required this.we,
    required this.th,
    required this.fr,
    required this.sa,
    required this.su,
  }) : super(key: key);

  final Size constrains;
  final int mo;
  final int tu;
  final int we;
  final int th;
  final int fr;
  final int sa;
  final int su;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40,
        left: 50,
        right: 0,
        child: Container(
          height: 25,
          width: constrains.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              HashtagFlg(
                name: 'Lu',
                activate: mo,
              ),
              HashtagFlg(
                name: 'Mar',
                activate: tu,
              ),
              HashtagFlg(
                name: 'Mier',
                activate: we,
              ),
              HashtagFlg(
                name: 'Jue',
                activate: th,
              ),
              HashtagFlg(
                name: 'Vier',
                activate: fr,
              ),
              HashtagFlg(
                name: 'Sab',
                activate: sa,
              ),
              HashtagFlg(
                name: 'Dom',
                activate: su,
              ),
            ],
          ),
        ));
  }
}

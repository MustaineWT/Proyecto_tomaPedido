import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:salesapp_cas/data/datasource/sellerdb.dart';
import 'package:salesapp_cas/data/models/seller/seller.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'local_widgets/card_info.dart';

class SellerAdminView extends StatefulWidget {
  @override
  _SellerAdminViewState createState() => _SellerAdminViewState();
}

class _SellerAdminViewState extends State<SellerAdminView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: size.width,
        height: size.height - 63,
        decoration: BoxDecoration(color: white),
        child: ValueListenableBuilder(
            valueListenable: SellerDB.getOpenSellerBox().listenable(),
            builder: (context, Box<Seller> _sellerBox, _) {
              return ListView.builder(
                itemCount: _sellerBox.values.length,
                itemBuilder: (context, index) {
                  final _seller = _sellerBox.getAt(index);
                  // ignore: unnecessary_null_comparison
                  return CardInfo(
                    constrains: size,
                    personId: _seller!.personId,
                    name: _seller.name,
                    lastName: _seller.lastName,
                    dni: _seller.dni,
                    phone: _seller.phone,
                    description: _seller.description,
                    email: _seller.email,
                    direction: _seller.direction,
                    city: _seller.city,
                    country: _seller.country,
                    state: _seller.state,
                  );
                },
              );
            }),
      ),
      Positioned(
        bottom: 5.0,
        right: 5.0,
        child: Container(
          height: 45,
          width: 45,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: gray,
            onPressed: () async {
              Navigator.of(context)
                  .pushNamed("/regseller")
                  .then((value) => setState(() {}));
            },
          ),
        ),
      ),
    ]);
  }
}

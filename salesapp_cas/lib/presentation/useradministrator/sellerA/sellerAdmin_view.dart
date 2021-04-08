import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

import 'local_widgets/CardList.dart';

class SellerAdminView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
          width: size.width,
          height: size.height - 63,
          decoration: BoxDecoration(color: white),
          child: LayoutBuilder(builder: (contxt, constraints) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
//                  final Client client = _.listWidgets[index];
                return CardList(
                  constrains: constraints,
                );
              },
            );
          })),
      Positioned(
        bottom: 5.0,
        right: 5.0,
        child: Container(
          height: 45,
          width: 45,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: gray,
            onPressed: () {},
          ),
        ),
      ),
    ]);
  }
}

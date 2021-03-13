import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saleapp/app/modules/client/client_controller.dart';
import 'package:saleapp/app/modules/client/local_widgets/CardList.dart';
import 'package:saleapp/app/utils/colors_constants.dart';

class ClientView extends GetView<ClientController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ClientController>(
      init: ClientController(),
      builder: (_) => Stack(children: [
        Container(
            width: size.width,
            height: size.height - 63,
            decoration: BoxDecoration(color: white),
            child: LayoutBuilder(builder: (contxt, constraints) {
              return ListView.builder(
                itemCount: _.listWidgets.length,
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
      ]),
    );
  }
}

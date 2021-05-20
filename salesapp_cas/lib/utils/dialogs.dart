import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors_constants.dart';

abstract class ProgressDialogp {
  static show(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black12.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  static dissmiss(BuildContext context) {
    Navigator.pop(context);
  }

  static showProgress(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return Center(
            child: CircularProgressIndicator(),
          );
          /* Container(
            // width: double.infinity,
            //height: double.infinity,
            color: Colors.black12.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ); */
        });
  }

  static showLoadInformation(BuildContext context, String title, double total) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Información',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cargando...$total%',
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                    Text(
                      title,
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: LinearProgressIndicator(
                    backgroundColor: blue,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

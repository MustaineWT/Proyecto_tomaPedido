import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
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
}

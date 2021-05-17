import 'package:flutter/material.dart';

class DismissbleWidget<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final DismissDirectionCallback onDismissed;

  const DismissbleWidget({
    required this.item,
    required this.child,
    required this.onDismissed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Dismissible(
        //direction: DismissDirection.endToStart,
        key: ObjectKey(item),
        background: buildSwipeActionLeft(),
        secondaryBackground: buildSwipeActionRight(),
        child: child,
        onDismissed: onDismissed,
      );
}

Widget buildSwipeActionLeft() => Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.green,
      child: Icon(
        Icons.edit,
        color: Colors.white,
        size: 15,
      ),
    );

Widget buildSwipeActionRight() => Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.red,
      child: Icon(
        Icons.cleaning_services_sharp,
        color: Colors.white,
        size: 15,
      ),
    );

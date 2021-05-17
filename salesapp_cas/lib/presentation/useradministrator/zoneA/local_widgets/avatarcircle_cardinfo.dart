import 'package:flutter/material.dart';
import 'package:salesapp_cas/utils/colors_constants.dart';

class AvatarCircleCardInfo extends StatelessWidget {
  const AvatarCircleCardInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      left: 6,
      child: CircleAvatar(
        backgroundColor: gray,
        radius: 15.0,
        child: Icon(
          Icons.rounded_corner_rounded,
          color: white,
        ),
      ),
    );
  }
}

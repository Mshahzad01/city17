import 'package:city17/src/constant/app_constants.dart';
import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key, superkey, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.only(right: myPadding / 3, left: myPadding / 3),
      height: 14,
      width: 14,
      color: color,
    );
  }
}

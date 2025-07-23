import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class SwitchTileWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const SwitchTileWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.borderRadius = myPadding / 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: myPadding / 2, bottom: myPadding / 2),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),

      child: ListTile(
        minTileHeight: 00,
        contentPadding: const EdgeInsets.symmetric(horizontal: myPadding / 3),
        title: Text(
          StringData.atomaticapproval,
          style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
        ),

        trailing: Transform.scale(
          alignment: Alignment.centerRight,
          scale: 0.5,
          child: Switch(value: value, onChanged: onChanged),
        ),
      ),
    );
  }
}

import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class SwitchTileWidget extends StatelessWidget {



  const SwitchTileWidget({super.key, 
    
    required this.title,
    required this.value,
    required this.onChanged,
    this.backgroundColor, 
    this.fontzie, 
    this.scaleValue,


  });

    final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? backgroundColor;
  final double? fontzie;
  final double? scaleValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
          style: context.myTextTheme.titleSmall?.copyWith(fontSize: fontzie ?? 09),
        ),

        trailing: Transform.scale(
          alignment: Alignment.centerRight,
          scale:scaleValue ?? 0.6,
          child: Switch(value: value, onChanged: onChanged),
        ),
      ),
    );
  }
}

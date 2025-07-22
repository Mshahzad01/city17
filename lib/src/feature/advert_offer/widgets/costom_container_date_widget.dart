import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class CustomaContainerDate extends StatelessWidget {
  CustomaContainerDate({super.key, required this.title, required this.data});
  final String title;
  var data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(myPadding / 5),
      margin: const EdgeInsets.only(top: myPadding / 2),

      height: 40,
      width: 75,
      decoration: BoxDecoration(
        color: AppColors.secondarycolor,
        borderRadius: BorderRadius.circular(08),
      ),

      child: Column(
        children: [
          Text(
            title,
            style: context.myTextTheme.titleSmall?.copyWith(
              fontSize: 09,
              color: AppColors.primaryTextcolor.withValues(alpha: 0.4),
            ),
          ),
          const SizedBox(height: myPadding / 4),
          Text(
            data,
            style: context.myTextTheme.titleMedium?.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

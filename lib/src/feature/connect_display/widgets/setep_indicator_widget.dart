import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class SetepIndicatorWidget extends StatelessWidget {
  const SetepIndicatorWidget({super.key, required this.currentsetyp});

  final int currentsetyp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return Text(
          'Setp ${index + 1}',
          style: context.myTextTheme.titleMedium?.copyWith(
            color: index == currentsetyp
                ? AppColors.textcolor
                : AppColors.textcolor.withValues(alpha: 0.4),
          ),
        );
      }),
    );
  }
}

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class DisplayLocationWidget extends StatelessWidget {
  const DisplayLocationWidget({super.key,required this.displayLocation,required this.locationAddress});
  final String displayLocation;
  final String locationAddress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringData.display,
              style: context.myTextTheme.titleSmall?.copyWith(
                fontSize: 11,
                color: AppColors.primaryTextcolor.withValues(alpha: 0.4),
              ),
            ),

            Text(
              displayLocation,
              style: context.myTextTheme.titleSmall?.copyWith(fontSize: 12),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              locationAddress,
              style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}

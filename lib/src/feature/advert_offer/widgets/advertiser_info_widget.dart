import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class AdvertiserInfoWidget extends StatelessWidget {
  const AdvertiserInfoWidget({
    super.key,
    required this.advertiserName,
    required this.advertiserPhoneNumber,
    required this.advertiserImage,
    this.displyHeding,
    this.radius,
    this.bagroundColor,
    this.containerHeight,
    this.fontSize,
  });

  final String advertiserName;
  final int advertiserPhoneNumber;
  final String advertiserImage;
  final bool? displyHeding;
  final double? radius;
  final Color? bagroundColor;
  final double? containerHeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding / 2,
        vertical: myPadding / 4,
      ),
      alignment: Alignment.center,
      height: containerHeight ?? 65,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(myPadding / 4),
        color: bagroundColor ?? AppColors.secondarycolor,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (displyHeding == true)
            Text(
              StringData.advertiser,
              style: context.myTextTheme.titleSmall?.copyWith(
                color: AppColors.primaryTextcolor.withValues(alpha: 0.4),
              ),
            ),

          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
            minTileHeight: 00,

            title: Text(
              advertiserName,
              style: context.myTextTheme.titleMedium?.copyWith(
                fontSize: fontSize ?? 14,
              ),
            ),

            leading: CircleAvatar(
              radius: radius ?? 16,
              backgroundImage: NetworkImage(advertiserImage),
            ),

            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.phone, size: 14),
                const SizedBox(width: myPadding / 4),
                Text(
                  advertiserPhoneNumber.toString(),
                  style: context.myTextTheme.titleMedium?.copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: fontSize ?? 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSlotWidget extends StatelessWidget {
  const TimeSlotWidget({
    super.key,
    required this.ad,
    this.containerHeight,
    this.containerWidth,
    this.backgroundColor,
    this.fontSize,
    this.timeLineWidth,
    this.timeLineHeight,
    this.priceCotanier,
    this.timeLineColor,
  });
  final AdvertismentModel ad;
  final double? containerHeight;
  final double? containerWidth;
  final Color? backgroundColor;
  final double? fontSize;
  final double? timeLineWidth;
  final double? timeLineHeight;
  final bool? priceCotanier;
  final Color? timeLineColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: myPadding / 2),
      margin: const EdgeInsets.only(right: myPadding / 3),
      width: containerWidth ?? 60,
      height: containerHeight ?? 390,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor ?? AppColors.primarycolor,
      ),
      child: Column(
        children: [
          // Top price tag
          if (priceCotanier == true)
            Container(
              alignment: Alignment.center,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.successTextcolor.withValues(alpha: 0.3),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(myPadding / 2),
                ),
              ),
              child: Text(
                '\$${ad.amount.amount}-\$${ad.maximumprice}/hr',
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 10,
                  color: AppColors.successTextcolor,
                ),
              ),
            ),

          const SizedBox(height: myPadding / 3),

          // Start time
          Text(
            ad.startTime.hourOnly(),
            style: context.myTextTheme.titleSmall?.copyWith(
              fontSize: fontSize ?? 12,
            ),
          ),

          // Time slots column
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  top: 6,
                  left: 27,
                  right: 27,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: timeLineColor ?? AppColors.secondarycolor,
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: ad.scheduledTimes.length,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index) {
                    final slot = ad.scheduledTimes[index];
                    return Column(
                      children: [
                        Container(
                          width: timeLineWidth ?? 5,
                          height: timeLineHeight ?? 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: slot.isasepted
                                ? AppColors.successTextcolor
                                : timeLineColor ?? AppColors.secondarycolor,
                          ),
                        ),
                        Text(
                          DateFormat('hh:mm').format(slot.time),
                          style: context.myTextTheme.titleSmall?.copyWith(
                            fontSize: fontSize ?? 14,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: myPadding / 3),

          // End time
          Text(
            ad.endTime.hourOnly(),
            style: context.myTextTheme.titleSmall?.copyWith(
              fontSize: fontSize ?? 12,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class PendingPaymentInfoWidget extends StatelessWidget {
  const PendingPaymentInfoWidget({
    super.key,
    required this.dueDate,
    required this.payment,

    required this.amount,
    required this.textColor,
    required this.camepaignName,
  });

  final String dueDate;
  final String payment;

  final String amount;
  final Color textColor;
  final String camepaignName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: myPadding / 2, right: myPadding / 2),
      margin: const EdgeInsets.only(top: myPadding / 3),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryTextcolor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(myPadding / 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringData.dueDate,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 08,
                  color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
                ),
              ),

              Text(
                StringData.payment,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 08,
                  color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
                ),
              ),

              Text(
                StringData.campaignName,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 08,
                  color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
                ),
              ),

              Text(
                StringData.amount,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 09,
                  color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dueDate,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 10,
                  color: textColor,
                ),
              ),

              Text(
                payment,
                style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
              ),

              Text(
                camepaignName,
                style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
              ),
              const SizedBox(width: 04),
              Text(
                amount,

                style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

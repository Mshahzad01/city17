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

  //@override
  //Widget build(BuildContext context) {
  // return Container(
  //   alignment: Alignment.center,
  //   padding: const EdgeInsets.only(left: myPadding / 2, right: myPadding / 2),
  //   margin: EdgeInsets.only(top: myPadding / 3),
  //   height: 40,
  //   width: double.infinity,
  //   decoration: BoxDecoration(
  //     color: AppColors.primaryTextcolor.withValues(alpha: 0.1),
  //     borderRadius: BorderRadius.circular(myPadding / 3),
  //   ),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             StringData.dueDate,
  //             style: context.myTextTheme.titleSmall?.copyWith(
  //               fontSize: 08,
  //               color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
  //             ),
  //           ),

  //           Text(
  //             StringData.payment,
  //             style: context.myTextTheme.titleSmall?.copyWith(
  //               fontSize: 08,
  //               color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
  //             ),
  //           ),

  //           Text(
  //             StringData.campaignName,
  //             style: context.myTextTheme.titleSmall?.copyWith(
  //               fontSize: 08,
  //               color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
  //             ),
  //           ),

  //           Text(
  //             StringData.amount,
  //             style: context.myTextTheme.titleSmall?.copyWith(
  //               fontSize: 09,
  //               color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
  //             ),
  //           ),
  //         ],
  //       ),

  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             dueDate,
  //             style: context.myTextTheme.titleSmall?.copyWith(
  //               fontSize: 10,
  //               color: textColor,
  //             ),
  //           ),

  //           Text(
  //             payment,
  //             style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
  //           ),

  //           Text(
  //             camepaignName,
  //             style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
  //           ),
  //           SizedBox(width: 04),
  //           Text(
  //             amount,

  //             style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
  //           ),
  //         ],
  //       ),
  //     ],
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: myPadding / 2,
        horizontal: myPadding / 2,
      ),
      margin: EdgeInsets.only(top: myPadding / 2),
      decoration: BoxDecoration(
        color: AppColors.primaryTextcolor.withAlpha(25), // Simplified alpha
        borderRadius: BorderRadius.circular(myPadding / 3),
      ),
      child: Table(
        // Sab columns ko barabar ki width dega, bilkul Expanded ki tarah
        defaultColumnWidth: const FlexColumnWidth(1.0),
        children: [
          // Pehli Row (Headers)
          TableRow(
            children: [
              Text(
                StringData.dueDate,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 8,
                  color: AppColors.primaryTextcolor.withAlpha(
                    77,
                  ), // Simplified alpha
                ),
              ),
              Text(
                StringData.payment,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 8,
                  color: AppColors.primaryTextcolor.withAlpha(77),
                ),
              ),
              Text(
                StringData.campaignName,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 8,
                  color: AppColors.primaryTextcolor.withAlpha(77),
                ),
              ),
              Text(
                StringData.amount,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 9,
                  color: AppColors.primaryTextcolor.withAlpha(77),
                ),
              ),
            ],
          ),

          // Thora sa vertical space dene ke liye
          const TableRow(
            children: [
              SizedBox(height: 3),
              SizedBox(height: 3),
              SizedBox(height: 3),
              SizedBox(height: 3),
            ],
          ),

          // Doosri Row (Data)
          TableRow(
            children: [
              Text(
                dueDate,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 10,
                  color: textColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                payment,
                style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                camepaignName,
                style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // Lambe text ke liye
              ),

              Text(
                amount,
                style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

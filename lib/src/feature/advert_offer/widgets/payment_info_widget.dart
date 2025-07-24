// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class PaymentInfoWidget extends StatelessWidget {
  const PaymentInfoWidget({
    super.key,
    required this.dueDate,
    required this.paymentType,
    required this.paymentDetail,
    required this.totalAmount,
    required this.textColor,
  });

  final String dueDate;
  final String paymentType;
  final String paymentDetail;
  final String totalAmount;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: myPadding / 2),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondarycolor,
        borderRadius: BorderRadius.circular(myPadding / 2),
      ),

      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              left: myPadding * 1.5,
              //right: myPadding / 2,
            ),
            margin: EdgeInsets.all(myPadding / 2),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(myPadding / 2),
              color: AppColors.primaryTextcolor.withValues(alpha: 0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Expanded(
                      child: Text(
                        StringData.dueDate,
                        style: context.myTextTheme.titleSmall?.copyWith(
                          fontSize: 09,
                          color: AppColors.primaryTextcolor.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        StringData.payment,
                        style: context.myTextTheme.titleSmall?.copyWith(
                          fontSize: 09,
                          color: AppColors.primaryTextcolor.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        StringData.detail,
                        style: context.myTextTheme.titleSmall?.copyWith(
                          fontSize: 09,
                          color: AppColors.primaryTextcolor.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        dueDate,
                        style: context.myTextTheme.titleSmall?.copyWith(
                          fontSize: 11,
                          color: textColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        paymentType,
                        style: context.myTextTheme.titleSmall?.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        paymentDetail,

                        style: context.myTextTheme.titleSmall?.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: myPadding / 2,
              right: myPadding / 2,
              top: myPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringData.totalAmount,
                  style: context.myTextTheme.titleSmall?.copyWith(
                    color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
                  ),
                ),

                Text(totalAmount, style: context.myTextTheme.titleMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

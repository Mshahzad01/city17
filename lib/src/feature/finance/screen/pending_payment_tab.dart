import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/widgets/advertiser_info_widget.dart';
import 'package:city17/src/feature/finance/widgets/pending_payment_info_widget.dart';
import 'package:flutter/material.dart';

class PendinPayments extends StatefulWidget {
  const PendinPayments({super.key});

  @override
  State<PendinPayments> createState() => _PendinPaymentsState();
}

class _PendinPaymentsState extends State<PendinPayments> {
  final mapData = AdvertismentModel.getDateMappedData();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...mapData.entries.map((e) {
          final entryKey = e.key;
          final data = e.value;

          return Column(
            children: [
              SizedBox(height: myPadding),
              ...data.map((ad) {
                return Container(
                  padding: EdgeInsets.all(myPadding / 2),
                  margin: EdgeInsets.only(top: myPadding / 2),
                  // height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(myPadding / 2),

                    color: AppColors.secondarycolor,
                  ),

                  child: Column(
                    children: [
                      AdvertiserInfoWidget(
                        displyHeding: false,
                        bagroundColor: AppColors.primarycolor,
                        containerHeight: 45,
                        radius: 12,
                        fontSize: 12,

                        advertiserName: ad.advertiserName,
                        advertiserPhoneNumber: ad.advertiserPhoneNumber,
                        advertiserImage: ad.advertiserImage,
                      ),

                      PendingPaymentInfoWidget(
                        dueDate: ad.endDate.dateFormat(),
                        payment: ad.paymentFrequency.title,

                        amount: ad.amount.show(),
                        textColor: AppColors.errorTextcolor,
                        camepaignName: ad.campaignName,
                      ),
                      SizedBox(height: myPadding * 1.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringData.totalAmount,
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.primaryTextcolor.withValues(
                                alpha: 0.3,
                              ),
                            ),
                          ),
                          Text(
                            ad.amount.show(),
                            style: context.myTextTheme.titleSmall?.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          );
        }),
      ],
    );
  }
}

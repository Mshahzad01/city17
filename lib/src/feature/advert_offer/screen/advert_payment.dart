import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/enum/payment_frequency_enum.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/widgets/advertiser_info_widget.dart';
import 'package:city17/src/feature/advert_offer/widgets/costom_container_widget.dart';
import 'package:city17/src/feature/advert_offer/widgets/display_location.dart';
import 'package:city17/src/feature/advert_offer/widgets/payment_info_widget.dart';
import 'package:flutter/material.dart';

class AdvertPaymentScreen extends StatefulWidget {
  const AdvertPaymentScreen({super.key, required this.ads});

  final AdvertismentModel ads;

  @override
  State<AdvertPaymentScreen> createState() => _AdvertPaymentScreenState();
}

class _AdvertPaymentScreenState extends State<AdvertPaymentScreen> {
  PaymentFrequencyEnum weekly = PaymentFrequencyEnum.weekly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringData.advertPayment,
          style: context.myTextTheme.titleMedium,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: myPadding,
          vertical: myPadding,
        ),
        child: ListView(
          children: [
            //Advert Info widget
            AdvertiserInfoWidget(
              displyHeding: true,
              advertiserName: widget.ads.advertiserName,
              advertiserPhoneNumber: widget.ads.advertiserPhoneNumber,
              advertiserImage: widget.ads.advertiserImage,
            ),

            const SizedBox(height: myPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringData.campaignName,
                  style: context.myTextTheme.titleMedium,
                ),

                // status information with enum
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 55,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(myPadding / 3),
                    color: widget.ads.status.color.withValues(alpha: 0.1),
                  ),
                  child: Text(
                    widget.ads.status.title,
                    style: context.myTextTheme.titleMedium?.copyWith(
                      fontSize: 11,
                      color: widget.ads.status.color,
                    ),
                  ),
                ),
              ],
            ),
            // Container widgets
            Wrap(
              spacing: myPadding / 1.2,

              children: [
                const CustomContainerWidget(
                  title: StringData.offer,
                  data: StringData.bidRate,
                  height: 40,
                  width: 100,
                  bagroundColor: Color(0x1AF4F4F4),
                ),

                CustomContainerWidget(
                  height: 40,
                  width: 100,
                  title: StringData.hoursday,
                  data: widget.ads.hoursPerDay.toString(),
                  bagroundColor: AppColors.secondarycolor,
                ),

                CustomContainerWidget(
                  height: 40,
                  width: 100,
                  title: StringData.bidperhoure,
                  data:
                      '\$${widget.ads.maximumprice}-${widget.ads.maximumprice}',
                  bagroundColor: AppColors.secondarycolor,
                ),
                CustomContainerWidget(
                  height: 40,
                  width: 100,
                  title: StringData.paymentCycle,
                  data: PaymentFrequencyEnum.weekly.title,
                  bagroundColor: AppColors.secondarycolor,
                ),
                CustomContainerWidget(
                  height: 40,
                  width: 100,
                  title: StringData.upComingDue,
                  data: widget.ads.endTime.monthYearFormat(),
                  bagroundColor: AppColors.secondarycolor,
                ),
                CustomContainerWidget(
                  height: 40,
                  width: 100,
                  title: StringData.schedule,
                  data:
                      '${widget.ads.startDate.dayMonthFormat()}-${widget.ads.endDate.dayMonthFormat()}',
                  bagroundColor: AppColors.secondarycolor,
                ),
              ],
            ),
            const SizedBox(height: myPadding),

            // Display Location Widget
            DisplayLocationWidget(
              displayLocation: widget.ads.displayLocation,
              locationAddress: widget.ads.locationAddress,
            ),

            const SizedBox(height: myPadding * 2),

            Text(
              StringData.paymentOverdue,
              style: context.myTextTheme.titleMedium,
            ),

            PaymentInfoWidget(
              dueDate: widget.ads.endDate.dateFormat(),
              paymentType: widget.ads.paymentFrequency.title,
              paymentDetail:
                  '${widget.ads.hoursPerDay.toString()}hours@ ${widget.ads.amount.show()}',
              totalAmount: widget.ads.amount.show(),
              textColor: AppColors.errorTextcolor,
            ),

            const SizedBox(height: myPadding * 2),
            Text(
              StringData.upComingPayment,
              style: context.myTextTheme.titleMedium,
            ),
            PaymentInfoWidget(
              textColor: AppColors.accentTextcolor,
              dueDate: widget.ads.startDate.dateFormat(),
              paymentType: widget.ads.paymentFrequency.title,
              paymentDetail:
                  '${widget.ads.hoursPerDay.toString()}hours@ ${widget.ads.amount.show()}',
              totalAmount: widget.ads.amount.show(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/enum/schedule_type_enum.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/widgets/costom_container_date_widget.dart';
import 'package:flutter/material.dart';

class AdvertPaymentScreen extends StatefulWidget {
  const AdvertPaymentScreen({super.key, required this.ads});

  final AdvertismentModel ads;

  @override
  State<AdvertPaymentScreen> createState() => _AdvertPaymentScreenState();
}

class _AdvertPaymentScreenState extends State<AdvertPaymentScreen> {
  ScheduleTypeEnum weekly = ScheduleTypeEnum.weekly;

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
        padding: EdgeInsets.symmetric(
          horizontal: myPadding,
          vertical: myPadding,
        ),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: myPadding / 2,
                vertical: myPadding / 4,
              ),
              alignment: Alignment.center,
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(myPadding / 4),
                color: AppColors.secondarycolor,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    StringData.advertiser,
                    style: context.myTextTheme.titleSmall?.copyWith(
                      color: AppColors.primaryTextcolor.withValues(alpha: 0.4),
                    ),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    minTileHeight: 00,
                    title: Text(
                      widget.ads.advertiserName,
                      style: context.myTextTheme.titleMedium?.copyWith(
                        fontSize: 14,
                      ),
                    ),

                    leading: CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(widget.ads.advertiserImage),
                    ),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.phone, size: 14),
                        const SizedBox(width: myPadding / 4),
                        Text(
                          widget.ads.advertiserPhoneNumber.toString(),
                          style: context.myTextTheme.titleMedium?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: myPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringData.campaignName,
                  style: context.myTextTheme.titleMedium,
                ),

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

            Wrap(
              spacing: myPadding / 1.2,

              children: [
                const CustomaContainerDate(
                  title: StringData.offer,
                  data: StringData.bidRate,
                  height: 40,
                  width: 100,
                  bagroundColor: Color(0x1AF4F4F4),
                ),

                CustomaContainerDate(
                  height: 40,
                  width: 100,
                  title: StringData.hoursday,
                  data: widget.ads.hoursPerDay.toString(),
                  bagroundColor: AppColors.secondarycolor,
                ),

                CustomaContainerDate(
                  height: 40,
                  width: 100,
                  title: StringData.bidperhoure,
                  data:
                      '\$${widget.ads.maximumprice}-${widget.ads.maximumprice}',
                  bagroundColor: AppColors.secondarycolor,
                ),
                CustomaContainerDate(
                  height: 40,
                  width: 100,
                  title: StringData.paymentCycle,
                  data: ScheduleTypeEnum.weekly.title,
                  bagroundColor: AppColors.secondarycolor,
                ),
                CustomaContainerDate(
                  height: 40,
                  width: 100,
                  title: StringData.upComingDue,
                  data: widget.ads.endTime.monthYearFormat(),
                  bagroundColor: AppColors.secondarycolor,
                ),
                CustomaContainerDate(
                  height: 40,
                  width: 100,
                  title: StringData.schedule,
                  data:
                      '${widget.ads.startDate.dayMonthFormat()}-${widget.ads.endDate.dayMonthFormat()}',
                  bagroundColor: AppColors.secondarycolor,
                ),
              ],
            ),
            SizedBox(height: myPadding),
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
                  widget.ads.displayLocation,
                  style: context.myTextTheme.titleSmall?.copyWith(fontSize: 12),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.ads.locationAddress,
                  style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
                ),
              ],
            ),

            SizedBox(height: myPadding * 2),

            Text(
              StringData.paymentOverdue,
              style: context.myTextTheme.titleMedium,
            ),

            Container(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: myPadding / 2,
                      vertical: myPadding / 2,
                    ),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(myPadding / 2),
                      color: AppColors.primaryTextcolor.withValues(alpha: 0.1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              StringData.dueDate,
                              style: context.myTextTheme.titleSmall?.copyWith(),
                            ),
                            Text(
                              StringData.payment,
                              style: context.myTextTheme.titleSmall?.copyWith(),
                            ),
                            Text(
                              StringData.detail,
                              style: context.myTextTheme.titleSmall?.copyWith(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

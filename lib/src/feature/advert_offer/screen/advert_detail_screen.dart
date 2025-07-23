import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/enum/schedule_type_enum.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/screen/advert_payment.dart';
import 'package:city17/src/feature/advert_offer/widgets/costom_container_date_widget.dart';
import 'package:city17/src/feature/connect_display/widgets/custom_radio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AdvertDetailScreen extends StatefulWidget {
  const AdvertDetailScreen({super.key, required this.ads});

  final AdvertismentModel ads;
  static const routeName = '/advert_detail_screen';

  @override
  State<AdvertDetailScreen> createState() => _AdvertDetailScreenState();
}

class _AdvertDetailScreenState extends State<AdvertDetailScreen> {
  ScheduleTypeEnum weekly = ScheduleTypeEnum.weekly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringData.advertDetail,
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

            SizedBox(height: myPadding / 2),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: myPadding / 2),
                  margin: const EdgeInsets.only(right: myPadding / 3),
                  width: 55,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondarycolor,
                  ),

                  child: Column(
                    children: [
                      // const SizedBox(height: myPadding / 3),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(
                            244,
                            244,
                            244,
                            1,
                          ).withValues(alpha: 0.1),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(myPadding / 2),
                          ),
                        ),
                        child: Text(
                          'Hours',
                          style: context.myTextTheme.titleSmall?.copyWith(
                            fontSize: 10,
                            color: AppColors.primaryTextcolor,
                          ),
                        ),
                      ),
                      Text(
                        widget.ads.startTime.hourOnly(),
                        style: context.myTextTheme.titleSmall?.copyWith(
                          fontSize: 08,
                        ),
                      ),

                      Expanded(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              top: 06,
                              left: 27,
                              right: 27,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.secondarycolor,
                                ),
                              ),
                            ),

                            ListView.builder(
                              itemCount: widget.ads.scheduledTimes.length,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              itemBuilder: (context, index) {
                                final slot = widget.ads.scheduledTimes[index];
                                return Column(
                                  children: [
                                    Container(
                                      width: 03,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: slot.isasepted
                                            ? AppColors.successTextcolor
                                            : AppColors.primarycolor,
                                      ),
                                    ),

                                    Text(
                                      DateFormat('hh:mm').format(slot.time),
                                      style: context.myTextTheme.titleSmall
                                          ?.copyWith(fontSize: 08),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: myPadding / 3),
                      Text(
                        widget.ads.endTime.hourOnly(),
                        style: context.myTextTheme.titleSmall?.copyWith(
                          fontSize: 08,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    height: 230,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(myPadding / 2),
                      image: DecorationImage(
                        image: NetworkImage(widget.ads.adImage),
                        fit: BoxFit.cover, // or BoxFit.fill
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: myPadding / 2),
              padding: const EdgeInsets.symmetric(
                horizontal: myPadding / 2,
                vertical: myPadding / 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(myPadding / 2),
                color: AppColors.secondarycolor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          StringData
                              .selectHowOftenYouWantToReceivePaymenTsfromtHebuyer,
                          style: context.myTextTheme.titleSmall?.copyWith(),
                        ),
                      ),

                      SvgPicture.asset(AssetString.editicon),
                    ],
                  ),
                  Container(
                    // padding: const EdgeInsets.only(left: 10, top: 10),
                    margin: const EdgeInsets.only(top: 10),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primarycolor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...ScheduleTypeEnum.values.map((x) {
                          return CustomRadioTile<ScheduleTypeEnum>(
                            value: x,
                            groupValue: weekly,
                            onChanged: (val) => setState(() => weekly = x),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: myPadding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  fontSize: 12,
                  title: StringData.viewPayment,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AdvertPaymentScreen(ads: widget.ads),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/enum/payment_frequency_enum.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/screen/advert_payment.dart';
import 'package:city17/src/feature/advert_offer/widgets/advertiser_info_widget.dart';
import 'package:city17/src/feature/advert_offer/widgets/costom_container_widget.dart';
import 'package:city17/src/feature/advert_offer/widgets/display_location.dart';
import 'package:city17/src/feature/advert_offer/widgets/time_slot_widget.dart';
import 'package:city17/src/feature/connect_display/widgets/custom_radio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdvertDetailScreen extends StatefulWidget {
  const AdvertDetailScreen({super.key, required this.ads});

  final AdvertismentModel ads;
  static const routeName = '/advert_detail_screen';

  @override
  State<AdvertDetailScreen> createState() => _AdvertDetailScreenState();
}

class _AdvertDetailScreenState extends State<AdvertDetailScreen> {
  PaymentFrequencyEnum weekly = PaymentFrequencyEnum.weekly;

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
        padding: const EdgeInsets.symmetric(
          horizontal: myPadding,
          vertical: myPadding,
        ),
        child: ListView(
          children: [
            //Advertiser Information Widgets
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
            // Display loaction widget
            DisplayLocationWidget(
              displayLocation: widget.ads.displayLocation,
              locationAddress: widget.ads.locationAddress,
            ),

            const SizedBox(height: myPadding / 2),
            Row(
              children: [
                TimeSlotWidget(
                  containerHeight: 230,
                  containerWidth: 55,
                  fontSize: 09,
                  timeLineHeight: 20,
                  timeLineWidth: 03,
                  backgroundColor: AppColors.secondarycolor,
                  timeLineColor: AppColors.primarycolor,
                  ad: widget.ads,
                ),

                //Display ads image
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
              margin: const EdgeInsets.only(top: myPadding / 2),
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
                        ...PaymentFrequencyEnum.values.map((x) {
                          return CustomRadioTile<PaymentFrequencyEnum>(
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
            const SizedBox(height: myPadding / 2),
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

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/widgets/costom_container_date_widget.dart';
import 'package:city17/src/feature/advert_offer/widgets/display_location.dart';
import 'package:city17/src/feature/advert_offer/widgets/switch_title_widget.dart';
import 'package:city17/src/feature/advert_offer/widgets/time_slot_widget.dart';
import 'package:flutter/material.dart';

class PendingBiddingTab extends StatefulWidget {
  const PendingBiddingTab({super.key});

  @override
  State<PendingBiddingTab> createState() => _PendingBiddingTabState();
}

class _PendingBiddingTabState extends State<PendingBiddingTab> {
  //bool isSelected = false;

  Map<DateTime, List<AdvertismentModel>> filterData = {};

  final mappedData = AdvertismentModel.getDateMappedData();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...mappedData.entries.map((entry) {
          final date = entry.key;
          final ads = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: myPadding),

              Text(date.dayOnly()),
              const SizedBox(height: myPadding),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: myPadding / 2,
                  vertical: myPadding / 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondarycolor,

                  borderRadius: BorderRadius.circular(myPadding / 2),
                ),

                child: Column(
                  children: [
                    ...ads.asMap().entries.map((entry) {
                      final index = entry.key;
                      final ad = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: myPadding / 2),
                        child: Row(
                          children: [
                            //Time Slot Widgt
                            TimeSlotWidget(priceCotanier: true, ad: ad),

                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(myPadding / 2),

                                height: 390,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.primarycolor,
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          StringData.advertiser,
                                          style: context.myTextTheme.titleSmall
                                              ?.copyWith(
                                                fontSize: 10,
                                                color: AppColors
                                                    .primaryTextcolor
                                                    .withValues(alpha: 0.4),
                                              ),
                                        ),
                                        Text(
                                          ad.advertiserName,
                                          style: context.myTextTheme.titleMedium
                                              ?.copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),

                                    // Date Container widget
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomaContainerDate(
                                          title: StringData.hoursperday,
                                          data: ad.hoursPerDay.toString(),
                                        ),
                                        CustomaContainerDate(
                                          title: StringData.start,
                                          data: ad.startDate.dateFormat(),
                                        ),
                                        CustomaContainerDate(
                                          title: StringData.end,
                                          data: ad.endDate.dateFormat(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: myPadding / 2),

                                    // Display image
                                    Container(
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          myPadding / 2,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(ad.adImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: myPadding / 2),

                                    //Displocation
                                    DisplayLocationWidget(
                                      displayLocation: ad.displayLocation,
                                      locationAddress: ad.locationAddress,
                                    ),

                                    //Switch
                                    SwitchTileWidget(
                                      title: StringData.atomaticapproval,
                                      value: ad.isAproval,
                                      backgroundColor: AppColors.secondarycolor,
                                      onChanged: (value) {
                                        setState(() {
                                          mappedData[date]![index].isAproval =
                                              value;
                                        });
                                      },
                                    ),

                                    //  Button Reject and Approve
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomButton(
                                            title: 'Reject',
                                            textcolor:
                                                AppColors.warningTextcolor,
                                            onPressed: () {},
                                            svgicon: AssetString.cancelIcon,
                                            backgroundColor: Colors.transparent,
                                          ),

                                          CustomButton(
                                            title: 'Approve',
                                            onPressed: () {},
                                            textcolor:
                                                AppColors.successTextcolor,
                                            svgicon: AssetString.chekCircle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

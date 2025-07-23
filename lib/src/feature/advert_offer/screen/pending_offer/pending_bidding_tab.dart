import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/widgets/costom_container_date_widget.dart';
import 'package:city17/src/feature/advert_offer/widgets/switch_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                            Container(
                              padding: const EdgeInsets.only(
                                bottom: myPadding / 2,
                              ),
                              margin: const EdgeInsets.only(
                                right: myPadding / 3,
                              ),
                              width: 60,
                              height: 380,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primarycolor,
                              ),

                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.successTextcolor
                                          .withValues(alpha: 0.3),
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(myPadding / 2),
                                      ),
                                    ),
                                    child: Text(
                                      '\$${ad.amount.amount}-\$${ad.maximumprice}/hr',
                                      style: context.myTextTheme.titleSmall
                                          ?.copyWith(
                                            fontSize: 10,
                                            color: AppColors.successTextcolor,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: myPadding / 3),
                                  Text(
                                    ad.startTime.hourOnly(),
                                    style: context.myTextTheme.titleSmall,
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
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: AppColors.secondarycolor,
                                            ),
                                          ),
                                        ),

                                        ListView.builder(
                                          itemCount: ad.scheduledTimes.length,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          itemBuilder: (context, index) {
                                            final slot =
                                                ad.scheduledTimes[index];
                                            return Column(
                                              children: [
                                                Container(
                                                  width: 05,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                    color: slot.isasepted
                                                        ? AppColors
                                                              .successTextcolor
                                                        : AppColors
                                                              .secondarycolor,
                                                  ),
                                                ),

                                                Text(
                                                  DateFormat(
                                                    'hh:mm',
                                                  ).format(slot.time),
                                                  style: context
                                                      .myTextTheme
                                                      .titleSmall
                                                      ?.copyWith(fontSize: 14),
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
                                    ad.endTime.hourOnly(),
                                    style: context.myTextTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: myPadding / 2,
                                  left: myPadding / 3,
                                  right: myPadding / 3,
                                  bottom: myPadding / 2,
                                ),

                                // width: 100,
                                height: 380,
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
                                          'Advertiser',
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
                                    SizedBox(
                                      height: 150,
                                      width: double.infinity,
                                      child: Image.network(
                                        ad.adImage,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: myPadding / 2),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          StringData.display,
                                          style: context.myTextTheme.titleSmall
                                              ?.copyWith(
                                                fontSize: 11,
                                                color: AppColors
                                                    .primaryTextcolor
                                                    .withValues(alpha: 0.4),
                                              ),
                                        ),

                                        Text(
                                          ad.displayLocation,
                                          style: context.myTextTheme.titleSmall
                                              ?.copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          ad.locationAddress,
                                          style: context.myTextTheme.titleSmall
                                              ?.copyWith(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    SwitchTileWidget(
                                      title: StringData.atomaticapproval,
                                      value: ad.isAproval,
                                      backgroundColor: AppColors.primarycolor,
                                      onChanged: (value) {
                                        setState(() {
                                          mappedData[date]![index].isAproval =
                                              value;
                                        });
                                      },
                                    ),

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
      //   );
      // },
    );
  }
}

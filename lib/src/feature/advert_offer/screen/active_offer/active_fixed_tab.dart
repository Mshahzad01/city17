import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/screen/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/widgets/costom_container_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActiveFixedTab extends StatefulWidget {
  const ActiveFixedTab({super.key});

  @override
  State<ActiveFixedTab> createState() => _FixedTabState();
}

class _FixedTabState extends State<ActiveFixedTab> {
  final mappedData = AdvertismentModel.getDateMappedData();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...mappedData.entries.map((entry) {
          final date = entry.key;

          final ads = entry.value;

          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: myPadding / 2,
              vertical: myPadding / 2,
            ),
            margin: const EdgeInsets.symmetric(vertical: myPadding),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(myPadding / 1.5),
              color: AppColors.secondarycolor,
            ),
            child: Column(
              children: [
                ...ads.asMap().entries.map((e) {
                  final index = e.key;
                  final ad = e.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: myPadding / 2,
                          vertical: myPadding / 2,
                        ),
                        height: 36,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primarycolor,
                          borderRadius: BorderRadius.circular(myPadding / 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              StringData.advertiser,
                              style: context.myTextTheme.titleSmall?.copyWith(
                                color: AppColors.primaryTextcolor.withValues(
                                  alpha: 0.4,
                                ),
                              ),
                            ),

                            Text(
                              ad.advertiserName,
                              style: context.myTextTheme.titleSmall?.copyWith(),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //  mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomaContainerDate(
                            height: 45,
                            width: 100,
                            bagroundColor: AppColors.primarycolor,

                            title: StringData.hoursperday,
                            data: ad.endDate.dateFormat(),
                          ),
                          CustomaContainerDate(
                            height: 45,
                            width: 100,
                            bagroundColor: AppColors.primarycolor,
                            title: StringData.start,
                            data: ad.startDate.dateFormat(),
                          ),
                          CustomaContainerDate(
                            height: 45,
                            width: 100,
                            bagroundColor: AppColors.primarycolor,
                            title: StringData.end,
                            data: ad.endDate.dateFormat(),
                          ),
                        ],
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: myPadding / 2,
                        ),

                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primarycolor,
                          borderRadius: BorderRadius.circular(myPadding / 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              StringData.paymetPerDay,
                              style: context.myTextTheme.titleSmall?.copyWith(
                                color: AppColors.primaryTextcolor.withValues(
                                  alpha: 0.4,
                                ),
                                fontSize: 10,
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
                      ),
                      SizedBox(height: myPadding / 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              bottom: myPadding / 2,
                            ),
                            margin: const EdgeInsets.only(right: myPadding / 3),
                            width: 55,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primarycolor,
                            ),

                            child: Column(
                              children: [
                                const SizedBox(height: myPadding / 3),
                                Text(
                                  ad.startTime.hourOnly(),
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(fontSize: 08),
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
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
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
                                          final slot = ad.scheduledTimes[index];
                                          return Column(
                                            children: [
                                              Container(
                                                width: 03,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
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
                                  ad.endTime.hourOnly(),
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(fontSize: 08),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                bottom: myPadding / 2,
                              ),
                              margin: const EdgeInsets.only(
                                right: myPadding / 3,
                              ),
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  myPadding / 2,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(ad.adImage),
                                  fit: BoxFit.cover, // or BoxFit.fill
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
                const SizedBox(height: myPadding / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      fontSize: 10,
                      backgroundColor: AppColors.textButtoncolor,
                      title: StringData.viewCampaign,

                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

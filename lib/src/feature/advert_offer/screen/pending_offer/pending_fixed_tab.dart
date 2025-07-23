import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/screen/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/widgets/box_widget.dart';
import 'package:city17/src/feature/advert_offer/widgets/costom_container_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PendingFixedTab extends StatefulWidget {
  const PendingFixedTab({super.key});

  @override
  State<PendingFixedTab> createState() => _FixedTabState();
}

class _FixedTabState extends State<PendingFixedTab> {
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const BoxWidget(color: AppColors.successTextcolor),
                          Text(
                            StringData.selected,
                            style: context.myTextTheme.titleSmall?.copyWith(
                              fontSize: 11,
                            ),
                          ),

                          const BoxWidget(color: AppColors.primarycolor),
                          Text(
                            StringData.unSelected,
                            style: context.myTextTheme.titleSmall?.copyWith(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: myPadding / 3),
                      Wrap(
                        spacing: myPadding / 2,
                        children: [
                          ...ad.scheduledTimes.map((e) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: myPadding / 3,
                              ),
                              alignment: Alignment.center,
                              height: 20,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  myPadding / 4,
                                ),
                                color: e.isasepted
                                    ? AppColors.successTextcolor
                                    : AppColors.primarycolor,
                              ),
                              child: Text(
                                DateFormat.jm().format(e.time),
                                style: context.myTextTheme.titleSmall?.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                      const SizedBox(height: myPadding / 3),
                      SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Image.network(ad.adImage, fit: BoxFit.fill),
                      ),

                      const SizedBox(height: myPadding / 2),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringData.display,
                            style: context.myTextTheme.titleSmall?.copyWith(
                              fontSize: 11,
                              color: AppColors.primaryTextcolor.withValues(
                                alpha: 0.4,
                              ),
                            ),
                          ),

                          Text(
                            ad.displayLocation,
                            style: context.myTextTheme.titleSmall?.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            ad.locationAddress,
                            style: context.myTextTheme.titleSmall?.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: myPadding / 2,
                        ),
                        alignment: Alignment.center,
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primarycolor,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: myPadding / 2,
                          ),
                          title: Text(
                            StringData.atomaticapproval,
                            textAlign: TextAlign.start,
                            style: context.myTextTheme.titleSmall?.copyWith(
                              fontSize: 11,
                            ),
                          ),

                          trailing: Transform.scale(
                            alignment: Alignment.centerRight,
                            scale: 0.5,
                            child: Switch(
                              value: ad.isAproval,
                              onChanged: (value) {
                                setState(() {
                                  mappedData[date]![index].isAproval = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            title: 'Reject',
                            textcolor: AppColors.warningTextcolor,
                            onPressed: () {},
                            svgicon: AssetString.cancelIcon,
                            backgroundColor: Colors.transparent,
                          ),

                          CustomButton(
                            title: 'Approve',
                            onPressed: () {},
                            textcolor: AppColors.successTextcolor,
                            svgicon: AssetString.chekCircle,
                            backgroundColor: AppColors.primarycolor,
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ],
            ),
          );
        }),
      ],
    );
  }
}

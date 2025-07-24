import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/widgets/costom_container_widget.dart';
import 'package:flutter/material.dart';

class ActiveBiddingTab extends StatefulWidget {
  const ActiveBiddingTab({super.key});

  @override
  State<ActiveBiddingTab> createState() => _ActiveBiddingTabState();
}

class _ActiveBiddingTabState extends State<ActiveBiddingTab> {
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

              ...ads.asMap().entries.map((entry) {
                final ad = entry.value;
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainerWidget(
                          height: 65,
                          width: 100,
                          fontSize: 14,

                          titleColor: AppColors.primaryTextcolor,
                          bagroundColor: AppColors.secondarycolor,
                          title: StringData.totalHours,
                          data: ad.hoursPerDay.toString(),
                        ),
                        CustomContainerWidget(
                          height: 65,
                          width: 100,
                          fontSize: 14,
                          bagroundColor: AppColors.secondarycolor,
                          title: StringData.averagePerHour,
                          data: ad.amount.show(),
                        ),
                        CustomContainerWidget(
                          height: 65,
                          width: 100,
                          fontSize: 14,
                          dataTextColor: AppColors.accentTextcolor,
                          bagroundColor: AppColors.secondarycolor,
                          title: StringData.pendingApproval,
                          data: ad.pendingApproval.toString(),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: myPadding / 2),
                          height: 210,
                          width: 60,
                          color: AppColors.secondarycolor,
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  left: myPadding / 2,
                                  top: myPadding / 2,
                                ),
                                height: 105,

                                decoration: BoxDecoration(
                                  color: AppColors.secondarycolor,
                                  borderRadius: BorderRadius.circular(
                                    myPadding / 2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: myPadding / 3,
                                        top: myPadding / 4,
                                        bottom: myPadding / 4,
                                      ),
                                      height: double.infinity,
                                      width: 170,
                                      // color: Colors.red,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            minTileHeight: 00,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                  horizontal: 00,
                                                  vertical: 00,
                                                ),
                                            leading: CircleAvatar(
                                              radius: 14,
                                              backgroundImage: NetworkImage(
                                                ad.advertiserImage,
                                              ),
                                            ),
                                            title: Text(
                                              ad.advertiserName,
                                              style: context
                                                  .myTextTheme
                                                  .titleSmall
                                                  ?.copyWith(fontSize: 13),
                                            ),
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${StringData.schedule}:',
                                                style: context
                                                    .myTextTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      color: AppColors
                                                          .primaryTextcolor
                                                          .withValues(
                                                            alpha: 0.4,
                                                          ),
                                                      fontSize: 10,
                                                    ),
                                              ),

                                              Text(
                                                '${ad.startDate.dayMonthFormat()}-${ad.endDate.dayMonthFormat()}',
                                                style: context
                                                    .myTextTheme
                                                    .titleSmall
                                                    ?.copyWith(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: myPadding / 4),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${StringData.hoursperday}:',
                                                style: context
                                                    .myTextTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      color: AppColors
                                                          .primaryTextcolor
                                                          .withValues(
                                                            alpha: 0.4,
                                                          ),
                                                      fontSize: 10,
                                                    ),
                                              ),

                                              Text(
                                                ad.hoursPerDay.toString(),
                                                style: context
                                                    .myTextTheme
                                                    .titleSmall
                                                    ?.copyWith(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: myPadding / 4),
                                          SizedBox(
                                            width: 150,
                                            height: 24,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        myPadding / 3,
                                                      ),
                                                ),
                                              ),
                                              child: Text(
                                                StringData.viewAdvert,
                                                style: context
                                                    .myTextTheme
                                                    .titleSmall
                                                    ?.copyWith(fontSize: 09),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.all(
                                          myPadding / 2,
                                        ),
                                        height: double.infinity,
                                        //width: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(ad.adImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(
                                  left: myPadding / 2,
                                  top: myPadding / 2,
                                ),

                                height: 100,

                                color: AppColors.secondarycolor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ],
          );
        }),
      ],
    );
  }
}

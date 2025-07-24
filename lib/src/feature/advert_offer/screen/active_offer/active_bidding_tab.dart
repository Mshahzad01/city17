import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';
import 'package:city17/src/feature/advert_offer/widgets/costom_container_date_widget.dart';
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
                final index = entry.key;
                final ad = entry.value;
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomaContainerDate(
                          height: 65,
                          width: 100,
                          bagroundColor: AppColors.secondarycolor,
                          title: StringData.totalHours,
                          data: ad.hoursPerDay.toString(),
                        ),
                        CustomaContainerDate(
                          height: 65,
                          width: 100,
                          bagroundColor: AppColors.secondarycolor,
                          title: StringData.averagePerHour,
                          data: ad.hoursPerDay.toString(),
                        ),
                        CustomaContainerDate(
                          height: 65,
                          width: 100,
                          bagroundColor: AppColors.secondarycolor,
                          title: StringData.pendingApproval,
                          data: ad.hoursPerDay.toString(),
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

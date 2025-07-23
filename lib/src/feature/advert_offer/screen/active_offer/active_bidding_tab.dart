import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/extension/date_formatting_extension.dart';
import 'package:city17/src/feature/advert_offer/screen/model/advertisment_model.dart';
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
                      return Container();
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

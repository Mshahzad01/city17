import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/connect_display/screen/connect_display_screen.dart';
import 'package:city17/src/feature/home/model/business_model.dart';
import 'package:city17/src/feature/home/model/dumy_disply_model.dart';
import 'package:city17/src/feature/home/widgets/display_by_status_widgt.dart';
import 'package:city17/src/feature/location_setting/screen/location_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/asset_string.dart';

class MangeBusiness extends StatelessWidget {
  const MangeBusiness({super.key, required this.displayData});
  final List<BusinessModel> displayData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding / 2,
        vertical: myPadding / 2,
      ),
      decoration: const BoxDecoration(
        color: AppColors.secondarycolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(myPadding / 2),
          topRight: Radius.circular(myPadding / 2),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: displayData.length,
        itemBuilder: (BuildContext context, int index) {
          final data = displayData[index];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: myPadding / 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(myPadding / 2),

              color: AppColors.primarycolor,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ExpansionTile(
                  childrenPadding: const EdgeInsets.symmetric(
                    horizontal: myPadding / 2,
                  ),
                  tilePadding: const EdgeInsets.symmetric(
                    horizontal: myPadding / 2,
                  ),
                  backgroundColor: AppColors.primarycolor,
                  iconColor: AppColors.primarycolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(myPadding),
                  ),

                  showTrailingIcon: false,

                  title: Text(
                    data.name,
                    style: context.myTextTheme.titleMedium,
                  ),

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              data.address?.formattedAddress ??
                                  'Address not available',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,

                              style: context.myTextTheme.titleMedium?.copyWith(
                                fontSize: 12,

                                color: AppColors.primaryTextcolor.withAlpha(80),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: myPadding),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LocationSetting(data: data),
                                ),
                              ),
                              // LocationSetting(indexx: index),
                              child: SvgPicture.asset(AssetString.settingicon),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: myPadding / 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.category,
                            //'• ${data.displaydumydata.length} Display',
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.linkTextcolor,
                            ),
                          ),

                          Text(
                            //data.displays?.businessId ?? 'null',
                            '• ert online',
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.successTextcolor,
                            ),
                          ),

                          Text(
                            '• ert offline',
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.errorTextcolor,
                            ),
                          ),

                          Text(
                            '• ert draft',
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: Colors.white.withValues(alpha: 0.3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  children: DisplayStatus.values.map((x) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: x.color),
                      ),
                      child: DisplaysByStatusWidget(
                        status: x,
                        displays: data.displays,
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 05),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      ConnectDisplyScreen.routeName,
                    ),
                    child: Text(
                      StringData.connectdisplay,
                      style: context.myTextTheme.titleMedium?.copyWith(
                        color: AppColors.accentTextcolor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

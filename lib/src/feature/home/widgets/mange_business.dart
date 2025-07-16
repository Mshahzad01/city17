import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/model/display_model.dart';
import 'package:city17/src/feature/location_setting/screen/location_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'display_by_status_widgt.dart';

class MangeBusiness extends StatefulWidget {
  const MangeBusiness({super.key});

  @override
  State<MangeBusiness> createState() => _MangeBusinessState();
}

class _MangeBusinessState extends State<MangeBusiness> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 05),
      decoration: BoxDecoration(
        color: AppColors.secondrybagroundcolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: dumyDisplays.length,
        itemBuilder: (BuildContext context, int index) {
          final data = dumyDisplays[index];

          return Container(
            padding: EdgeInsets.all(02),
            margin: EdgeInsets.only(top: 05, bottom: 05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              color: AppColors.backgroundcolor,
            ),
            child: ExpansionTile(
              childrenPadding: EdgeInsets.only(right: 08, left: 08),
              tilePadding: EdgeInsets.only(left: 08, right: 08),
              backgroundColor: AppColors.backgroundcolor,
              collapsedBackgroundColor: AppColors.backgroundcolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              showTrailingIcon: false,

              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name, style: context.myTextTheme.titleMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          data.address,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,

                          style: context.myTextTheme.titleMedium?.copyWith(
                            fontSize: 12,

                            color: AppColors.textcolor.withAlpha(80),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LocationSetting(indexx: index),
                            ),
                          ),
                          //LocationSetting(indexx: index),
                          child: SvgPicture.asset(AssetString.settingicon),
                        ),
                      ),
                    ],
                  ),
                  Text(data.type, style: context.myTextTheme.titleSmall),

                  SizedBox(height: 05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "• ${data.displaydumydata.length} Display",
                        style: context.myTextTheme.titleSmall?.copyWith(
                          color: AppColors.purpletextcolor,
                        ),
                      ),

                      Text(
                        "• ert online",

                        style: context.myTextTheme.titleSmall?.copyWith(
                          color: AppColors.greentextcolor,
                        ),
                      ),

                      Text(
                        "• ert offline",
                        style: context.myTextTheme.titleSmall?.copyWith(
                          color: AppColors.redtextcolor,
                        ),
                      ),

                      Text(
                        "• ert draft",
                        style: context.myTextTheme.titleSmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: AppColors.greentextcolor,
                    ),
                  ),
                  child: Column(
                    children: [
                      DisplaysByStatusWidget(
                        status: DisplayStatus.online,
                        displays: data.displaydumydata,
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: AppColors.textbuttoncolor,
                    ),
                  ),
                  child: Column(
                    children: [
                      DisplaysByStatusWidget(
                        status: DisplayStatus.offline,
                        displays: data.displaydumydata,
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: AppColors.textcolor.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Column(
                    children: [
                      DisplaysByStatusWidget(
                        status: DisplayStatus.draft,
                        displays: data.displaydumydata,
                      ),
                    ],
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

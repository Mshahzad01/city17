import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/model/display_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/asset_string.dart';
import '../../location_setting/screen/location_setting.dart';
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
        color: AppColors.secondarycolor,
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

              color: AppColors.primarycolor,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(right: 08, left: 08),
                  tilePadding: EdgeInsets.only(left: 08, right: 08),
                  backgroundColor: AppColors.primarycolor,
                  iconColor: AppColors.primarycolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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
                              data.address,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,

                              style: context.myTextTheme.titleMedium?.copyWith(
                                fontSize: 12,

                                color: AppColors.primaryTextcolor.withAlpha(80),
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
                                      LocationSetting(data: data),
                                ),
                              ),
                              //LocationSetting(indexx: index),
                              child: SvgPicture.asset(AssetString.settingicon),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        data.type.title,
                        style: context.myTextTheme.titleSmall,
                      ),

                      SizedBox(height: 05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "• ${data.displaydumydata.length} Display",
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.linkTextcolor,
                            ),
                          ),

                          Text(
                            "• ert online",

                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.successTextcolor,
                            ),
                          ),

                          Text(
                            "• ert offline",
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.errorTextcolor,
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
                  children: DisplayStatus.values.map((x) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: x.color),
                      ),
                      child: DisplaysByStatusWidget(
                        status: x,
                        displays: data.displaydumydata,
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 05),
                  child: GestureDetector(
                    onTap: null,
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

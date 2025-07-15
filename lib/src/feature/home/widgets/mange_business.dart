import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/model/display_model.dart';
import 'package:city17/src/feature/location_setting/screen/location_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MangeBusiness extends StatefulWidget {
  const MangeBusiness({super.key});

  @override
  State<MangeBusiness> createState() => _MangeBusinessState();
}

class _MangeBusinessState extends State<MangeBusiness> {
  late List<bool> isExpandedList;

  @override
  void initState() {
    super.initState();
    isExpandedList = List.generate(dumyDisplays.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: AppColors.cardcolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 400,

            child: ListView.builder(
              itemCount: dumyDisplays.length,
              itemBuilder: (BuildContext context, int index) {
                final data = dumyDisplays[index];

                return Container(
                  margin: EdgeInsets.only(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.splashbroudcolor,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 05,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name,
                              style: context.myTextTheme.titleMedium
                                  ?.copyWith(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.address,
                                  style: context.myTextTheme.titleMedium
                                      ?.copyWith(
                                        color: AppColors.textcolor.withAlpha(
                                          80,
                                        ),
                                      ),
                                ),
                                InkWell(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    LocationSetting.routename,
                                  ),
                                  child: SvgPicture.asset(
                                    AssetString.settingicon,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              data.type,
                              style: context.myTextTheme.titleSmall?.copyWith(),
                            ),
                            SizedBox(height: 05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "• ${data.displaydumydata.length} Display",
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(
                                        color: AppColors.purpletextcolor,
                                      ),
                                ),
                                //  SizedBox(width: 10),
                                Text(
                                  "• ert online",

                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(color: AppColors.greencolor),
                                ),

                                //  SizedBox(width: 10),
                                Text(
                                  "• ert offline",
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(color: AppColors.redtextcolor),
                                ),
                                // SizedBox(width: 10),
                                Text(
                                  "• wer} draft",
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(
                                        color: Colors.white.withValues(
                                          alpha: 0.3,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ExpansionTile(
                        backgroundColor: AppColors.splashbroudcolor,
                        collapsedBackgroundColor: AppColors.splashbroudcolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(20),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AssetString.drowpdownicon,
                            ), // ya dropup
                          ),
                        ),

                        showTrailingIcon: false,

                        children: [
                          //online data
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: AppColors.greencolor,
                              ),
                            ),
                            child: Column(
                              children: [
                                _DisplaysByStatusWidget(
                                  status: DisplayStatus.online,
                                  displays: dumyDisplays[index].displaydumydata,
                                ),
                                _DisplaysByStatusWidget(
                                  status: DisplayStatus.offline,
                                  displays: dumyDisplays[index].displaydumydata,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DisplaysByStatusWidget extends StatelessWidget {
  const _DisplaysByStatusWidget({
    super.key,
    required this.status,
    required this.displays,
  });

  final DisplayStatus status;
  final List<Display> displays;

  @override
  Widget build(BuildContext context) {
    final requiredDisplays = displays.where((e) => e.status == status);

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: status == DisplayStatus.online
                  ? AppColors.greencolor
                  : AppColors.circulcolor,
              radius: 08,
            ),
            SizedBox(width: 08),
            Text(
              status.title,
              style: context.myTextTheme.titleMedium?.copyWith(fontSize: 14),
            ),
          ],
        ),

        Column(
          children: [
            ...requiredDisplays
                .map(
                  (x) => Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 8, bottom: 5),
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.cardcolor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          x.name,
                          style: context.myTextTheme.titleMedium?.copyWith(
                            fontSize: 11,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              x.time.toString(),
                              style: context.myTextTheme.titleSmall?.copyWith(
                                fontSize: 10,
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            Spacer(),
                            SvgPicture.asset(AssetString.growthicon),
                            SizedBox(width: 5),
                            Text(
                              x.uptime.toString(),
                              style: context.myTextTheme.titleSmall,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "\$ ${x.revenue}",
                              style: context.myTextTheme.titleSmall,
                            ),
                            SizedBox(width: 10),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 15,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.greencolor.withOpacity(0.1),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${x.growth}",
                                    style: context.myTextTheme.titleSmall
                                        ?.copyWith(
                                          color: Colors.green,
                                          fontSize: 8,
                                        ),
                                  ),
                                  SizedBox(width: 4),
                                  SvgPicture.asset(
                                    AssetString.arrowicon,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}

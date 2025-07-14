import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/model/display_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    isExpandedList = List.generate(dummyDisplays.length, (_) => false);
  }
  //bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(color: AppColors.cardcolor),
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: dummyDisplays.length,
              itemBuilder: (BuildContext context, int index) {
                final data = dummyDisplays[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.splashbroudcolor,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
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
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    AssetString.settingicon,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 05),
                            Row(
                              children: [
                                Text(
                                  data.type,
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${data.display} Display",
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(
                                        color: AppColors.purpletextcolor,
                                      ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${data.displayOnline.totaldisply} ${data.displayOnline.status.title}",

                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(color: AppColors.greencolor),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${data.displayOffline.totaldisply} ${data.displayOffline.status.title}",
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(color: AppColors.redtextcolor),
                                ),

                                SizedBox(width: 10),
                                Text(
                                  "${data.displaydrat.totaldisply} ${data.displaydrat.status.title}",
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(
                                        color: Colors.white.withValues(
                                          alpha: 0.3,
                                        ),
                                      ),
                                ),
                              ],
                            ),

                     
                            SizedBox(height: 10),
                            if (isExpandedList[index])
                              Column(
                                children: [
                                  //Offline
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
                                        color: AppColors.circulcolor,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  AppColors.circulcolor,
                                              radius: 08,
                                            ),
                                            SizedBox(width: 08),
                                            Text(
                                              data.displayOffline.status.title,
                                              style: context
                                                  .myTextTheme
                                                  .titleMedium
                                                  ?.copyWith(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        displaystatus(
                                          data.title,
                                          data.displayOffline.time,
                                          data.displayOffline.growth,
                                          data.displayOffline.revenue,
                                          data.displayOffline.uptime,
                                        ),
                                        displaystatus(
                                          data.title,
                                          data.displayOffline.time,
                                          data.displayOffline.growth,
                                          data.displayOffline.revenue,
                                          data.displayOffline.uptime,
                                        ),
                                      ],
                                    ),
                                  ),

                                  //Online
                                  Container(
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
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  AppColors.greencolor,
                                              radius: 08,
                                            ),
                                            SizedBox(width: 08),
                                            Text(
                                              data.displayOnline.status.title,
                                              style: context
                                                  .myTextTheme
                                                  .titleMedium
                                                  ?.copyWith(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        displaystatus(
                                          data.title,
                                          data.displayOnline.time,
                                          data.displayOnline.growth,
                                          data.displayOnline.revenue,
                                          data.displayOnline.uptime,
                                        ),
                                        displaystatus(
                                          data.title,
                                          data.displayOnline.time,
                                          data.displayOnline.growth,
                                          data.displayOnline.revenue,
                                          data.displayOnline.uptime,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // dart
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.textcolor.withValues(
                                          alpha: 0.3,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: AppColors
                                                  .textcolor
                                                  .withValues(alpha: 0.3),
                                              radius: 08,
                                            ),
                                            SizedBox(width: 08),
                                            Text(
                                              data.displaydrat.status.title,
                                              style: context
                                                  .myTextTheme
                                                  .titleMedium
                                                  ?.copyWith(fontSize: 14),
                                            ),
                                          ],
                                        ),

                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.only(
                                            top: 08,
                                            bottom: 05,
                                          ),
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 05,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),

                                            color: AppColors.cardcolor,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data.title}",
                                                style: context
                                                    .myTextTheme
                                                    .titleSmall
                                                    ?.copyWith(fontSize: 11),
                                              ),

                                              GestureDetector(
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Text(
                                                    "Complete Setup",
                                                    style: context
                                                        .myTextTheme
                                                        .titleSmall
                                                        ?.copyWith(
                                                          color: AppColors
                                                              .textbuttoncolor,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Connect a display",
                                  style: context.myTextTheme.titleMedium
                                      ?.copyWith(
                                        color: AppColors.textbuttoncolor,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: Colors.white.withValues(alpha: 0.1),
                        ),

                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpandedList[index] = !isExpandedList[index];
                            });
                          },
                          child: Center(
                            child: SvgPicture.asset(
                              isExpandedList[index]
                                  ? AssetString.dropup
                                  : AssetString.drowpdownicon,
                            ),
                          ),
                        ),
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

  Widget displaystatus(
    String title,
    String displytime,
    double displygrowth,
    double displyreven,
    displayuptime,
  ) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 08, bottom: 05),
      padding: EdgeInsets.only(left: 10, top: 05, bottom: 02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        color: AppColors.cardcolor,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            //  data.title,
            style: context.myTextTheme.titleMedium?.copyWith(fontSize: 11),
          ),
          SizedBox(height: 05),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Text(
                displytime,
                //  data.displayOnline.time,
                style: context.myTextTheme.titleSmall?.copyWith(
                  fontSize: 10,
                  color: Colors.white.withValues(alpha: 0.3),
                ),
              ),

              Spacer(),

              SvgPicture.asset(AssetString.growthicon),
              SizedBox(width: 05),
              Text(
                "$displayuptime",
                //  "${data.displayOnline.growth}",
                style: context.myTextTheme.titleSmall?.copyWith(),
              ),

              SizedBox(width: 10),
              Text(
                "\$ $displyreven",
                // "\$ ${data.displayOnline.revenue}",
                style: context.myTextTheme.titleSmall?.copyWith(),
              ),
              SizedBox(width: 10),

              Container(
                margin: EdgeInsets.only(right: 05),

                height: 15,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(04),
                  color: Colors.white.withValues(alpha: 0.1),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$displygrowth",
                      //   "${data.displayOnline.growth}",
                      style: context.myTextTheme.titleSmall?.copyWith(
                        color: Colors.green,
                        fontSize: 08,
                      ),
                    ),

                    SizedBox(width: 04),

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
    );
  }
}

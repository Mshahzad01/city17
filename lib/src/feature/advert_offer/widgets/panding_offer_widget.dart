import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/advert_offer/screen/model/advertisment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:timelines_plus/timelines_plus.dart';

class Pandingofferwidget extends StatefulWidget {
  const Pandingofferwidget({super.key});

  @override
  State<Pandingofferwidget> createState() => _PandingofferwidgetState();
}

class _PandingofferwidgetState extends State<Pandingofferwidget> {
  // List< AdvertOffer> newoffer =  [];
  @override
  void initState() {
    super.initState();
  }

  final adverismentdata = dummyAdvertismentData.map((e) {
    return e.addata;
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: myPadding / 2),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(myPadding / 2),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: AppColors.secondarycolor,
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hint: const Text(StringData.serachbusinesscategory),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: AppColors.primarycolor,
                      filled: true,
                      suffix: const Icon(Icons.search, size: 20),
                      contentPadding: const EdgeInsets.only(
                        top: 02,
                        left: myPadding / 2,
                        right: myPadding / 2,
                      ),
                    ),

                    onChanged: (value) {},
                  ),

                  // Show the list of Business Category
                  Container(
                    margin: const EdgeInsets.only(
                      top: myPadding / 2,
                      bottom: myPadding / 2,
                    ),
                    padding: const EdgeInsets.only(
                      left: myPadding / 2,
                      right: myPadding / 2,
                      top: 05,
                    ),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primarycolor,
                    ),
                    alignment: Alignment.center,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text('dumy bussiness category name')],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: myPadding / 2),

            SizedBox(
              height: 35,
              child: TabBar(
                labelColor: AppColors.primaryTextcolor,
                unselectedLabelColor: AppColors.primaryTextcolor.withValues(
                  alpha: 0.3,
                ),
                indicatorColor: AppColors.primarycolor,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,

                indicator: BoxDecoration(
                  color: AppColors.transparentBlack,
                  borderRadius: BorderRadius.circular(08),
                ),

                //indicatorPadding: EdgeInsets.all(05),
                tabs: [
                  const Tab(text: 'Bedding'),
                  const Tab(text: 'Fixed'),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [biddingoffer(context), const Text('Fixed')],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget biddingoffer(BuildContext context) {
    bool islected = false;
    return ListView.builder(
      itemCount: dummyAdvertismentData.length,
      itemBuilder: (BuildContext context, int index) {
        final data = dummyAdvertismentData[index];
        print("runtime errro ${data.dateTime.runtimeType}");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: myPadding,
                bottom: myPadding / 1.5,
              ),

              alignment: Alignment.center,
              color: AppColors.secondarycolor,
              height: 60,
              width: double.infinity,
              child: const Text('Date Calendar'),
            ),
            const SizedBox(height: myPadding / 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AssetString.alerticon),
                const SizedBox(width: myPadding / 3),
                Expanded(
                  child: Text(
                    data.alert,
                    style: context.myTextTheme.titleSmall?.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: myPadding),

            Text(
              '${DateFormat('dd').format(data.dateTime).toString()} - ${DateFormat('EEEE').format(data.dateTime).toString()}',
            ),

            const SizedBox(height: myPadding),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: myPadding / 2,
                vertical: myPadding / 2,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondarycolor,

                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                children: [
                  ...data.addata.map((ad) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: myPadding / 2),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              //top: myPadding / 2,
                              bottom: myPadding / 2,
                            ),
                            margin: const EdgeInsets.only(right: myPadding / 3),
                            width: 60,
                            height: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primarycolor,
                            ),

                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: AppColors.successTextcolor
                                        .withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(05),
                                      topRight: Radius.circular(05),
                                    ),
                                  ),
                                  child: Text(
                                    '\$${ad.minimumprice.toString()}-\$${ad.maximumprice.toString()}/hr',
                                    style: context.myTextTheme.titleSmall
                                        ?.copyWith(
                                          fontSize: 10,
                                          color: AppColors.successTextcolor,
                                        ),
                                  ),
                                ),

                                // Expanded(
                                //   child: Stack(
                                //     children: [
                                //       Positioned.fill(
                                //         left: 26,
                                //         right: 26,
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(
                                //               05,
                                //             ),
                                //             color: AppColors.secondarycolor,
                                //           ),
                                //         ),
                                //       ),

                                //       ...ad.scheduledTimes.map((slot) {
                                //         return Column(
                                //           children: [
                                //             const SizedBox(
                                //               height: 20.0,
                                //               child: DecoratedLineConnector(
                                //                 decoration: BoxDecoration(
                                //                   color: AppColors
                                //                       .successTextcolor,
                                //                 ),
                                //               ),
                                //             ),
                                //             Positioned(
                                //               left: 10,
                                //               right: 10,
                                //               child: Text(
                                //                 '${DateFormat('hh:mm ').format(slot.time)}',
                                //               ),
                                //             ),

                                //             // Container(
                                //             //   width: 04,
                                //             //   height: 30,
                                //             //   decoration: BoxDecoration(
                                //             //     borderRadius: BorderRadius.circular(
                                //             //       05,
                                //             //     ),
                                //             //     color: slot.isasepted
                                //             //         ? Colors.green
                                //             //         : Colors.grey,
                                //             //   ),
                                //             // ),
                                //           ],
                                //         );
                                //       }),
                                //     ],
                                //   ),
                                // ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      // Background container
                                      Positioned.fill(
                                        left: 26,
                                        right: 26,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            color: AppColors.secondarycolor,
                                          ),
                                        ),
                                      ),

                                      // Time slots in a column on top of the background
                                      ListView.builder(
                                        itemCount: ad.scheduledTimes.length,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        itemBuilder: (context, index) {
                                          final slot = ad.scheduledTimes[index];
                                          return Column(
                                            children: [
                                              const SizedBox(
                                                height: 20.0,
                                                width: 10,
                                                child: DecoratedLineConnector(
                                                  space: 05,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .successTextcolor,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${DateFormat('hh:mm').format(slot.time)}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // Uncomment below if you want the rectangle indicator
                                              // Container(
                                              //   width: 4,
                                              //   height: 30,
                                              //   decoration: BoxDecoration(
                                              //     borderRadius: BorderRadius.circular(5),
                                              //     color: slot.isasepted ? Colors.green : Colors.grey,
                                              //   ),
                                              // ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: myPadding / 2,
                                left: myPadding / 3,
                                right: myPadding / 3,
                              ),
                              // width: 100,
                              height: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primarycolor,
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Advertiser',
                                        style: context.myTextTheme.titleSmall
                                            ?.copyWith(
                                              fontSize: 10,
                                              color: AppColors.primaryTextcolor
                                                  .withValues(alpha: 0.4),
                                            ),
                                      ),
                                      Text(
                                        ad.advertiserName,
                                        style: context.myTextTheme.titleMedium
                                            ?.copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      customcontaier(
                                        StringData.hoursperday,
                                        ad.hoursPerDay,
                                      ),
                                      customcontaier(
                                        StringData.start,
                                        ad.startDate,
                                      ),
                                      customcontaier(
                                        StringData.end,
                                        ad.endDate,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: myPadding / 2),
                                  Image.asset(
                                    ad.adImage,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: myPadding / 2),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringData.display,
                                        style: context.myTextTheme.titleSmall
                                            ?.copyWith(
                                              fontSize: 11,
                                              color: AppColors.primaryTextcolor
                                                  .withValues(alpha: 0.4),
                                            ),
                                      ),

                                      Text(
                                        '${ad.displayLocation}',
                                        style: context.myTextTheme.titleSmall
                                            ?.copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),

                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      ad.locationAddress,
                                      style: context.myTextTheme.titleSmall
                                          ?.copyWith(fontSize: 10),
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.only(
                                      left: myPadding / 4,
                                      right: myPadding / 4,
                                    ),
                                    margin: const EdgeInsets.only(
                                      top: myPadding / 2,
                                    ),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.secondarycolor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            StringData.atomaticapproval,
                                            style: context
                                                .myTextTheme
                                                .titleSmall
                                                ?.copyWith(fontSize: 11),
                                          ),
                                        ),

                                        Transform.scale(
                                          scale: 0.5,
                                          child: Switch(
                                            activeColor:
                                                AppColors.successTextcolor,

                                            value: islected,
                                            onChanged: (value) {
                                              setState(() {
                                                islected = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget customcontaier(String title, var data) {
    return Container(
      padding: const EdgeInsets.all(myPadding / 5),
      margin: const EdgeInsets.only(top: myPadding / 2),

      height: 40,
      width: 75,
      decoration: BoxDecoration(
        color: AppColors.secondarycolor,
        borderRadius: BorderRadius.circular(08),
      ),

      child: Column(
        children: [
          Text(
            title,
            style: context.myTextTheme.titleSmall?.copyWith(
              fontSize: 09,
              color: AppColors.primaryTextcolor.withValues(alpha: 0.4),
            ),
          ),
          const SizedBox(height: myPadding / 4),
          Text(
            data.toString(),
            style: context.myTextTheme.titleMedium?.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

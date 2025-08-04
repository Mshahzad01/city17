import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/connect_display/screen/connect_display_screen.dart';
import 'package:city17/src/feature/home/model/business_model.dart';
import 'package:city17/src/feature/location_setting/widget/add_business_widget.dart';
import 'package:flutter/material.dart';

class LocationSetting extends StatefulWidget {
  static const routename = '/locationsetting';
  const LocationSetting({super.key});

  @override
  State<LocationSetting> createState() => _LocationSettingState();
}

class _LocationSettingState extends State<LocationSetting> {
  bool iselected = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as BusinessModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringData.locationSetting,
          style: context.myTextTheme.titleMedium?.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // add business name address and type
              AddBusinessWidget(
                address: args.address?.formattedAddress ?? 'Address Not Found ',
                bsname: args.name,
                type: args.category!.title.toString(),
              ),

              // ad Binding Offer
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 05,
                  bottom: 10,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  color: AppColors.secondarycolor,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Bidding offer',
                        style: context.myTextTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.info_outline, size: 15),
                        const SizedBox(width: 05),
                        Text(
                          'Let multiple buyers compete, and the highest \noffer wins the hour slot.',
                          style: context.myTextTheme.titleSmall?.copyWith(
                            color: AppColors.primaryTextcolor.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ad Fixed price and
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 05),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  color: AppColors.secondarycolor,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fixed Price offer',
                          style: context.myTextTheme.titleMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Transform.scale(
                          scale: 0.5,
                          child: Switch(
                            activeColor: AppColors.successTextcolor,
                            value: iselected,
                            onChanged: (bool newvalue) {
                              setState(() {
                                iselected = !iselected;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.info_outline, size: 15),
                        const SizedBox(width: 05),
                        Text(
                          'Allow the buyer to pay you a fixed \n amount for their campaign.',
                          style: context.myTextTheme.titleSmall?.copyWith(
                            color: AppColors.primaryTextcolor.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              //Display business
              Text(
                'Display',
                style: context.myTextTheme.titleMedium?.copyWith(),
              ),
              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                margin: const EdgeInsets.only(top: 05, bottom: 05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  color: AppColors.primarycolor,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(args.name, style: context.myTextTheme.titleMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '',
                            // widget.data.address,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,

                            style: context.myTextTheme.titleMedium?.copyWith(
                              fontSize: 12,

                              color: AppColors.primaryTextcolor.withAlpha(80),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Text(
                    //   widget.data.type.title,
                    //   style: context.myTextTheme.titleSmall,
                    // ),
                    const SizedBox(height: 05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Text(
                        //   '• ${widget.data.displaydumydata.length} Display',
                        //   style: context.myTextTheme.titleSmall?.copyWith(
                        //     color: AppColors.linkTextcolor,
                        //   ),
                        // ),
                        Text(
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

                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: AppColors.successTextcolor,
                        ),
                      ),
                      child: const Column(
                        children: [
                          // DisplaysByStatusWidget(
                          //   status: DisplayStatus.online,
                          //   displays: [],
                          //   // displays: widget.data.displaydumydata,
                          // ),
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: AppColors.warningTextcolor,
                        ),
                      ),
                      child: const Column(
                        children: [
                          // DisplaysByStatusWidget(
                          //   status: DisplayStatus.offline,
                          //   displays: [],
                          //   // displays: widget.data.displaydumydata,
                          // ),
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: AppColors.primaryTextcolor.withValues(
                            alpha: 0.1,
                          ),
                        ),
                      ),
                      child: const Column(
                        children: [
                          // DisplaysByStatusWidget(
                          //   status: DisplayStatus.draft,
                          //   displays: [],
                          //   // displays: widget.data.displaydumydata,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              CustomButton(
                title: StringData.connectdisplay,
                onPressed: () {
                  Navigator.pushNamed(context, ConnectDisplyScreen.routeName);
                },
                textcolor: AppColors.accentTextcolor,
                svgicon: 'assets/icon/addicon.svg',
                iconcolor: AppColors.accentTextcolor,
              ),
              const SizedBox(height: myPadding / 2),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline, size: 15),
                    const SizedBox(width: 05),
                    Text(
                      'Shared with potential buyers',
                      style: context.myTextTheme.titleSmall?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/connect_display/screen/connet_display_setep1.dart';
import 'package:city17/src/feature/home/model/display_model.dart';
import 'package:city17/src/feature/location_setting/widget/add_business_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../home/widgets/display_by_status_widgt.dart';

class LocationSetting extends StatefulWidget {
  final DisplayLocationModel data;
  static const routename = "/locationsetting";
  const LocationSetting({super.key, required this.data});

  @override
  State<LocationSetting> createState() => _LocationSettingState();
}

class _LocationSettingState extends State<LocationSetting> {
  bool iselected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Location Settings",
          style: context.myTextTheme.titleMedium?.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //add business name address and type
              AddBusinessWidget(
                address: widget.data.address,
                bsname: widget.data.name,
                type: widget.data.type.title,
              ),

              // ad Binding Offer
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(
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
                        "Bidding offer",
                        style: context.myTextTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, size: 15),
                        SizedBox(width: 05),
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
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 05),

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
                          "Fixed Price offer",
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
                        Icon(Icons.info_outline, size: 15),
                        SizedBox(width: 05),
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

              SizedBox(height: 15),

              //Display business
              Text(
                "Display",
                style: context.myTextTheme.titleMedium?.copyWith(),
              ),
              SizedBox(height: 15),

              Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                margin: EdgeInsets.only(top: 05, bottom: 05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  color: AppColors.primarycolor,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.name,
                      style: context.myTextTheme.titleMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.data.address,
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
                    Text(
                      widget.data.type.title,
                      style: context.myTextTheme.titleSmall,
                    ),

                    SizedBox(height: 05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "• ${widget.data.displaydumydata.length} Display",
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

                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      padding: EdgeInsets.symmetric(
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
                      child: Column(
                        children: [
                          DisplaysByStatusWidget(
                            status: DisplayStatus.online,
                            displays: widget.data.displaydumydata,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      padding: EdgeInsets.symmetric(
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
                      child: Column(
                        children: [
                          DisplaysByStatusWidget(
                            status: DisplayStatus.offline,
                            displays: widget.data.displaydumydata,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      padding: EdgeInsets.symmetric(
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
                      child: Column(
                        children: [
                          DisplaysByStatusWidget(
                            status: DisplayStatus.draft,
                            displays: widget.data.displaydumydata,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Connectdisplaysetpone.routename);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),

                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondarycolor,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Connect a Display",
                        style: context.myTextTheme.titleMedium?.copyWith(
                          color: AppColors.accentTextcolor,
                        ),
                      ),

                      SizedBox(width: 10),

                      SvgPicture.asset("assets/icon/addicon.svg"),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, size: 15),
                    SizedBox(width: 05),
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

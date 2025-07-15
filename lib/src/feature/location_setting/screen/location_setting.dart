import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/model/display_model.dart';
import 'package:city17/src/feature/location_setting/widget/add_business_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationSetting extends StatefulWidget {
  static const routename = "/locationsetting";
  const LocationSetting({super.key});

  @override
  State<LocationSetting> createState() => _LocationSettingState();
}

class _LocationSettingState extends State<LocationSetting> {
  bool iselected = false;

  final data = dumyDisplays[0];

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
              AddBusinessWidget(),

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

                  color: AppColors.cardcolor,
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
                            color: AppColors.textcolor.withValues(alpha: 0.3),
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

                  color: AppColors.cardcolor,
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
                            activeColor: AppColors.greencolor,
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
                            color: AppColors.textcolor.withValues(alpha: 0.3),
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

              //display business widget
              //    BusinessDisplyWidget(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),

                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.cardcolor,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Connect a Display",
                        style: context.myTextTheme.titleMedium?.copyWith(
                          color: AppColors.textbuttoncolor,
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

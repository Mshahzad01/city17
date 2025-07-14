import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationSetting extends StatefulWidget {
  static const routename = "/locationsetting";
  const LocationSetting({super.key});

  @override
  State<LocationSetting> createState() => _LocationSettingState();
}

class _LocationSettingState extends State<LocationSetting> {
  String selectedcategory = "Resturent";

  List<String> businesscategory = ['Resturent', 'Shop', 'Vechile'];

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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: AppColors.cardcolor,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name"),

                  SizedBox(height: 05),

                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: AppColors.appbackgroundcolor,
                      filled: true,

                      hint: Text("Business Name"),

                      suffixIcon: Padding(
                        padding: EdgeInsets.all(10),

                        child: SvgPicture.asset(AssetString.editicon),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: AppColors.appbackgroundcolor,
                      filled: true,
                      focusColor: AppColors.appbackgroundcolor,

                      hint: Text("Hilton 488 Georage St,Sydney"),

                      suffixIcon: Padding(
                        padding: EdgeInsets.all(15),

                        child: SvgPicture.asset(AssetString.locationicon),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    value: selectedcategory,
                    focusColor: AppColors.appbackgroundcolor,
                    dropdownColor: AppColors.appbackgroundcolor,
                    borderRadius: BorderRadius.circular(10),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),

                      fillColor: AppColors.appbackgroundcolor,
                      filled: true,
                    ),
                    items: businesscategory.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),

                    onChanged: (value) {
                      setState(() {
                        selectedcategory = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            // ad pricing
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

            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),

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
                        scale: 0.7,
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
          ],
        ),
      ),
    );
  }
}

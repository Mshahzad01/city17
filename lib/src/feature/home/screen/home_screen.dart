import 'dart:io';

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';

import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  static const routename = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedOption = "Today";
  int value = 100;

  void onSelect(String option) {
    setState(() {
      selectedOption = option;
      if (option == 'Today') {
        value = 100;
      } else if (option == 'Week') {
        value = 200;
      } else if (option == 'Month') {
        value = 300;
      }
    });
  }

  double percentage = 0;

  @override
  Widget build(BuildContext context) {
    List<String> graphrep = ['Textual', 'Graphical'];

    String slectedgraph = "Textual";

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 10, top: 15),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Income forecast",
                    style: context.myTextTheme.titleLarge?.copyWith(
                      color: AppColors.textcolor,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: DropdownButton<String>(
                      underline: Container(
                        margin: EdgeInsets.only(left: 5, right: 5, bottom: 05),
                        height: 01,
                        color: AppColors.textcolor,
                      ),
                      padding: EdgeInsets.only(left: 16, right: 16),
                      value: slectedgraph,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          slectedgraph = newValue!;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                      items: graphrep.map((String graph) {
                        return DropdownMenuItem(
                          value: graph,
                          child: Text(
                            graph,
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.textcolor,
                              fontSize: 12,
                            ), // optional
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

              Container(
                // margin: EdgeInsets.only(left: 16,right: 16),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.cardcolor,
                ),

                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 120, top: 10),

                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildTab("Today", context),
                          SizedBox(width: 08),

                          _buildTab("Week", context),
                          SizedBox(width: 08),

                          _buildTab("Month", context),
                          SizedBox(width: 08),
                        ],
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,

                      child: Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        //    padding: EdgeInsets.only(bottom: 02),
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(04),
                          color: Colors.white.withValues(alpha: 0.1),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (percentage == 0)
                              Text(
                                "____",
                                style: context.myTextTheme.titleSmall?.copyWith(
                                  color: Color(0xff5565AF),
                                ),
                              ),

                              if(percentage !=0)
                                Text(
                              percentage.toString(),
                                style: context.myTextTheme.titleSmall?.copyWith(
                                  color: Colors.green,
                                ),
                              ),

                            SizedBox(width: 04),
                            
                            SvgPicture.asset(
                              AssetString.arrowicon,
                              color: percentage == null ? Color (0xff5565AF):Colors.green)
                            
                          ],
                        ),
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

  Widget _buildTab(String label, BuildContext context) {
    final isSelected = selectedOption == label;
    return GestureDetector(
      onTap: () => onSelect(label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(label, style: context.myTextTheme.titleSmall?.copyWith()),
      ),
    );
  }
}

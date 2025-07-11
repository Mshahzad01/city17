import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routename = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> graphrep = ['Textual', 'Graphical'];

    String slectedgraph = "Textual";
    return Scaffold(
      body: SafeArea(child:    Padding(
        padding: EdgeInsets.only(left: 10,right: 10,top: 10),

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
      margin: EdgeInsets.only(left: 02,right: 02,bottom: 02),
      height: 01,
      
     ),
    padding: EdgeInsets.only(left: 15,right: 15,top: 05),
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
            color: AppColors.textcolor,fontSize: 12,
          ), // optional
        ),
      );
    }).toList(),
  ),
),

              ],
            ),
          ],
        ),
      )),
    );
    

    
    
  }
}

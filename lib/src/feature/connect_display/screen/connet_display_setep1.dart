import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/connect_display/widgets/setep_indicator_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_radio_widget.dart';

class Connectdisplaysetpone extends StatefulWidget {
  Connectdisplaysetpone({super.key});

  @override
  State<Connectdisplaysetpone> createState() => _ConnectdisplaysetponeState();
}

class _ConnectdisplaysetponeState extends State<Connectdisplaysetpone> {
  late TextEditingController _namecontroller;
  late TextEditingController _sizecontroller;
  late TextEditingController _discriptioncontroller;

  @override
  void initState() {
    _namecontroller = TextEditingController();
    _sizecontroller = TextEditingController();
    _discriptioncontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _sizecontroller.dispose();
    _discriptioncontroller.dispose();
    super.dispose();
  }

  String screenType = "Fixed";
  String screenLocation = "Restaurant";
  String screenPlacement = "Inside";
  String screenorination = "Horizantal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          StringData.connectdisplay,
          style: context.myTextTheme.titleMedium,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SetepIndicatorWidget(currentsetyp: 0),

              SizedBox(height: 24),
              Text(
                StringData.displyinstallationdetils,
                style: context.myTextTheme.titleLarge?.copyWith(fontSize: 16),
              ),

              Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondrybagroundcolor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringData.isthisscreenFixedorMobile,
                      style: context.myTextTheme.titleMedium?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),

                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.backgroundcolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomRadioTile(
                            label: "Mobile",
                            value: "Mobile",
                            groupValue: screenType,
                            onChanged: (val) =>
                                setState(() => screenType = val),
                          ),

                          SizedBox(width: 20),

                          CustomRadioTile(
                            label: "Fixed",
                            value: "Fixed",
                            groupValue: screenType,
                            onChanged: (val) =>
                                setState(() => screenType = val),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),
                    Text(
                      StringData.whereisscreeninstalled,
                      style: context.myTextTheme.titleMedium?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      margin: EdgeInsets.only(top: 10),
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.backgroundcolor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomRadioTile(
                                label: "Shop",
                                value: "Shop",
                                groupValue: screenLocation,
                                onChanged: (val) =>
                                    setState(() => screenLocation = val),
                              ),

                              SizedBox(width: 20),

                              CustomRadioTile(
                                label: "Resturant",
                                value: "Resturant",
                                groupValue: screenLocation,
                                onChanged: (val) =>
                                    setState(() => screenLocation = val),
                              ),

                              SizedBox(width: 20),

                              CustomRadioTile(
                                label: "Vehicle",
                                value: "Vehicle",
                                groupValue: screenLocation,
                                onChanged: (val) =>
                                    setState(() => screenLocation = val),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomRadioTile(
                            label: "Other",
                            value: "Other",
                            groupValue: screenLocation,
                            onChanged: (val) =>
                                setState(() => screenLocation = val),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      StringData.screenplacement,
                      style: context.myTextTheme.titleMedium?.copyWith(
                        fontSize: 14,
                      ),
                    ),

                    SizedBox(height: 10),

                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.backgroundcolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomRadioTile(
                            label: "Facing Outside",
                            value: "Facing Outside",
                            groupValue: screenPlacement,
                            onChanged: (val) =>
                                setState(() => screenPlacement = val),
                          ),

                          SizedBox(width: 20),

                          CustomRadioTile(
                            label: "Inside the Property",
                            value: "Inside this Property",
                            groupValue: screenPlacement,
                            onChanged: (val) =>
                                setState(() => screenPlacement = val),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Customize Screen
              SizedBox(height: 15),
              Text(
                StringData.customizescreen,
                style: context.myTextTheme.titleLarge?.copyWith(fontSize: 16),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondrybagroundcolor,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringData.screenorientation,
                      style: context.myTextTheme.titleMedium?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 05),
                      padding: EdgeInsets.only(left: 10, top: 05),
                      height: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.backgroundcolor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 05),
                                height: 60,
                                width: 95,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      AssetString.horizantimage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(right: 20, top: 05),
                                height: 60,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      AssetString.verticalimage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomRadioTile(
                                label: "Horizantal",
                                value: "Horizantal",
                                groupValue: screenorination,
                                onChanged: (val) =>
                                    setState(() => screenorination = val),
                              ),

                              SizedBox(width: 40),
                              CustomRadioTile(
                                label: "Vertical",
                                value: "Vertical",
                                groupValue: screenorination,
                                onChanged: (val) =>
                                    setState(() => screenorination = val),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondrybagroundcolor,
                ),
                height: 60,

                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 05),
                    fillColor: AppColors.secondrybagroundcolor,
                    filled: true,
                    label: Text(StringData.name),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.only(top: 12, right: 05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondrybagroundcolor,
                ),
                height: 60,

                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 05),
                    fillColor: AppColors.secondrybagroundcolor,
                    filled: true,
                    label: Text(StringData.size),
                    suffix: Text(
                      'Inches',
                      style: context.myTextTheme.titleSmall?.copyWith(
                        fontSize: 11,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(top: 12, right: 05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondrybagroundcolor,
                ),
                height: 90,

                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 05),
                    fillColor: AppColors.secondrybagroundcolor,
                    filled: true,
                    label: Text(StringData.adddiscription),
                    suffix: Text(
                      StringData.inches,
                      style: context.myTextTheme.titleSmall?.copyWith(
                        fontSize: 11,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/connect_display/enum/screeen_placement_enum.dart';
import 'package:city17/src/feature/connect_display/enum/screen_installed_enum.dart';
import 'package:city17/src/feature/connect_display/screen/disply_setup2.dart';
import 'package:city17/src/feature/connect_display/widgets/setep_indicator_widget.dart';
import 'package:flutter/material.dart';

import '../enum/display_orientation_enum.dart';
import '../enum/displaylocation_enum.dart';
import '../widgets/custom_radio_widget.dart';

class Connectdisplaysetpone extends StatefulWidget {
  const Connectdisplaysetpone({super.key});

  static const routename = "/displyone";

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

  DisplayLocationType screenType = DisplayLocationType.fixed;

  ScreenInstallEnum screenlocation = ScreenInstallEnum.resturent;

  ScreeenPlacementEnum screenplacement = ScreeenPlacementEnum.facingoutside;
  DisplayOrientation screenorination = DisplayOrientation.horizontal;
  int selectedIndex = 0;

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
                  color: AppColors.secondarycolor,
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
                        color: AppColors.primarycolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...DisplayLocationType.values.map((x) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<DisplayLocationType>.adaptive(
                                  value: screenType,
                                  groupValue: x,
                                  onChanged: (v) {
                                    setState(() {
                                      screenType = x;
                                    });
                                  },
                                ),
                                Text(x.title),
                              ],
                            );
                          }),
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
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primarycolor,
                      ),
                      child: Wrap(
                        children: [
                          ...ScreenInstallEnum.values.map((x) {
                            return CustomRadioTile<ScreenInstallEnum>(
                              value: x,
                              groupValue: screenlocation,
                              onChanged: (val) =>
                                  setState(() => screenlocation = x),
                            );
                          }),
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
                      padding: EdgeInsets.only(left: 10, top: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primarycolor,
                      ),
                      child: Wrap(
                        children: ScreeenPlacementEnum.values.map((x) {
                          return CustomRadioTile<ScreeenPlacementEnum>(
                            value: x,
                            groupValue: screenplacement,
                            onChanged: (val) =>
                                setState(() => screenplacement = x),
                          );
                        }).toList(),
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
                  color: AppColors.secondarycolor,
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
                        color: AppColors.primarycolor,
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
                              CustomRadioTile<DisplayOrientation>(
                                value: DisplayOrientation.horizontal,
                                groupValue: screenorination,
                                onChanged: (val) =>
                                    setState(() => screenorination = val),
                              ),

                              SizedBox(width: 40),
                              CustomRadioTile<DisplayOrientation>(
                                value: DisplayOrientation.veritcal,
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

              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondarycolor,
                ),
                height: 60,

                child: TextFormField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 05),
                    fillColor: AppColors.secondarycolor,
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
                  color: AppColors.secondarycolor,
                ),
                height: 60,

                child: TextFormField(
                  controller: _sizecontroller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 10,
                      top: 05,
                      right: 10,
                    ),
                    fillColor: AppColors.secondarycolor,

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
                  color: AppColors.secondarycolor,
                ),
                height: 90,

                child: TextFormField(
                  controller: _discriptioncontroller,
                  maxLines: 2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 05),
                    fillColor: AppColors.secondarycolor,
                    filled: true,
                    label: Text(StringData.adddiscription),
                    focusColor: AppColors.secondarycolor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, size: 15),
                    SizedBox(width: 05),
                    Text(
                      StringData.sharewithpotentialbuyes,
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
      bottomNavigationBar: CustomButtonRow(
        onSaveAsDraft: () {},
        onNext: () {
          Navigator.pushNamed(context, ConnectDisplaySetupTwo.routename);
        },
        btn1title: StringData.safeasdraft,
        btn2title: StringData.next,
      ),
    );
  }
}

class CustomButtonRow extends StatelessWidget {
  final VoidCallback onSaveAsDraft;
  final VoidCallback onNext;
  final String btn1title;
  final String btn2title;

  const CustomButtonRow({
    super.key,
    required this.onSaveAsDraft,
    required this.onNext,
    required this.btn1title,
    required this.btn2title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 16, right: 16),
      height: 60,
      color: AppColors.bottombarcolor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: onSaveAsDraft,
            // style: ElevatedButton.styleFrom(
            //   primarycolor: AppColors.secondarycolor,
            // ),
            child: const Text("Save as Draft"),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: onNext,
            child: Container(
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                color: AppColors.secondarycolor,
                borderRadius: BorderRadius.circular(08),
              ),
              alignment: Alignment.center,
              child: Text(
                btn2title,
                style: context.myTextTheme.titleSmall?.copyWith(
                  color: AppColors.accentTextcolor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

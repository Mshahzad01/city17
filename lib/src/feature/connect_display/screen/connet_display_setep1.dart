import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/customtextfield.dart';
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

  static const routename = '/displyone';

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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SetepIndicatorWidget(currentsetyp: 0),

              const SizedBox(height: 24),
              Text(
                StringData.displyinstallationdetils,
                style: context.myTextTheme.titleLarge?.copyWith(fontSize: 16),
              ),

              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(10),
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
                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primarycolor,
                      ),
                      child: Wrap(
                        spacing: 08,
                        children: DisplayLocationType.values.map((x) {
                          return CustomRadioTile<DisplayLocationType>(
                            value: x,
                            groupValue: screenType,
                            onChanged: (val) => setState(() => screenType = x),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 15),
                    Text(
                      StringData.whereisscreeninstalled,
                      style: context.myTextTheme.titleMedium?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      margin: const EdgeInsets.only(top: 10),
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primarycolor,
                      ),
                      child: Wrap(
                        spacing: 05,
                        runSpacing: 05,
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
                    const SizedBox(height: 15),
                    Text(
                      StringData.screenplacement,
                      style: context.myTextTheme.titleMedium?.copyWith(
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primarycolor,
                      ),
                      child: Row(
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
              const SizedBox(height: 15),
              Text(
                StringData.customizescreen,
                style: context.myTextTheme.titleLarge?.copyWith(fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(10),
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
                      margin: const EdgeInsets.only(top: 05),
                      padding: const EdgeInsets.only(left: 10, top: 05),
                      height: 110,
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
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    screenorination =
                                        DisplayOrientation.horizontal;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    top: 05,
                                  ),
                                  height: 60,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        AssetString.horizantimage,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    screenorination =
                                        DisplayOrientation.veritcal;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 30,
                                    top: 05,
                                  ),
                                  height: 60,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        AssetString.verticalimage,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: myPadding / 1.2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomRadioTile<DisplayOrientation>(
                                value: DisplayOrientation.horizontal,
                                groupValue: screenorination,
                                onChanged: (val) =>
                                    setState(() => screenorination = val),
                              ),

                              const SizedBox(width: 40),
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

              const SizedBox(height: 10),

              const SizedBox(height: 10),

              CustomTextfield(controller: _namecontroller, hinttext: 'Name'),
              const SizedBox(height: myPadding / 2),

              CustomTextfield(controller: _sizecontroller, hinttext: 'Size'),
              const SizedBox(height: myPadding / 2),
              CustomTextfield(
                controller: _discriptioncontroller,
                hinttext: 'Discription',
              ),

              const SizedBox(height: 10),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline, size: 15),
                    const SizedBox(width: 05),
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
          Navigator.pushNamed(context, DisplySetupTwo.routename);
        },
        btn1title: StringData.safeasdraft,
        btn2title: StringData.next,
      ),
    );
  }
}

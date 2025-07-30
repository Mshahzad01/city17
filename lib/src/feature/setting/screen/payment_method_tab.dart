import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/component/custom_textfield.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/setting/widget/payment_hadding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodTab extends StatefulWidget {
  const PaymentMethodTab({super.key});

  @override
  State<PaymentMethodTab> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethodTab> {
  late TextEditingController _bankNameController;
  late TextEditingController _bankAccountNameController;
  late TextEditingController _bankRountingNumberController;
  late TextEditingController _bankAccountNumberController;
  late TextEditingController _customAccounttitleController;
  late TextEditingController _customInstructionController;
  late TextEditingController _customlinkController;

  @override
  void initState() {
    _bankNameController = TextEditingController();
    _bankAccountNameController = TextEditingController();
    _bankRountingNumberController = TextEditingController();
    _bankAccountNumberController = TextEditingController();
    _customAccounttitleController = TextEditingController();
    _customInstructionController = TextEditingController();
    _customlinkController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _bankNameController.dispose();
    _bankAccountNameController.dispose();

    _bankAccountNumberController.dispose();
    _bankRountingNumberController.dispose();
    _customAccounttitleController.dispose();
    _customInstructionController.dispose();
    _customlinkController.dispose();

    super.dispose();
  }

  bool isSeleted = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListView(
      children: [
        Container(
          height: size.height / 15,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: myPadding),
          padding: const EdgeInsets.symmetric(horizontal: myPadding / 2),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(myPadding / 2),
            color: AppColors.secondarycolor,
          ),
          child: PaymentHaddingWidget(
            isSelected: isSeleted,
            title: StringData.cash,
            onChanged: (value) {},
            leadingIcon: SvgPicture.asset(AssetString.cashIcon),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: myPadding),
          padding: const EdgeInsets.symmetric(
            horizontal: myPadding / 2,
            vertical: myPadding / 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(myPadding / 2),
            color: AppColors.secondarycolor,
          ),

          child: Column(
            children: [
              PaymentHaddingWidget(
                isSelected: isSeleted,
                title: StringData.bank,
                onChanged: (value) {},
                leadingIcon: SvgPicture.asset(AssetString.bankIcon),
              ),

              const SizedBox(height: myPadding),

              CustomTextfield(
                controller: _bankNameController,
                bagroundColor: AppColors.primarycolor,
                keyboardType: TextInputType.name,
                hinttext: StringData.bankName,
              ),
              const SizedBox(height: myPadding),

              CustomTextfield(
                controller: _bankAccountNameController,
                bagroundColor: AppColors.primarycolor,
                keyboardType: TextInputType.name,
                hinttext: StringData.bankAccountName,
              ),
              const SizedBox(height: myPadding),

              CustomTextfield(
                controller: _bankRountingNumberController,
                bagroundColor: AppColors.primarycolor,
                keyboardType: TextInputType.name,
                hinttext: StringData.rountingNumber,
              ),

              const SizedBox(height: myPadding),
              CustomTextfield(
                controller: _bankAccountNumberController,
                bagroundColor: AppColors.primarycolor,
                keyboardType: TextInputType.name,
                hinttext: StringData.bankAccountNumber,
              ),
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: myPadding),
          padding: const EdgeInsets.symmetric(
            horizontal: myPadding / 2,
            vertical: myPadding / 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(myPadding / 2),

            color: AppColors.secondarycolor,
          ),

          child: Column(
            children: [
              PaymentHaddingWidget(
                isSelected: isSeleted,
                leadingIcon: SvgPicture.asset(AssetString.customCash),
                title: StringData.customPaymentOption,
                onChanged: (value) {
                  setState(() {
                    // isSeleted = value;
                  });
                },
              ),

              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 00),
                minTileHeight: 00,
                leading: SvgPicture.asset(AssetString.infromationCircle),
                title: Text(
                  StringData
                      .addaCustomPaymentOptiontoYourprofileThisWillAllowYourClintstoPayusingThisCustomPaymentOption,
                  style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
                ),
              ),

              ExpansionTile(
                childrenPadding: const EdgeInsets.symmetric(
                  horizontal: myPadding / 2,
                  vertical: myPadding / 2,
                ),
                tilePadding: const EdgeInsets.symmetric(
                  horizontal: myPadding / 2,
                ),
                backgroundColor: AppColors.primarycolor,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(myPadding / 2),
                ),

                title: Text(
                  StringData.addCustomPaymentOption,
                  style: context.myTextTheme.titleSmall,
                ),
                children: [
                  CustomTextfield(
                    controller: _customAccounttitleController,
                    bagroundColor: AppColors.secondarycolor,
                    keyboardType: TextInputType.name,
                    hinttext: StringData.enterYourAccountTitleHere,
                  ),
                  const SizedBox(height: myPadding),
                  CustomTextfield(
                    controller: _customInstructionController,
                    bagroundColor: AppColors.secondarycolor,
                    keyboardType: TextInputType.name,
                    hinttext: StringData.enterYourInstructionHere,
                  ),
                  const SizedBox(height: myPadding),
                  CustomTextfield(
                    controller: _customlinkController,
                    bagroundColor: AppColors.secondarycolor,
                    keyboardType: TextInputType.name,
                    hinttext: StringData.enterTheLinkHere,
                  ),
                  const SizedBox(height: myPadding),

                  CustomButton(
                    title: StringData.save,
                    onPressed: () {},
                    backgroundColor: AppColors.accentTextcolor,
                  ),
                  const SizedBox(height: myPadding),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

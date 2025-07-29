import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
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

  @override
  void initState() {
    _bankNameController = TextEditingController();
    _bankAccountNameController = TextEditingController();
    _bankRountingNumberController = TextEditingController();
    _bankAccountNumberController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _bankNameController.dispose();
    _bankAccountNameController.dispose();

    _bankAccountNumberController.dispose();
    _bankRountingNumberController.dispose();
    super.dispose();
  }

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
            title: 'Cash',
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
                title: 'Bank',
                onChanged: (value) {},
                leadingIcon: SvgPicture.asset(AssetString.bankIcon),
              ),

              const SizedBox(height: myPadding),

              CustomTextfield(
                controller: _bankNameController,
                bagroundColor: AppColors.primarycolor,
                keyboardType: TextInputType.name,
                hinttext: 'Bank Name',
              ),
              const SizedBox(height: myPadding),

              CustomTextfield(
                controller: _bankAccountNameController,
                bagroundColor: AppColors.primarycolor,
                keyboardType: TextInputType.name,
                hinttext: 'Bank Account Name',
              ),
              const SizedBox(height: myPadding),

              CustomTextfield(
                controller: _bankRountingNumberController,
                bagroundColor: AppColors.primarycolor,
                keyboardType: TextInputType.name,
                hinttext: 'Rounting Number',
              ),

              const SizedBox(height: myPadding),
              CustomTextfield(
                controller: _bankAccountNumberController,
                bagroundColor: AppColors.primarycolor,
                keyboardType: TextInputType.name,
                hinttext: 'Bank Account Number',
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
                leadingIcon: SvgPicture.asset(AssetString.customCash),
                title: 'Custom Payment Option',
                onChanged: (value) {},
              ),

              // const SizedBox(height: myPadding / 2),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 00),
                minTileHeight: 00,
                leading: SvgPicture.asset(AssetString.infromationCircle),
                title: Text(
                  'Add a custom payment option to your profile.This will allow your clients to pay using this custom payment option.',
                  style: context.myTextTheme.titleSmall?.copyWith(fontSize: 10),
                ),
              ),

              ExpansionTile(
                childrenPadding: const EdgeInsets.only(right: 08, left: 08),
                tilePadding: const EdgeInsets.only(left: 08, right: 08),
                backgroundColor: AppColors.primarycolor,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(myPadding / 2),
                ),

                title: Text(
                  'Add Custom Payment Option',
                  style: context.myTextTheme.titleSmall,
                ),
                children: [
                  CustomTextfield(
                    controller: _bankAccountNumberController,
                    bagroundColor: AppColors.secondarycolor,
                    keyboardType: TextInputType.name,
                    hinttext: 'Bank Account Number',
                  ),
                  SizedBox(height: myPadding),
                  CustomTextfield(
                    controller: _bankAccountNumberController,
                    bagroundColor: AppColors.secondarycolor,
                    keyboardType: TextInputType.name,
                    hinttext: 'Bank Account Number',
                  ),
                  SizedBox(height: myPadding),
                  CustomTextfield(
                    controller: _bankAccountNumberController,
                    bagroundColor: AppColors.secondarycolor,
                    keyboardType: TextInputType.name,
                    hinttext: 'Bank Account Number',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

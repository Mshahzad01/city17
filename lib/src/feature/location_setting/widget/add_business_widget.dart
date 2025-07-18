import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/location_setting/enum/business_category_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddBusinessWidget extends StatefulWidget {
  final String address;
  final String bsname;
  final String type;
  const AddBusinessWidget({
    super.key,
    required this.address,
    required this.bsname,
    required this.type,
  });

  @override
  State<AddBusinessWidget> createState() => _AddBusinessWidgetState();
}

class _AddBusinessWidgetState extends State<AddBusinessWidget> {
  late TextEditingController _businessnamecontroller;
  late TextEditingController _addressController;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  BusinessCategoryEnum? selectedcategory;

  @override
  void initState() {
    _businessnamecontroller = TextEditingController(text: widget.bsname);
    _addressController = TextEditingController(text: widget.address);
    selectedcategory = BusinessCategoryEnum.values.firstWhere(
      (e) => e.title == widget.type,
      orElse: () => BusinessCategoryEnum.returent,
    );
    super.initState();
  }

  @override
  void dispose() {
    _businessnamecontroller.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        color: AppColors.secondrybagroundcolor,
      ),

      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringData.name),

            SizedBox(height: myPadding / 2),

            TextFormField(
              controller: _businessnamecontroller,
              style: context.myTextTheme.titleMedium?.copyWith(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,

                  borderRadius: BorderRadius.circular(myPadding),
                ),
                fillColor: AppColors.backgroundcolor,
                filled: true,

                hint: Text(StringData.businessname),

                suffixIcon: Padding(
                  padding: EdgeInsets.all(myPadding / 2),

                  child: SvgPicture.asset(AssetString.editicon),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: myPadding / 2,
                  vertical: myPadding / 2,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Business name is required';
                }
                return null;
              },
            ),

            SizedBox(height: myPadding / 2),
            TextFormField(
              controller: _addressController,
              style: context.myTextTheme.titleMedium?.copyWith(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,

                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: AppColors.backgroundcolor,
                filled: true,
                focusColor: AppColors.backgroundcolor,

                hint: Text(StringData.businessaddress),

                suffixIcon: Padding(
                  padding: EdgeInsets.all(15),

                  child: SvgPicture.asset(AssetString.locationicon),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Business Address is Required';
                }
                return null;
              },
            ),

            SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedcategory,
              focusColor: AppColors.backgroundcolor,
              dropdownColor: AppColors.backgroundcolor,
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

                fillColor: AppColors.backgroundcolor,
                filled: true,
              ),
              items: BusinessCategoryEnum.values.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category.title),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedcategory = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

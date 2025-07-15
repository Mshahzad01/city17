import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddBusinessWidget extends StatefulWidget {
  const AddBusinessWidget({super.key});

  @override
  State<AddBusinessWidget> createState() => _AddBusinessWidgetState();
}

class _AddBusinessWidgetState extends State<AddBusinessWidget> {
  String selectedcategory = "Resturent";

  List<String> businesscategory = ['Resturent', 'Shop', 'Vechile'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),

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
              return DropdownMenuItem(value: category, child: Text(category));
            }).toList(),

            onChanged: (value) {
              setState(() {
                selectedcategory = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}

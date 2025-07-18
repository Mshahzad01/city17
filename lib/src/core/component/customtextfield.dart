import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String? hinttext;
  final String? labeltext;

  final TextEditingController controller;

  const CustomTextfield({
    super.key,
    this.hinttext,
    this.labeltext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 05),
        hintText: hinttext,
        labelText: labeltext,
        fillColor: AppColors.secondarycolor,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(myPadding)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

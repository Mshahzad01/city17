import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String? hinttext;
  final String? labeltext;

  final String? Function(String?)? validator;

  final TextEditingController controller;

  const CustomTextfield({
    super.key,
    this.hinttext,
    this.labeltext,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: myPadding,
          right: myPadding,
          top: 05,
        ),
        hintText: hinttext,
        labelText: labeltext,
        fillColor: AppColors.secondarycolor,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(myPadding)),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }
}

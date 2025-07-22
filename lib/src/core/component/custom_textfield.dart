import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.hinttext,
    this.labeltext,
    this.controller,
    this.validator,
    this.onChanged,

    this.suffixSVG,
  });

  final String? hinttext;
  final String? labeltext;

  final String? Function(String?)? validator;

  final Function(String)? onChanged;
  final String? suffixSVG;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,

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

        suffixIconConstraints: const BoxConstraints(maxWidth: myPadding * 4),
        suffixIcon: suffixSVG == null
            ? null
            : Padding(
                padding: const EdgeInsetsGeometry.only(right: myPadding / 2),
                child: SvgPicture.asset(suffixSVG!),
              ),
      ),
      validator: validator,
    );
  }
}

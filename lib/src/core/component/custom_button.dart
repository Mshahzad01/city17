import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textcolor;

  final String? svgicon;
  final Color? iconcolor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.textcolor,
    this.svgicon,
    this.iconcolor,

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.secondarycolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
         
        padding: const EdgeInsets.symmetric(
          horizontal: myPadding / 2,
          vertical: myPadding/2
        
        ),
        minimumSize: const Size.fromHeight(50),
        maximumSize: const Size.fromHeight(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            title,
            style: context.myTextTheme.titleMedium?.copyWith(
              color: textcolor ?? AppColors.primaryTextcolor,
            ),
          ),

          const SizedBox(width: myPadding / 2),

          SvgPicture.asset(svgicon!,width: 18,height: 18,colorFilter:  ColorFilter.mode(iconcolor??AppColors.accentTextcolor,BlendMode.dstIn )),
        ],
      ),
    );
  }
}

// import 'package:city17/src/constant/app_color.dart';
// import 'package:city17/src/constant/app_constants.dart';
// import 'package:city17/src/core/extension/context_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     required this.title,
//     required this.onPressed,
//     this.backgroundColor,
//     this.textcolor,
//     this.svgicon,
//     this.iconcolor,
//     this.fontSize,
//     this.mixumHeight,
//   });

//   final String title;
//   final VoidCallback onPressed;
//   final Color? backgroundColor;
//   final Color? textcolor;
//   final String? svgicon;
//   final Color? iconcolor;
//   final double? fontSize;
//   final double? mixumHeight;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,

//       style: ElevatedButton.styleFrom(
//         backgroundColor: backgroundColor ?? AppColors.secondarycolor,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         shadowColor: backgroundColor == Colors.transparent
//             ? Colors.transparent
//             : null,
//         padding: const EdgeInsets.symmetric(
//           horizontal: myPadding / 2,
//           vertical: myPadding / 2,
//         ),
//       ),
//       child: Row(
//         // mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,

//         children: [
//           Text(
//             title,
//             style: context.myTextTheme.titleMedium?.copyWith(
//               color: textcolor ?? AppColors.primaryTextcolor,
//               fontSize: fontSize ?? 15,
//             ),
//           ),

//           const SizedBox(width: myPadding / 2),
//           if (svgicon != null)
//             SvgPicture.asset(
//               svgicon!,
//               width: 18,
//               height: 18,
//               colorFilter: ColorFilter.mode(
//                 iconcolor ?? AppColors.accentTextcolor,
//                 BlendMode.dstIn,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.textcolor,
    this.svgicon,
    this.iconcolor,
    this.fontSize,
    this.mixumHeight,
    this.isLoading = false,
    this.iconAtStart = false,
  });

  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textcolor;
  final String? svgicon;
  final Color? iconcolor;
  final double? fontSize;
  final double? mixumHeight;
  final bool isLoading;
  final bool iconAtStart;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.secondarycolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: backgroundColor == Colors.transparent
            ? Colors.transparent
            : null,
        padding: const EdgeInsets.symmetric(
          horizontal: myPadding / 2,
          vertical: myPadding / 2,
        ),
        minimumSize: Size(double.infinity, mixumHeight ?? 50),
      ),
      child: isLoading
          ? const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (svgicon != null && iconAtStart) ...[
                  SvgPicture.asset(
                    svgicon!,
                    width: 18,
                    height: 18,

                    colorFilter: iconcolor != null
                        ? ColorFilter.mode(iconcolor!, BlendMode.srcIn)
                        : null,
                  ),
                  const SizedBox(width: myPadding / 2),
                ],

                Text(
                  title,
                  style: context.myTextTheme.titleMedium?.copyWith(
                    color: textcolor ?? AppColors.primaryTextcolor,
                    fontSize: fontSize ?? 15,
                  ),
                ),

                if (svgicon != null && !iconAtStart) ...[
                  const SizedBox(width: myPadding / 2),
                  SvgPicture.asset(
                    svgicon!,
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      iconcolor ?? AppColors.accentTextcolor,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}

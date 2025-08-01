import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/business_overrview/model/bussiness_overview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BussinessDisplayWidget extends StatelessWidget {
  const BussinessDisplayWidget({super.key, required this.newDisplay});
  final List<DisplaysOverview> newDisplay;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: newDisplay.length,
      itemBuilder: (context, index) {
        final displayValue = newDisplay[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: myPadding / 2),
              padding: const EdgeInsets.only(
                top: myPadding / 3,
                left: myPadding / 3,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.secondarycolor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayValue.name,

                    style: context.myTextTheme.titleMedium?.copyWith(
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'This Week ${displayValue.campaignsThisWeek.toString()}',

                        style: context.myTextTheme.titleSmall?.copyWith(
                          fontSize: 10,
                          color: Colors.white.withValues(alpha: 0.3),
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(AssetString.growthicon),
                      const SizedBox(width: myPadding / 3),
                      Text(
                        displayValue.uptime.toString(),
                        style: context.myTextTheme.titleSmall,
                      ),
                      const SizedBox(width: myPadding / 2),
                      Text(
                        displayValue.revenue.show(),

                        style: context.myTextTheme.titleSmall,
                      ),
                      const SizedBox(width: myPadding / 3),
                      // Container(
                      //   margin: const EdgeInsets.only(right: 5),
                      //   height: 15,
                      //   width: 40,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(4),
                      //     color: AppColors.successTextcolor.withValues(
                      //       alpha: 0.1,
                      //     ),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         '',
                      //         // x.displaySize.toString(),
                      //         style: context.myTextTheme.titleSmall?.copyWith(
                      //           color: AppColors.successTextcolor,
                      //           fontSize: 8,
                      //         ),
                      //       ),
                      //       const SizedBox(width: 4),
                      //       SvgPicture.asset(
                      //         AssetString.arrowicon,
                      //         colorFilter: const ColorFilter.mode(
                      //           AppColors.successTextcolor,
                      //           BlendMode.srcIn,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

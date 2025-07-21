import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/model/display_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DisplaysByStatusWidget extends StatelessWidget {
  const DisplaysByStatusWidget({
    super.key,
    required this.status,
    required this.displays,
  });

  final DisplayStatus status;
  final List<Display> displays;

  @override
  Widget build(BuildContext context) {
    final requiredDisplays = displays.where((e) => e.status == status);

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(backgroundColor: status.color, radius: 08),
            const SizedBox(width: 08),
            Text(
              status.title,
              style: context.myTextTheme.titleMedium?.copyWith(fontSize: 14),
            ),
          ],
        ),

        Column(
          children: [
            ...requiredDisplays.map(
              (x) => Container(
                height: 50,
                margin: const EdgeInsets.only(top: 8, bottom: 5),
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondarycolor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      x.name,
                      style: context.myTextTheme.titleMedium?.copyWith(
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          x.time.toString(),
                          style: context.myTextTheme.titleSmall?.copyWith(
                            fontSize: 10,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(AssetString.growthicon),
                        const SizedBox(width: 5),
                        Text(
                          x.uptime.toString(),
                          style: context.myTextTheme.titleSmall,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '\$ ${x.revenue}',
                          style: context.myTextTheme.titleSmall,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 15,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.successTextcolor.withValues(
                              alpha: 0.1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${x.growth}',
                                style: context.myTextTheme.titleSmall?.copyWith(
                                  color: AppColors.successTextcolor,
                                  fontSize: 8,
                                ),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset(AssetString.arrowicon,colorFilter: const ColorFilter.mode(AppColors.successTextcolor, BlendMode.srcIn),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/utils/shared_pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileOptionTab extends StatefulWidget {
  const ProfileOptionTab({super.key});

  @override
  State<ProfileOptionTab> createState() => _ProfileOptionTabState();
}

class _ProfileOptionTabState extends State<ProfileOptionTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: myPadding),
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 70,

                backgroundImage:
                    currentLoginInfo?.user?.personalInformation != null
                    ? NetworkImage(
                        currentLoginInfo!.user!.personalInformation.profilePic,
                      )
                    : null,
                // currentLoginInfo?.user?.personalInformation.profilePic ??
              ),
            ),

            Positioned(
              top: 90,
              right: 80,
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,

                  color: AppColors.secondarycolor,
                ),

                child: IconButton(
                  onPressed: null,
                  icon: SvgPicture.asset(
                    AssetString.cameraIcon,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryTextcolor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: myPadding * 2),

        Text(
          StringData.fullName,
          style: context.myTextTheme.titleMedium?.copyWith(
            color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
            fontSize: 14,
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: myPadding / 3),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(myPadding / 2),
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondarycolor,
          ),
          child: Text(
            currentLoginInfo?.user?.personalInformation.name ?? 'Name',
          ),
        ),
        const SizedBox(height: myPadding),
        Text(
          StringData.phoneNumber,
          style: context.myTextTheme.titleMedium?.copyWith(
            color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
            fontSize: 14,
          ),
        ),

        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: myPadding / 2),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(myPadding / 2),

                color: AppColors.secondarycolor,
              ),
              child: Text(
                currentLoginInfo?.user?.personalInformation.phoneNumber!
                        .substring(0, 2) ??
                    '00',
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  left: myPadding / 2,
                  top: myPadding / 2,
                ),
                height: 45,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(myPadding / 2),

                  color: AppColors.secondarycolor,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: myPadding),

        Text(
          StringData.email,
          style: context.myTextTheme.titleMedium?.copyWith(
            color: AppColors.primaryTextcolor.withValues(alpha: 0.3),
            fontSize: 14,
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: myPadding / 3),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(myPadding / 2),
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondarycolor,
          ),
          child: Text(
            currentLoginInfo?.user?.credentialDetails.email ?? 'Email',
          ),
        ),
      ],
    );
  }
}

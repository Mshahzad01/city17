import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/model/panding_action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PandingAcction extends StatelessWidget {
  const PandingAcction({super.key, this.ischecked = false});

  final bool ischecked;

  @override
  Widget build(BuildContext context) {
    final data = dumydata[0];
    return Column(
      children: [
        pandingaction(
          'Panding Advert',
          AssetString.advertismenticon,
          data.pandingadvert,
          context,
        ),

        pandingaction(
          'Due Payment',
          AssetString.clockicon,
          data.duepayment,
          context,
        ),

        pandingaction(
          'Payment Approvals',
          AssetString.orderaprovelicon,
          data.paymentaprroval,
          context,
        ),
      ],
    );
  }

  Widget pandingaction(
    String title,
    String icon,
    double status,
    BuildContext contex,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        color: AppColors.secondarycolor,
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 10),

          Text(title, style: contex.myTextTheme.titleMedium?.copyWith()),

          const Spacer(),
          if (status == 0) const Icon(Icons.check_circle_outline),

          if (status != 0)
            Text(
              status.toString(),
              textAlign: TextAlign.center,
              style: contex.myTextTheme.titleSmall?.copyWith(
                color: const Color(0xffE37F47),
                decoration: TextDecoration.underline,
                fontSize: 14,
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentHaddingWidget extends StatelessWidget {
  const PaymentHaddingWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.onChanged,
    required this.isSelected,
  });

  final SvgPicture leadingIcon;
  final String title;
  final ValueChanged<bool> onChanged;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 00),
      minTileHeight: 00,
      leading: leadingIcon,
      title: Text(
        title,
        style: context.myTextTheme.titleSmall?.copyWith(fontSize: 14),
      ),
      trailing: Transform.scale(
        alignment: Alignment.centerRight,
        scale: 0.6,
        child: Switch(
          focusColor: AppColors.primaryTextcolor,
          inactiveThumbColor: AppColors.successTextcolor,

          value: isSelected,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

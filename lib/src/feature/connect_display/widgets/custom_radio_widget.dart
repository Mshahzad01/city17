import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  final String label;
  final String value;
  final String groupValue;
  final void Function(String) onChanged;

  const CustomRadioTile({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                label,
                style: context.myTextTheme.titleMedium?.copyWith(
                  color: isSelected
                      ? AppColors.textcolor
                      : AppColors.textcolor.withValues(alpha: 0.3),
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                isSelected ? Icons.check_circle : Icons.circle_outlined,
                color: isSelected
                    ? AppColors.textcolor
                    : AppColors.textcolor.withValues(alpha: 0.3),
                size: 20,
              ),
            ],
          ),
        ],
      ),
      // ),
    );
  }
}

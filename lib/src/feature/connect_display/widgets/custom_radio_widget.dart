import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final void Function(T) onChanged;

  const CustomRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () => onChanged(value),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (value as dynamic).title,
              style: context.myTextTheme.titleMedium?.copyWith(
                color: isSelected
                    ? AppColors.primaryTextcolor
                    : AppColors.primaryTextcolor.withValues(alpha: 0.3),
                fontSize: 12,
              ),
            ),
            const SizedBox(width: myPadding / 3),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected
                  ? AppColors.primaryTextcolor
                  : AppColors.primaryTextcolor.withValues(alpha: 0.3),
              size: 20,
            ),
          ],
        ),
        // ),
      ),
    );
  }
}

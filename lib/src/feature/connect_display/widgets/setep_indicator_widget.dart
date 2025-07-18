import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

class SetepIndicatorWidget extends StatelessWidget {
  const SetepIndicatorWidget({super.key, required this.currentsetyp});

  final int currentsetyp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return Text(
          'Setp ${index + 1}',
          style: context.myTextTheme.titleMedium?.copyWith(
            color: index == currentsetyp
                ? AppColors.primaryTextcolor
                : AppColors.primaryTextcolor.withValues(alpha: 0.4),
          ),
        );
      }),
    );
  }
}

class CustomButtonRow extends StatelessWidget {
  final VoidCallback onSaveAsDraft;
  final VoidCallback onNext;
  final String btn1title;
  final String btn2title;

  const CustomButtonRow({
    super.key,
    required this.onSaveAsDraft,
    required this.onNext,
    required this.btn1title,
    required this.btn2title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 16, right: 16),
      height: 60,
      color: AppColors.bottombarcolor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: onSaveAsDraft,

            child: const Text('Save as Draft'),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: onNext,
            child: Container(
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                color: AppColors.secondarycolor,
                borderRadius: BorderRadius.circular(08),
              ),
              alignment: Alignment.center,
              child: Text(
                btn2title,
                style: context.myTextTheme.titleSmall?.copyWith(
                  color: AppColors.accentTextcolor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

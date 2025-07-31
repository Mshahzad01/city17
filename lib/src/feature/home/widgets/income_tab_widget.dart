import 'package:city17/src/feature/home/model/income_model.dart';
import 'package:flutter/material.dart';
import 'package:city17/src/feature/home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeTab extends StatelessWidget {
  final IncomeType label;
  final VoidCallback onTap;

  const IncomeTab({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isSelected = context.watch<HomeCubit>().incomeType == label;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withAlpha(25) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label.title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 11),
        ),
      ),
    );
  }
}

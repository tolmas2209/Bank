import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import '../data/mock_data.dart';

class PeriodSwitcher extends StatelessWidget {
  final ChartPeriod selected;
  final ValueChanged<ChartPeriod> onChanged;

  PeriodSwitcher({super.key, required this.selected, required this.onChanged});

  final Map<ChartPeriod, String> labels = {
    ChartPeriod.day: 'Day',
    ChartPeriod.month: 'Month',
    ChartPeriod.yearly: 'Yearly',
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: ChartPeriod.values.map((period) {
          final active = period == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(period),
              child: Container(
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: active ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  labels[period]!,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                    color: active ? Colors.white : AppColors.hint,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

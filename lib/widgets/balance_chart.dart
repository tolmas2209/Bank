import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import '../core/utils/formatters.dart';
import '../models/chart_data.dart';

class BalanceChart extends StatelessWidget {
  final ChartData data;
  const BalanceChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final noTitles = AxisTitles(sideTitles: SideTitles(showTitles: false));
    final labelStyle = TextStyle(color: AppColors.muted, fontSize: 15);

    return SizedBox(
      height: 260,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (data.labels.length - 1).toDouble(),
          minY: 0,
          maxY: data.maxY,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            drawVerticalLine: false,
            horizontalInterval: data.maxY / 3,
            getDrawingHorizontalLine: (_) => FlLine(
              color: AppColors.border.withValues(alpha: 0.6),
              strokeWidth: 1,
              dashArray: [6, 6],
            ),
          ),
          titlesData: FlTitlesData(
            topTitles: noTitles,
            rightTitles: noTitles,
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 52,
                interval: data.maxY / 3,
                getTitlesWidget: (value, meta) =>
                    Text(Formatters.compact(value), style: labelStyle),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 36,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= data.labels.length)return SizedBox();
                  return Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(data.labels[index], style: labelStyle),
                  );
                },
              ),
            ),
          ),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) => Colors.white,
              getTooltipItems: (spots) => spots
                  .map(
                    (spot) => LineTooltipItem(
                      Formatters.compact(spot.y),
                      TextStyle(
                        color: AppColors.navy,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                for (var i = 0; i < data.values.length; i++)
                  FlSpot(i.toDouble(), data.values[i]),
              ],
              isCurved: true,
              color: AppColors.primary,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.18),
                    AppColors.primary.withValues(alpha: 0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

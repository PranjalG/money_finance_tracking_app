import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SavingsSpendingBarChart extends StatelessWidget {
  final List<double> data = [50, -30, 20, -10, 56, -20, -40, 10, -30, 22, 32, -14];

  SavingsSpendingBarChart({super.key}); // + = spend more, - = save more

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false, reservedSize: 40),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false, reservedSize: 40),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false, reservedSize: 40),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: false,
                  // getTitlesWidget: (value, meta) {
                  //   const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
                  //   if (value.toInt() >= 0 && value.toInt() < days.length) {
                  //     return Text(days[value.toInt()]);
                  //   }
                  //   return const SizedBox();
                  // },
                  ),
            ),
          ),
          barGroups: List.generate(data.length, (index) {
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: data[index],
                  color: data[index] >= 0
                      ? const Color(0xFF2D99FF)
                      : const Color(0xFFA5F3FF),
                  width: 10,
                  borderRadius: data[index] >= 0
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        )
                      : const BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                  fromY: 0,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

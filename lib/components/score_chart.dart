import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScoreChart extends StatelessWidget {
  const ScoreChart({super.key});

  // TODO: value will be replaced with scores as percentages
  @override
  Widget build(BuildContext context) {
    return PieChart(
      swapAnimationDuration: const Duration(milliseconds: 400), // Optional
      swapAnimationCurve: Curves.easeInOut,
      PieChartData(
        centerSpaceRadius: 80,
        sections: [
          PieChartSectionData(
            color: Colors.red,
            value: 25,
            radius: 50,
            titleStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF313638),
            ),
          ),
          PieChartSectionData(
            color: Colors.yellow,
            value: 25,
            radius: 50,
            titleStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF313638),
            ),
          ),
          PieChartSectionData(
            color: Colors.green,
            value: 50,
            radius: 50,
            titleStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF313638),
            ),
          ),
        ],
      ),
    );
  }
}

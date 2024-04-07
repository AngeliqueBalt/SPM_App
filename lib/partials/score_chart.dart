import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/async_builder.dart';
import 'package:student_progress_monitor_app/models/report.dart';
import 'package:student_progress_monitor_app/providers/report_provider.dart';

/// This widget displays a pie chart that shows the scores of a student.

class ScoreChart extends StatefulWidget {
  final String quizId;

  const ScoreChart({super.key, required this.quizId});

  @override
  State<ScoreChart> createState() => _ScoreChartState();
}

class _ScoreChartState extends State<ScoreChart> {
  final pieChartKey = UniqueKey();

  @override
  Widget build(final BuildContext context) {
    return AsyncBuilder(
      selector: (final ref) => ref.watch(reportProvider(widget.quizId)),
      builder: (final context, final report) {
        if (report != null) {
          return PieChart(
            key: pieChartKey,
            swapAnimationDuration:
                const Duration(milliseconds: 100), // Optional
            swapAnimationCurve: Curves.fastEaseInToSlowEaseOut,
            PieChartData(
              centerSpaceRadius: 60,
              sections: [
                for (final bucket in report.buckets) createSection(bucket),
              ],
            ),
          );
        } else {
          return const Text("Not enough submissions");
        }
      },
    );
  }

  PieChartSectionData createSection(final Bucket bucket) {
    return PieChartSectionData(
      showTitle: false,
      color: const Color(0xFF15803D),
      value: bucket.proportion,
      radius: 65,
      badgePositionPercentageOffset: 0.5,
      badgeWidget: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF15803D),
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Text(
          "${bucket.minScore}% – ${bucket.maxScore}%",
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: -0.5,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/async_builder.dart';
import 'package:student_progress_monitor_app/models/report.dart';
import 'package:student_progress_monitor_app/providers/report_provider.dart';

/// This widget displays a pie chart that shows the scores of a student.

enum SectionType {
  bottom(color: Color(0xFFB91C1C)),
  neutral(color: Color(0xFF0369A1)),
  top(color: Color(0xFF15803D));

  final Color color;

  const SectionType({required this.color});

  static SectionType fromIndex(final int i, final int length) {
    if (length >= 2) {
      if (i == 0) return SectionType.bottom;
      if (i == length - 1) return SectionType.top;
    }

    return SectionType.neutral;
  }
}

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
                for (final (i, bucket) in report.buckets.indexed)
                  createSection(
                      bucket, SectionType.fromIndex(i, report.buckets.length)),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text(
              "Not enough submissions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          );
        }
      },
    );
  }

  PieChartSectionData createSection(
      final Bucket bucket, final SectionType type) {
    return PieChartSectionData(
      showTitle: false,
      color: type.color,
      value: bucket.proportion,
      radius: 65,
      badgePositionPercentageOffset: 0.5,
      badgeWidget: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: type.color,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Text(
          bucket.minScore == bucket.maxScore
              ? "${bucket.maxScore}%"
              : "${bucket.minScore}% – ${bucket.maxScore}%",
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

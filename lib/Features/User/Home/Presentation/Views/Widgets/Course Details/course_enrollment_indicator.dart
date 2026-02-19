import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class CourseEnrollmentIndicator extends StatelessWidget {
  const CourseEnrollmentIndicator({
    super.key,
    this.current,
    required this.max,
  });

  final int? current;
  final int max;

  @override
  Widget build(BuildContext context) {
    final double percentage = (current ?? 0) / max;
    Color statusColor = getStatusColor(percentage);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            getStatusText(context, percentage),
            style: AppText.style12Bold(context).copyWith(
              color: statusColor,
              fontSize: 11,
            ),
          ),
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey.withValues(
              alpha: 0.3,
            ),
            color: statusColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
    );
  }

  Color getStatusColor(double percentage) {
    return percentage > 0.8
        ? Colors.red
        : percentage > 0.5
            ? Colors.orange
            : Colors.green;
  }

  String getStatusText(BuildContext context, double percentage) {
    return percentage == 1
        ? S.of(context).enrollmentFull
        : percentage > 0.8
            ? S.of(context).enrollmentAlmostFull
            : percentage > 0.5
                ? S.of(context).enrollmentFillingUp
                : S.of(context).enrollmentSpotsAvailable;
  }
}

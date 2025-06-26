import 'package:flutter/material.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class CourseEnrollmentCounter extends StatelessWidget {
  const CourseEnrollmentCounter({
    super.key,
    required this.maxStudents,
    required this.currentStudents,
  });

  final int maxStudents;
  final int? currentStudents;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        const Icon(
          Icons.people,
          size: 16,
          color: Colors.grey,
        ),
        Text(
          '${AppDates.formatLocalizedNumber(currentStudents ?? 0, context)}/${AppDates.formatLocalizedNumber(maxStudents, context)} ${S.of(context).Student}',
          style: AppText.style14Regular(context).copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class AdminCourseMetaInfo extends StatelessWidget {
  const AdminCourseMetaInfo({
    super.key,
    required this.course,
    this.showDuration = true,
    this.customStatus,
  });

  final CourseModel course;
  final bool showDuration;
  final String? customStatus;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final metaTextColor = isDarkMode ? Colors.grey[400] : Colors.grey[600];

    return Row(
      children: [
        // Student Count
        Icon(
          Icons.person_outline,
          size: 16,
          color: metaTextColor,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            '${AppDates.formatLocalizedNumber(course.currentStudents ?? 0, context)}/${AppDates.formatLocalizedNumber(course.maxAcceptedStudents, context)} ${S.of(context).Student}',
            style: AppText.style12Regular(context).copyWith(
              color: metaTextColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        if (showDuration) ...[
          const SizedBox(width: 8.0),
          // Duration/Status
          Icon(
            Icons.schedule_outlined,
            size: 16,
            color: metaTextColor,
          ),
          const SizedBox(width: 4),
          Text(
            customStatus ?? 'Active',
            style: AppText.style12Regular(context).copyWith(
              color: metaTextColor,
            ),
          ),
        ],
      ],
    );
  }
}

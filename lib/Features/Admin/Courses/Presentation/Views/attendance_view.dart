import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({
    super.key,
    required this.student,
    required this.course,
  });

  final StudentModel student;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return OverlayBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            const CircleAvatar(),
            Text(
              student.name!,
              style: AppText.style18Bold(context),
            ),
            Text(
              S.of(context).totalDays(
                  AppDates.formatLocalizedNumber(countDays(), context)),
              style: AppText.style16Bold(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).attendedDays(AppDates.formatLocalizedNumber(
                      student.attendanceDates?.length ?? 0, context)),
                  style: AppText.style16Bold(context),
                ),
                Text(
                  S.of(context).absentDays(AppDates.formatLocalizedNumber(
                      student.absenceDates?.length ?? 0, context)),
                  style: AppText.style16Bold(context),
                ),
              ],
            ),
            Text(
              S.of(context).absenceDaysTitle,
              style: AppText.style16Bold(context),
            ),
            Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var date in student.absenceDates ?? [])
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      const Icon(
                        Icons.close,
                      ),
                      Text(
                        AppDates.timeStampToString(date),
                        style: AppText.style16Bold(context),
                      ),
                    ],
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  int countDays() {
    int attend = student.attendanceDates?.length ?? 0;
    int absent = student.absenceDates?.length ?? 0;
    return attend + absent;
  }
}

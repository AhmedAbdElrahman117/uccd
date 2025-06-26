import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_stat_item.dart';
import 'package:uccd/generated/l10n.dart';

class CourseStats extends StatelessWidget {
  const CourseStats({
    super.key,
    required this.course,
  });

  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CourseStatItem(
            icon: Icons.access_time,
            value: S.of(context).courseStatsDurationValue(
                  AppDates.formatLocalizedNumber(
                    course.duration,
                    context,
                  ),
                ),
            label: S.of(context).courseStatsDuration,
          ),
          CourseStatItem(
            icon: Icons.meeting_room,
            value: AppDates.formatLocalizedNumber(course.roomNumber, context),
            label: S.of(context).courseStatsRoom,
          ),
          CourseStatItem(
            icon: Icons.calendar_today,
            value: S.of(context).courseStatsLengthValue(
                  _getWeeksDuration(context),
                ),
            label: S.of(context).courseStatsLength,
          ),
          CourseStatItem(
            icon: FontAwesomeIcons.bookOpenReader,
            value: course.coursePrerequests?.length.toString() ??
                AppDates.formatLocalizedNumber(0, context),
            label: S.of(context).courseStatsPrerequisites.split(' ')[0],
          ),
        ],
      ),
    );
  }

  String _getWeeksDuration(BuildContext context) {
    final start = course.courseStartDate.toDate();
    final end = course.courseEndDate.toDate();
    final difference = end.difference(start).inDays;
    return AppDates.formatLocalizedNumber(
      (difference / 7).ceil(),
      context,
    );
  }
}

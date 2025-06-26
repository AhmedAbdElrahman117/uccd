import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_section_title.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/course_details.dart';
import 'package:uccd/generated/l10n.dart';

class CourseSchedule extends StatelessWidget {
  const CourseSchedule({
    super.key,
    required this.isDarkMode,
    required this.courseStartDate,
    required this.courseEndDate,
    required this.interviewStartDate,
    required this.interviewEndDate,
    required this.roomNumber,
    required this.duration,
    required this.tags,
  });

  final bool isDarkMode;
  final Timestamp courseStartDate;
  final Timestamp courseEndDate;
  final Timestamp interviewStartDate;
  final Timestamp interviewEndDate;
  final int roomNumber;
  final int duration;
  final Map<String, String> tags;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      allPadding: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          CourseSectionTitle(
            title: S.of(context).courseScheduleTitle,
            icon: Icons.calendar_today,
          ),
          CourseDetails(
            isDarkMode: isDarkMode,
            courseEndDate: courseEndDate,
            courseStartDate: courseStartDate,
            duration: duration,
            interviewEndDate: interviewEndDate,
            interviewStartDate: interviewStartDate,
            roomNumber: roomNumber,
            tags: tags,
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_section_background.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_section_title.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/timeline_item.dart';
import 'package:uccd/generated/l10n.dart';

enum TimelineStatus {
  upcoming,
  active,
  completed,
}

class CourseTimeline extends StatelessWidget {
  const CourseTimeline({
    super.key,
    required this.isDarkMode,
    required this.courseStartDate,
    required this.courseEndDate,
    required this.interviewStartDate,
    required this.interviewEndDate,
    required this.course,
  });

  final bool isDarkMode;
  final Timestamp courseStartDate;
  final Timestamp courseEndDate;
  final Timestamp interviewStartDate;
  final Timestamp interviewEndDate;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      allPadding: 16,
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseSectionTitle(
            title: S.of(context).courseTimelineTitle,
            icon: Icons.timeline,
          ),
          CourseSectionBackground(
            child: Column(
              children: [
                TimelineItem(
                  title: S.of(context).interviewPeriodTitle,
                  subtitle: S.of(context).interviewPeriodSubtitle(
                        AppDates.timeStampToString(interviewStartDate),
                        AppDates.timeStampToString(interviewEndDate),
                      ),
                  status: checkInterviewStatus(),
                ),
                TimelineItem(
                  title: S.of(context).coursePeriodTitle,
                  subtitle: S.of(context).coursePeriodSubtitle(
                        AppDates.timeStampToString(courseStartDate),
                        AppDates.timeStampToString(courseEndDate),
                      ),
                  status: checkCourseStatus(),
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TimelineStatus checkInterviewStatus() {
    final now = DateTime.now();
    final interviewStarted = now.isAfter(course.interviewStartDate.toDate());
    final interviewEnded = now.isAfter(course.interviewEndDate.toDate());

    return interviewStarted && !interviewEnded
        ? TimelineStatus.active
        : interviewEnded
            ? TimelineStatus.completed
            : TimelineStatus.upcoming;
  }

  TimelineStatus checkCourseStatus() {
    final now = DateTime.now();
    final courseStarted = now.isAfter(course.courseStartDate.toDate());
    final courseEnded = now.isAfter(course.courseEndDate.toDate());

    return courseStarted && !courseEnded
        ? TimelineStatus.active
        : courseEnded
            ? TimelineStatus.completed
            : TimelineStatus.upcoming;
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_enrollment_indicator.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/students_counter.dart';

class CourseEnrollments extends StatelessWidget {
  const CourseEnrollments({
    super.key,
    required this.currentStudents,
    required this.maxAcceptedStudents,
  });

  final int? currentStudents;
  final int maxAcceptedStudents;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          CourseEnrollmentCounter(
            currentStudents: currentStudents,
            maxStudents: maxAcceptedStudents,
          ),
          Expanded(
            child: CourseEnrollmentIndicator(
              current: currentStudents,
              max: maxAcceptedStudents,
            ),
          ),
        ],
      ),
    );
  }
}

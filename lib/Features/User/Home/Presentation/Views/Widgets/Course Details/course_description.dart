import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_section_background.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_section_title.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/course_description_and_learning.dart';
import 'package:uccd/generated/l10n.dart';

class CourseDescription extends StatelessWidget {
  const CourseDescription({
    super.key,
    required this.isDarkMode,
    required this.description,
    required this.goals,
  });

  final bool isDarkMode;
  final String description;
  final List<dynamic> goals;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      allPadding: 16,
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseSectionTitle(
            title: S.of(context).aboutThisCourseTitle,
            icon: Icons.description,
          ),
          CourseSectionBackground(
            child: CourseDescriptionAndLearning(
              description: description,
              goals: goals,
            ),
          ),
        ],
      ),
    );
  }
}

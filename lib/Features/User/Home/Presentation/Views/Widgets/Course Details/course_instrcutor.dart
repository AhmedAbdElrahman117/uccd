import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_section_title.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/instrcutor_details_tile.dart';
import 'package:uccd/generated/l10n.dart';

class CourseInstrcutor extends StatelessWidget {
  const CourseInstrcutor({
    super.key,
    required this.isDarkMode,
    required this.course,
  });

  final bool isDarkMode;
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
            title: S.of(context).instructorTitle,
            icon: Icons.person,
          ),
          InstrcutorDetailsTile(
            isDarkMode: isDarkMode,
            course: course,
          ),
        ],
      ),
    );
  }
}

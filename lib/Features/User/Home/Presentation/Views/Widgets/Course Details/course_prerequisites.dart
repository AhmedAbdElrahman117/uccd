import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_section_background.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_section_title.dart';
import 'package:uccd/generated/l10n.dart';

class CoursePrerequisites extends StatelessWidget {
  const CoursePrerequisites({
    super.key,
    required this.prerequisites,
  });

  final List<String> prerequisites;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      allPadding: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          CourseSectionTitle(
            title: S.of(context).SkillsAndPrerequisites,
            icon: Icons.assignment,
          ),
          CourseSectionBackground(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: prerequisites
                  .map(
                    (prereq) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: CourseSectionTitle(
                        title: prereq,
                        icon: Icons.check_circle,
                        iconColor: Colors.green,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_related_card.dart';
import 'package:uccd/generated/l10n.dart';

class CourseRelated extends StatelessWidget {
  const CourseRelated({
    super.key,
    required this.relatedCourses,
  });

  final List<Map<String, dynamic>> relatedCourses;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      allPadding: 16,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              const Icon(
                Icons.explore,
                color: AppColor.primary,
                size: 18,
              ),
              Text(
                S.of(context).relatedCoursesTitle,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: relatedCourses.length,
              itemBuilder: (context, index) {
                return CourseRelatedCard(
                  course: relatedCourses[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

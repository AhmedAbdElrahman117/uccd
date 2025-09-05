import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/course_learnings_section.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/item_description.dart';

class CourseDescriptionAndLearning extends StatelessWidget {
  const CourseDescriptionAndLearning({
    super.key,
    required this.description,
    required this.goals,
  });

  final String description;
  final List<dynamic>? goals;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      allPadding: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          CourseLearningsSection(
            goals: goals,
          ),
          ItemDescription(
            description: description,
          ),
        ],
      ),
    );
  }
}

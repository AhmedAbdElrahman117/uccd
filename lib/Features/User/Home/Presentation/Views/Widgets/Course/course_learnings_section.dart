import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/course_learnings_list.dart';

class CourseLearningsSection extends StatelessWidget {
  const CourseLearningsSection({
    super.key,
    this.goals,
  });

  final List<dynamic>? goals;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: goals != null && goals!.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              'What you\'ill learn:',
              style: AppText.style22Bold(context),
            ),
            CourseLearningsList(
              goals: goals,
            ),
          ],
        ),
      ),
    );
  }
}

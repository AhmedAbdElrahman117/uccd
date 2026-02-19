import 'package:flutter/material.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_section_title.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/course_learnings_list.dart';
import 'package:uccd/generated/l10n.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseSectionTitle(
            title: S.of(context).WhatYouWillLearn,
            icon: Icons.school,
          ),
          const SizedBox(height: 16),
          CourseLearningsList(
            goals: goals,
          ),
        ],
      ),
    );
  }
}

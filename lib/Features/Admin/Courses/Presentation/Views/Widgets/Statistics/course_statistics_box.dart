import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/statistics_box.dart';
import 'package:uccd/generated/l10n.dart';

class CourseStatisticsBox extends StatelessWidget {
  const CourseStatisticsBox({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: StatisticsBox(
        colors: const [
          Colors.deepPurple,
          Colors.blueAccent,
          Colors.deepOrange,
        ],
        sectionTitle: S.of(context).course,
        sections: data,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/statistics_box.dart';

class CourseStatisticsBox extends StatelessWidget {
  const CourseStatisticsBox({
    super.key,
    required this.data,
  });

  final Map<String, num> data;

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
        sectionTitle: 'Course',
        sections: data,
      ),
    );
  }
}

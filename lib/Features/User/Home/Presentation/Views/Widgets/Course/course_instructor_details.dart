import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/app_text.dart';

class CourseInstructorDetails extends StatelessWidget {
  const CourseInstructorDetails({
    super.key,
    required this.instructorName,
  });

  final String instructorName;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      horizontalPadding: 16,
      verticalPadding: 8,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.amber,
        ),
        title: Text(
          'Instructor',
          style: AppText.style16Bold(context),
        ),
        subtitle: Text(
          'Dr\\$instructorName',
          style: AppText.style14Bold(context),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/course_ratings_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/course_students_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/course_statisitcs_button.dart';

class AdminArchiveCourseMenu extends StatelessWidget {
  const AdminArchiveCourseMenu({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return OverlayBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          Text(
            'Panel',
            style: AppText.style20Bold(context),
          ),
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              mainAxisExtent: 120,
            ),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              CourseStatisitcsButton(
                course: course,
              ),
              CourseStudnetsButton(
                course: course,
              ),
              CourseRatingsButton(
                course: course,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

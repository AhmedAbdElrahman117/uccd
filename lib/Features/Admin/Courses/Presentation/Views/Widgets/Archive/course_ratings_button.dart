import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_course_ratings_view.dart';

class CourseRatingsButton extends StatelessWidget {
  const CourseRatingsButton({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      icon: Icons.star,
      title: 'Ratings',
      backgroundColor: Colors.yellow.shade600,
      onTap: () async {
        await context.push(
          AdminCourseRatingsView.id,
          extra: course,
        );
      },
    );
  }
}

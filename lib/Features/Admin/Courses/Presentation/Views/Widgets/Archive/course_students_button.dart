import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_archive_students_view.dart';

class CourseStudnetsButton extends StatelessWidget {
  const CourseStudnetsButton({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      icon: Icons.people,
      title: 'Students',
      backgroundColor: Colors.deepPurple,
      onTap: () async {
        await context.push(
          AdminArchiveStudentsView.id,
          extra: course,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/add_course_view.dart';

class CourseEditButton extends StatelessWidget {
  const CourseEditButton({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      icon: FontAwesomeIcons.penToSquare,
      title: 'Edit',
      backgroundColor: Colors.grey,
      onTap: () {
        context.push(
          AddCourseView.id,
          extra: course,
        );
      },
    );
  }
}

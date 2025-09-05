import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_fab.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/add_course_view.dart';

class AddCourseFab extends StatelessWidget {
  const AddCourseFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFab(
      onPressed: () async {
        await context.push(AddCourseView.id);
      },
    );
  }
}

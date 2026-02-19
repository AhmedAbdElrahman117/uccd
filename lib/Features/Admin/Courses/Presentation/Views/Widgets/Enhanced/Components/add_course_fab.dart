import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/add_course_view.dart';
import 'package:uccd/generated/l10n.dart';

class AddCourseFab extends StatelessWidget {
  const AddCourseFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.push(AddCourseView.id);
      },
      heroTag: null,
      backgroundColor: AppColor.primary,
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      label: Text(
        S.of(context).addCourse,
        style: AppText.style16Regular(context).copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

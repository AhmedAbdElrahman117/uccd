import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Themes/admin_menu_theme_helper.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_archive_students_view.dart';

/// Enhanced course students button with modern design and animations
class EnhancedCourseStudentsButton extends StatelessWidget {
  const EnhancedCourseStudentsButton({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return EnhancedMenuButton(
      title: S.of(context).students,
      icon: Icons.people_outline,
      type: AdminMenuButtonType.students,
      courseId: course.courseID!,
      tooltip: S.of(context).courseStudentsTooltip,
      semanticLabel: S.of(context).courseStudentsSemanticLabel(course.title),
      shortcutKey: 'Ctrl+U',
      onTap: () async {
        await context.push(
          AdminArchiveStudentsView.id,
          extra: course,
        );
      },
    );
  }
}

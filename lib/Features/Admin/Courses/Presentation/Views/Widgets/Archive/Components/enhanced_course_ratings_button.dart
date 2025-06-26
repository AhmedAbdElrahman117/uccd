import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Themes/admin_menu_theme_helper.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_course_ratings_view.dart';

/// Enhanced course ratings button with modern design and animations
class EnhancedCourseRatingsButton extends StatelessWidget {
  const EnhancedCourseRatingsButton({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return EnhancedMenuButton(
      title: S.of(context).ratings,
      icon: Icons.star_outline,
      type: AdminMenuButtonType.ratings,
      courseId: course.courseID,
      tooltip: S.of(context).courseRatingsTooltip,
      semanticLabel: S.of(context).courseRatingsSemanticLabel(course.title),
      shortcutKey: 'Ctrl+R',
      onTap: () async {
        await context.push(
          AdminCourseRatingsView.id,
          extra: course,
        );
      },
    );
  }
}

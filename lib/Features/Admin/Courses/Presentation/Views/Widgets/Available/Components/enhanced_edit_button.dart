import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Themes/admin_menu_theme_helper.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/add_course_view.dart';
import 'package:uccd/generated/l10n.dart';

/// Enhanced edit button with modern design and animations
class EnhancedEditButton extends StatelessWidget {
  const EnhancedEditButton({
    super.key,
    required this.course,
  });

  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return EnhancedMenuButton(
      title: S.of(context).editButtonTitle,
      icon: FontAwesomeIcons.penToSquare,
      type: AdminMenuButtonType.edit,
      courseId: course.courseID,
      tooltip: S.of(context).editButtonTooltip,
      semanticLabel: S.of(context).editButtonSemanticLabel(course.title),
      shortcutKey: 'Ctrl+E',
      onTap: () {
        context.push(
          AddCourseView.id,
          extra: course,
        );
      },
    );
  }
}

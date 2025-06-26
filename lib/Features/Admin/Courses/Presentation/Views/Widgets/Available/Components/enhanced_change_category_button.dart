import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Themes/admin_menu_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

/// Enhanced change category button with modern design and animations
class EnhancedChangeCategoryButton extends StatelessWidget {
  const EnhancedChangeCategoryButton({
    super.key,
    required this.course,
  });

  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return EnhancedMenuButton(
      title: S.of(context).changeCategoryButtonTitle,
      icon: Icons.category,
      type: AdminMenuButtonType.changeCategory,
      courseId: course.courseID,
      tooltip: S.of(context).changeCategoryButtonTooltip,
      semanticLabel:
          S.of(context).changeCategoryButtonSemanticLabel(course.title),
      shortcutKey: 'Ctrl+C',
      onTap: () {
        OverlayController.showChangeCategory(
          context,
          course,
        );
      },
    );
  }
}

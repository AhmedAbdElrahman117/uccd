import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Themes/admin_menu_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

/// Enhanced change instructor button with modern design and animations
class EnhancedChangeInstructorButton extends StatelessWidget {
  const EnhancedChangeInstructorButton({
    super.key,
    required this.course,
  });

  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return EnhancedMenuButton(
      title: S.of(context).changeInstructorButtonTitle,
      icon: FontAwesomeIcons.userGear,
      type: AdminMenuButtonType.changeInstructor,
      courseId: course.courseID,
      tooltip: S.of(context).changeInstructorButtonTooltip,
      semanticLabel:
          S.of(context).changeInstructorButtonSemanticLabel(course.title),
      shortcutKey: 'Ctrl+T',
      onTap: () {
        OverlayController.showChangeInstructor(
          context,
          course,
        );
      },
    );
  }
}

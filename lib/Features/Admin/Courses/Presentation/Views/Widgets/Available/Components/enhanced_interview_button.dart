import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Themes/admin_menu_theme_helper.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/interview_view.dart';
import 'package:uccd/generated/l10n.dart';

/// Enhanced interview button with modern design and animations
class EnhancedInterviewButton extends StatelessWidget {
  const EnhancedInterviewButton({
    super.key,
    required this.course,
  });

  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return EnhancedMenuButton(
      title: S.of(context).interviewButtonTitle,
      icon: FontAwesomeIcons.userCheck,
      type: AdminMenuButtonType.interview,
      courseId: course.courseID,
      tooltip: S.of(context).interviewButtonTooltip,
      semanticLabel: S.of(context).interviewButtonSemanticLabel(course.title),
      shortcutKey: 'Ctrl+I',
      onTap: () async {
        await context.push(
          InterviewView.id,
          extra: course,
        );
      },
    );
  }
}

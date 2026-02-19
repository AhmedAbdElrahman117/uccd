import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Themes/admin_menu_theme_helper.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/statistics_view.dart';
import 'package:uccd/generated/l10n.dart';

/// Enhanced statistics button with modern design and animations
class EnhancedStatisticsButton extends StatelessWidget {
  const EnhancedStatisticsButton({
    super.key,
    required this.course,
  });

  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return EnhancedMenuButton(
      title: S.of(context).statisticsButtonTitle,
      icon: FontAwesomeIcons.chartLine,
      type: AdminMenuButtonType.statistics,
      courseId: course.courseID,
      tooltip: S.of(context).statisticsButtonTooltip,
      semanticLabel: S.of(context).statisticsButtonSemanticLabel(course.title),
      shortcutKey: 'Ctrl+S',
      onTap: () async {
        await context.push(
          StatisticsView.id,
          extra: course,
        );
      },
    );
  }
}

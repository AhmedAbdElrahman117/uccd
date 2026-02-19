import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Themes/admin_menu_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

/// Enhanced delete button with modern design and animations
class EnhancedDeleteButton extends StatelessWidget {
  const EnhancedDeleteButton({
    super.key,
    required this.course,
  });

  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return EnhancedMenuButton(
      title: S.of(context).deleteButtonTitle,
      icon: Icons.delete_outline,
      type: AdminMenuButtonType.delete,
      courseId: course.courseID,
      tooltip: S.of(context).deleteButtonTooltip,
      semanticLabel: S.of(context).deleteButtonSemanticLabel(course.title),
      shortcutKey: 'Del',
      onTap: () {
        OverlayController.showDeleteDialog(
          context,
          message: S.of(context).deleteCourseConfirmMessage(course.title),
          onConfirm: () {
            context.pop();
            BlocProvider.of<AvailableCourseCubit>(context).delete(
              course: course,
            );
          },
        );
      },
    );
  }
}

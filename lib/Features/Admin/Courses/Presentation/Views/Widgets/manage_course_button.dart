import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/generated/l10n.dart';

/// A modern action button for admin course management
/// Provides a consistent UI for course management actions
class ManageCourseButton extends StatelessWidget {
  const ManageCourseButton({
    super.key,
    required this.course,
    this.onPressed,
    this.actionText = 'Manage Course',
    this.actionIcon = Icons.settings_outlined,
  });

  final CourseModel course;
  final VoidCallback? onPressed;
  final String actionText;
  final IconData actionIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppColor.primary.withValues(alpha: 0.3),
          width: 1.0,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onPressed ??
              () {
                OverlayController.showAvailableCourseMenu(
                  context,
                  course,
                );
              },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  actionIcon,
                  size: 18,
                  color: AppColor.primary,
                ),
                const SizedBox(width: 8.0),
                Text(
                  S.of(context).ManageCourses,
                  style: AppText.style14Bold(context).copyWith(
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

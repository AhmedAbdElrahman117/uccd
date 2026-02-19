import 'package:flutter/material.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course_button.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.message,
    required this.onTapConfirm,
  });

  final String message;
  final void Function() onTapConfirm;

  @override
  Widget build(BuildContext context) {
    return AdminCourseButton(
      icon: Icons.delete,
      backgroundColor: Colors.redAccent.shade700,
      title: 'Delete',
      onPressed: () {
        OverlayController.showDeleteDialog(
          context,
          message: message,
          onConfirm: onTapConfirm,
        );
      },
    );
  }
}

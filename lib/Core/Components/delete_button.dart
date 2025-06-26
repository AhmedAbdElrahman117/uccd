import 'package:flutter/material.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course_button.dart';
import 'package:uccd/generated/l10n.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.message,
    required this.onTapConfirm,
    this.image,
    this.confirmIcon,
  });

  final String message;
  final String? image;
  final void Function() onTapConfirm;
  final Icon? confirmIcon;

  @override
  Widget build(BuildContext context) {
    return AdminCourseButton(
      icon: Icons.delete,
      backgroundColor: Colors.redAccent.shade700,
      title: S.of(context).delete,
      onPressed: () {
        OverlayController.showDeleteDialog(
          context,
          message: message,
          image: image,
          onConfirm: onTapConfirm,
          confirmIcon: confirmIcon,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course_button.dart';
import 'package:uccd/generated/l10n.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AdminCourseButton(
      icon: Icons.edit,
      backgroundColor: Colors.grey,
      title: S.of(context).edit,
      onPressed: onPressed,
    );
  }
}

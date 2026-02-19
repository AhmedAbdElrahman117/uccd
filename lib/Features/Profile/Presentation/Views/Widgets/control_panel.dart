import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/delete_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/edit_button.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.deleteMessage,
    this.image,
    this.confirmIcon,
  });

  final void Function() onEdit;
  final void Function() onDelete;
  final String? image;
  final String deleteMessage;
  final Icon? confirmIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EditButton(
          onPressed: onEdit,
        ),
        DeleteButton(
          message: deleteMessage,
          image: image,
          onTapConfirm: onDelete,
          confirmIcon: confirmIcon,
        ),
      ],
    );
  }
}

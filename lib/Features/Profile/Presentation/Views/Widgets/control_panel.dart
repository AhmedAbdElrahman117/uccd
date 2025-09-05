import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/delete_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/edit_button.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.deleteMessage,
  });

  final void Function() onEdit;
  final void Function() onDelete;
  final String deleteMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: EditButton(
            onPressed: onEdit,
          ),
        ),
        Expanded(
          child: DeleteButton(
            message: deleteMessage,
            onTapConfirm: onDelete,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/generated/l10n.dart';

class PostOptions extends StatelessWidget {
  const PostOptions({
    super.key,
    required this.textColor,
    required this.onDelete,
    required this.post,
  });

  final Color textColor;
  final VoidCallback onDelete;
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        color: textColor,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 'edit',
            child: Row(
              children: [
                const Icon(Icons.edit, size: 20),
                const SizedBox(width: 8),
                Text(S.of(context).editPostOption),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Row(
              spacing: 8,
              children: [
                const Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.red,
                ),
                Text(
                  S.of(context).deletePostOption,
                  style: AppText.style14Regular(context).copyWith(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      onSelected: (value) {
        if (value == 'delete') {
          OverlayController.confirmDelete(
            context,
            onDelete: onDelete,
          );
        } else if (value == 'edit') {
          OverlayController.showEditDialog(
            context,
            post,
          );
        }
      },
    );
  }
}

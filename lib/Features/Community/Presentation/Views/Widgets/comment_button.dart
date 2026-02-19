import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Community/Presentation/Views/comments_view.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        onPressed: () async {
          await context.push(
            CommentsView.id,
            extra: post,
          );
        },
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 14,
          children: [
            Icon(
              Icons.comment_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            Text(
              'Comment (${post.commentsCount})',
              style: AppText.style16Bold(context),
            ),
          ],
        ),
        style: IconButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

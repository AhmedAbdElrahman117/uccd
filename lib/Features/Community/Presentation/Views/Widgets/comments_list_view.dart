import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/comment_model.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comment.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    super.key,
    required this.comments,
  });

  final List<CommentModel> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Comment(
          comment: comments[index],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/comment_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.comment,
  });

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        const Column(
          children: [
            CircleAvatar(),
          ],
        ),
        Expanded(
          child: AdaptiveContainer(
            allPadding: 8,
            child: ListTile(
              title: Text(
                comment.userName,
                style: AppText.style16Bold(context),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 14,
                children: [
                  Text(
                    comment.comment,
                    style: AppText.style14Regular(context),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      AppDates.postFormat(
                        comment.commentAt!,
                      ),
                      style: AppText.style14Regular(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

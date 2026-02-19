import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/comment_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.comment,
    required this.cardColor,
    required this.textColor,
    required this.subTextColor,
  });

  final CommentModel comment;
  final Color cardColor;
  final Color textColor;
  final Color subTextColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.primary.withValues(alpha: 0.65),
                width: 1,
              ),
            ),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColor.primary.withValues(alpha: 0.2),
              child: Text(
                comment.userName[0].toUpperCase(),
                style: AppText.style14Bold(context).copyWith(
                  color: AppColor.primary,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        comment.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      Text(
                        comment.comment,
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    AppDates.postFormat(comment.commentAt!),
                    style: AppText.style12Regular(context).copyWith(
                      color: subTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

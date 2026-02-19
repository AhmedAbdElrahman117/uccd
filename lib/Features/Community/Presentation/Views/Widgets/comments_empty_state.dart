import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class CommentsEmptyState extends StatelessWidget {
  const CommentsEmptyState({
    super.key,
    required this.textColor,
  });

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 64,
              color: textColor.withValues(alpha: 0.5),
            ),
            Text(
              S.of(context).noCommentsYet,
              style: AppText.style16Bold(context).copyWith(
                color: textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              S.of(context).beFirstToComment,
              style: AppText.style14Regular(context).copyWith(
                color: textColor.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

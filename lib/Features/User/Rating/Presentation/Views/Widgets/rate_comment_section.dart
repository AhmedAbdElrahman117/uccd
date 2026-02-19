import 'package:flutter/material.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/card_container.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/rate_comment_text_field.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/rate_view_header.dart';

class RateCommentSection extends StatelessWidget {
  const RateCommentSection({
    super.key,
    required this.commentController,
  });

  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RateViewHeader(
            icon: Icons.comment_rounded,
            title: 'Additional Comments',
          ),
          const SizedBox(height: 12),
          RateCommentTextField(
            controller: commentController,
          ),
        ],
      ),
    );
  }
}

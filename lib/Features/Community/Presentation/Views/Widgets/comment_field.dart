import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/add_comment_button.dart';

class CommentField extends StatefulWidget {
  const CommentField({
    super.key,
    required this.postID,
  });

  final String postID;

  @override
  State<CommentField> createState() => _CommentFieldState();
}

class _CommentFieldState extends State<CommentField> {
  final TextEditingController commentController = TextEditingController();
  final GlobalKey<FormState> commentsKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      allPadding: 4,
      topLeftRadius: 0,
      topRightRadius: 0,
      child: Form(
        key: commentsKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: CustomTextField(
            textController: commentController,
            label: 'Write a Comment',
            hint: 'Write a Public Comment',
            maxLines: null,
            keyboardType: TextInputType.multiline,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Comment Required';
              }
              return null;
            },
            suffix: AddCommentButton(
              commentController: commentController,
              commentsKey: commentsKey,
              postID: widget.postID,
            ),
          ),
        ),
      ),
    );
  }
}

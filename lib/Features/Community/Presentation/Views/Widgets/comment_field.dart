import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Comments%20Cubit/comment_cubit.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Comments%20Cubit/comment_states.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/add_comment_button.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comment_field_avatar.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comment_text_field.dart';

class CommentField extends StatelessWidget {
  const CommentField({
    super.key,
    required this.commentController,
    required this.commentCubit,
    required this.cardColor,
    required this.textColor,
    required this.isDarkMode,
    required this.formKey,
  });

  final TextEditingController commentController;
  final CommentCubit commentCubit;
  final Color cardColor;
  final Color textColor;
  final bool isDarkMode;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentStates>(
      buildWhen: (previous, current) {
        return current is CommentLoading ||
            current is CommentSuccess ||
            current is CommentFailed ||
            (previous is CommentLoading &&
                (current is! CommentLoading &&
                    current is! CommentSuccess &&
                    current is! CommentFailed));
      },
      builder: (context, state) {
        final isLoading = state is CommentLoading;
        return Container(
          padding: const EdgeInsets.all(12),
          color: cardColor,
          child: Row(
            spacing: 12,
            children: [
              const CommentFieldAvatar(),
              Expanded(
                child: CommentTextField(
                  commentController: commentController,
                  isLoading: isLoading,
                  textColor: textColor,
                  isDarkMode: isDarkMode,
                ),
              ),
              AddCommentButton(
                isLoading: isLoading,
                formKey: formKey,
                commentCubit: commentCubit,
                commentController: commentController,
              ),
            ],
          ),
        );
      },
    );
  }
}

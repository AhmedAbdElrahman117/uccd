import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/comment_model.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Comments%20Cubit/comment_cubit.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Comments%20Cubit/comment_states.dart';
import 'package:uccd/main.dart';

class AddCommentButton extends StatelessWidget {
  const AddCommentButton({
    super.key,
    required this.commentController,
    required this.commentsKey,
    required this.postID,
  });

  final TextEditingController commentController;
  final GlobalKey<FormState> commentsKey;
  final String postID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentCubit, CommentStates>(
      listener: (context, state) {
        if (state is CommentSuccess) {
          commentController.clear();
        }
      },
      builder: (context, state) {
        return IconButton(
          onPressed: state is CommentLoading
              ? null
              : () {
                  if (commentsKey.currentState!.validate()) {
                    CommentModel comment = CommentModel(
                      userName: InternalStorage.getString('name'),
                      comment: commentController.text,
                    );
                    BlocProvider.of<CommentCubit>(context).comment(
                      comment: comment,
                    );
                  }
                },
          icon: Icon(
            Icons.send,
            color: state is CommentLoading ? Colors.grey : Colors.white,
          ),
        );
      },
    );
  }
}

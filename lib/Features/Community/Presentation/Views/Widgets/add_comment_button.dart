import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/comment_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Comments%20Cubit/comment_cubit.dart';
import 'package:uccd/main.dart';

class AddCommentButton extends StatelessWidget {
  const AddCommentButton({
    super.key,
    required this.isLoading,
    required this.formKey,
    required this.commentCubit,
    required this.commentController,
  });

  final bool isLoading;
  final GlobalKey<FormState> formKey;
  final CommentCubit commentCubit;
  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.primary,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        onTap: isLoading
            ? null
            : () {
                if (formKey.currentState?.validate() ?? false) {
                  commentCubit.comment(
                    comment: CommentModel(
                      userName: InternalStorage.getString('name'),
                      comment: commentController.text.trim(),
                      commentAt: Timestamp.now(),
                    ),
                  );
                }
              },
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 24,
                ),
        ),
      ),
    );
  }
}

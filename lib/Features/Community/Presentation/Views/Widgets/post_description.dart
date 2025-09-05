import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_text.dart';

class PostDescription extends StatelessWidget {
  const PostDescription({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: post.postImageLink != null ? 16 : 0,
      ),
      child: Text(
        post.postDescription,
        style: AppText.style14Regular(context),
      ),
    );
  }
}

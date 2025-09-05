import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comment_button.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/like_button.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/post_description.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/post_image.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/post_publisher_info.dart';

class CommunityPost extends StatefulWidget {
  const CommunityPost({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  State<CommunityPost> createState() => _CommunityPostState();
}

class _CommunityPostState extends State<CommunityPost> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      verticalPadding: 8,
      horizontalPadding: 14,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostPublisherInfo(
            post: widget.post,
          ),
          PostDescription(
            post: widget.post,
          ),
          Visibility(
            visible: widget.post.postImageLink != null,
            replacement: const SizedBox(),
            child: PostImage(
              image: widget.post.postImageLink,
            ),
          ),
          Row(
            children: [
              CommentButton(post: widget.post),
              LikeButton(post: widget.post),
            ],
          ),
        ],
      ),
    );
  }
}

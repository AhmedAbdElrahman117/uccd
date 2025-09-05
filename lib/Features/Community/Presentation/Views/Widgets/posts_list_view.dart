import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/community_post.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({
    super.key,
    required this.posts,
  });

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: CommunityPost(
            key: ValueKey('post$index'),
            post: posts[index],
          ),
        );
      },
    );
  }
}

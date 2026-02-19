import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/post_controls.dart';
import 'package:uccd/main.dart';

class PostPublisherInfo extends StatelessWidget {
  const PostPublisherInfo({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          post.publisherImage ?? AppAssets.imagesUCCDGrouplogo2,
        ),
      ),
      title: Text(
        post.publisherName,
        style: AppText.style16Bold(context),
      ),
      subtitle: Text(
        AppDates.postFormat(
          post.publishedAt!,
        ),
      ),
      trailing: Visibility(
        visible: InternalStorage.getString('role') == 'Admin',
        child: PostControls(post: post),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}

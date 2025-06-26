import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/Components/cached_image.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Community%20Cubit/community_cubit.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comment_button.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/like_button.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/post_options.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/publisher_logo.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/main.dart';

class CommunityPostCard extends StatelessWidget {
  final PostModel post;
  final VoidCallback onDelete;
  final VoidCallback onLike;
  final bool isDarkMode;
  final CommunityCubit communityCubit;

  const CommunityPostCard({
    super.key,
    required this.post,
    required this.onDelete,
    required this.onLike,
    required this.isDarkMode,
    required this.communityCubit,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final cardColor = isDarkMode ? const Color(0xFF252525) : Colors.white;
    final subTextColor =
        isDarkMode ? Colors.grey.shade400 : Colors.grey.shade700;

    return Card(
      color: cardColor,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Row(
              children: [
                PublisherLogo(
                  publisherName: post.publisherName,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.publisherName,
                        style: AppText.style14Bold(context).copyWith(
                          color: textColor,
                        ),
                      ),
                      Text(
                        AppDates.postFormat(post.publishedAt!),
                        style: AppText.style12Regular(context).copyWith(
                          color: subTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: InternalStorage.getString('role') == 'Admin' ||
                      InternalStorage.getString('role') == 'SuperAdmin' ||
                      post.publisherName == InternalStorage.getString('name'),
                  child: PostOptions(
                    textColor: textColor,
                    onDelete: onDelete,
                    post: post,
                  ),
                ),
              ],
            ),
          ),

          // Post content
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Text(
              post.postDescription,
              style: AppText.style14Regular(context).copyWith(
                color: textColor,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: CachedImage(
              imageUrl: post.postImageLink,
              bottomRadius: 16,
              topRadius: 16,
            ),
          ),

          Visibility(
            visible: InternalStorage.getString('role') != 'Admin' ||
                InternalStorage.getString('role') != 'SuperAdmin',
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).likesCount(
                              AppDates.formatLocalizedNumber(
                                post.likesCount ?? 0,
                                context,
                              ),
                            ),
                      ),
                      Text(
                        S.of(context).commentsCount(
                              AppDates.formatLocalizedNumber(
                                post.commentsCount ?? 0,
                                context,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color:
                      isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LikeButton(
                        post: post,
                      ),
                      CommentButton(
                        post: post,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

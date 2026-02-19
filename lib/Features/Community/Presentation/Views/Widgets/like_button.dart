import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Community%20Cubit/community_cubit.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/main.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    super.key,
    this.onPressed,
    required this.post,
  });

  final void Function()? onPressed;
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .doc(post.postID)
          .collection('likes')
          .doc(
            InternalStorage.getString('id'),
          )
          .snapshots(),
      builder: (context, snapshot) {
        return Expanded(
          child: IconButton(
            onPressed: () {
              BlocProvider.of<CommunityCubit>(context).triggerLike(
                postID: post.postID!,
              );
            },
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 14,
              children: [
                AnimatedCrossFade(
                  firstChild: const Icon(
                    Icons.thumb_up_alt,
                    color: AppColor.primary,
                  ),
                  secondChild: Icon(
                    Icons.thumb_up_alt_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  crossFadeState: isLiked(snapshot)
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 200),
                  reverseDuration: const Duration(milliseconds: 200),
                ),
                Text(
                  S.of(context).likeButtonLabel,
                  style: AppText.style16Bold(context).copyWith(
                    color: isLiked(snapshot)
                        ? AppColor.primary
                        : Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ],
            ),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }

  isLiked(AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    if (snapshot.hasData && !snapshot.hasError && snapshot.data!.exists) {
      return true;
    } else {
      return false;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Community%20Cubit/community_cubit.dart';
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
                Icon(
                  isLiked(snapshot),
                  color: Theme.of(context).iconTheme.color,
                ),
                Text(
                  'Like (${post.likesCount!})',
                  style: AppText.style16Bold(context),
                ),
              ],
            ),
            style: IconButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
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
      return Icons.thumb_up_alt;
    } else {
      return Icons.thumb_up_alt_outlined;
    }
  }
}

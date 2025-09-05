import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Community%20Cubit/community_cubit.dart';

class PostControls extends StatefulWidget {
  const PostControls({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  State<PostControls> createState() => _PostControlsState();
}

class _PostControlsState extends State<PostControls> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      offset: const Offset(0, 50),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () {
              OverlayController.showAddPostDialog(
                context,
                widget.post,
              );
            },
            child: const Text('Edit'),
          ),
          PopupMenuItem(
            onTap: () {
              OverlayController.showDeleteDialog(
                context,
                message: 'Are you sure you want to Delete this Post',
                onConfirm: () {
                  BlocProvider.of<CommunityCubit>(context).deletePost(
                    post: widget.post,
                  );
                },
              );
            },
            child: const Text('Delete'),
          ),
        ];
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/action_card.dart';
import 'package:uccd/generated/l10n.dart';

class AddPostAction extends StatelessWidget {
  const AddPostAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionCard(
      title: S.of(context).addPost,
      onTap: () {
        OverlayController.showCreatePostDialog(context);
      },
    );
  }
}

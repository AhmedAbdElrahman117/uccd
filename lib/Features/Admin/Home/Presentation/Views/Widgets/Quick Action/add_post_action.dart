import 'package:flutter/material.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/action_card.dart';

class AddPostAction extends StatelessWidget {
  const AddPostAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionCard(
      title: 'Add Post',
      onTap: () {
        OverlayController.showAddPostDialog(context);
      },
    );
  }
}

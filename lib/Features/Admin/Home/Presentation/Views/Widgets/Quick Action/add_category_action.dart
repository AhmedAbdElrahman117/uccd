import 'package:flutter/material.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/action_card.dart';

class AddCategoryAction extends StatelessWidget {
  const AddCategoryAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionCard(
      title: 'Add Category',
      onTap: () {
        OverlayController.showAddCategoryDialog(context);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/action_card.dart';

class AddInstructorAction extends StatelessWidget {
  const AddInstructorAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionCard(
      title: 'Add Instructor',
      onTap: () {
        OverlayController.showAddInstructorDialog(context);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/action_card.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_student_view.dart';

class AddStudentAction extends StatelessWidget {
  const AddStudentAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionCard(
      title: 'Add Student',
      onTap: () async {
        await context.push(AddStudentView.id);
      },
    );
  }
}

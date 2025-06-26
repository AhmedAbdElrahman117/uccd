import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/add_course_view.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/action_card.dart';

class AddCourseAction extends StatelessWidget {
  const AddCourseAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionCard(
      title: 'Add Course',
      onTap: () async {
        await context.push(AddCourseView.id);
      },
    );
  }
}

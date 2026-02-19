import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/menu_button.dart';

class CourseDeleteButton extends StatelessWidget {
  const CourseDeleteButton({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      icon: Icons.delete,
      title: 'Delete',
      backgroundColor: Colors.red,
      onTap: () {
        OverlayController.showDeleteDialog(
          context,
          message: 'Do you want to Delete ${course.title} permenantly',
          onConfirm: () {
            context.pop();
            BlocProvider.of<AvailableCourseCubit>(context).delete(
              course: course,
            );
          },
        );
      },
    );
  }
}

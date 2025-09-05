import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Instructor%20Cubit/admin_instructor_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/control_panel.dart';

class Instructor extends StatelessWidget {
  const Instructor({
    super.key,
    required this.instructor,
  });

  final UserModel instructor;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      verticalPadding: 4,
      horizontalPadding: 12,
      child: Column(
        children: [
          ListTile(
            title: Text(instructor.name),
            subtitle: Text(instructor.email),
          ),
          ControlPanel(
            deleteMessage: "Are you Sure you want to Delete This Instructor",
            onDelete: () {
              BlocProvider.of<AdminInstructorCubit>(context).delete(
                email: instructor.email,
                password: instructor.password,
                id: instructor.id!,
              );
              context.pop();
            },
            onEdit: () {
              OverlayController.showAddInstructorDialog(
                context,
                instructor,
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/student_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Student%20Cubit/admin_student_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/control_panel.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_student_view.dart';

class Student extends StatelessWidget {
  const Student({
    super.key,
    required this.student,
  });

  final UserModel student;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      allPadding: 8,
      child: Column(
        spacing: 12,
        children: [
          StudentTile(
            student: student,
          ),
          ControlPanel(
            deleteMessage: 'Are you Sure you want to Delete This Student',
            onDelete: () async {
              context.pop();
              BlocProvider.of<AdminStudentCubit>(context).delete(
                email: student.email,
                id: student.id!,
                password: student.password,
              );
            },
            onEdit: () {
              context.push(
                AddStudentView.id,
                extra: student,
              );
            },
          ),
        ],
      ),
    );
  }
}

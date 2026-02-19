import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/user_card.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_student_view.dart';

class StudentsListView extends StatelessWidget {
  const StudentsListView({
    super.key,
    required this.students,
    required this.cubit,
  });

  final List<UserModel> students;
  final AdminUsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: UserCard(
            userName: students[index].name,
            info: Text(students[index].email),
            student: students[index],
            onEdit: () {
              context.push(
                AddStudentView.id,
                extra: students[index],
              );
            },
            onDelete: () => cubit.deleteUser(
              user: students[index],
            ),
            deleteMessage:
                'Are you sure you want to delete ${students[index].name} from Students',
            deleteImage: AppAssets.imagesRemoveUser,
          ),
        );
      },
    );
  }
}

// if (entry != null) {
//             entry!.remove();
//             entry = null;
//             return Future.value(true);
//           } else {
//             return Future.value(false);
//           }

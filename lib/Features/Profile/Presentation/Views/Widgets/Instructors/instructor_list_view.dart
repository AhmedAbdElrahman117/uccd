import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/user_card.dart';

class InstructorListView extends StatelessWidget {
  const InstructorListView(
      {super.key, required this.instructors, required this.cubit});

  final List<UserModel> instructors;
  final AdminUsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: instructors.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: UserCard(
            userName: instructors[index].name,
            info: Text(instructors[index].email),
            onEdit: () {
              OverlayController.showAddInstructorDialog(
                context,
                instructors[index],
              );
            },
            onDelete: () => cubit.deleteUser(
              user: instructors[index],
            ),
            deleteMessage:
                'Are you sure you want to delete ${instructors[index].name} from Instructors',
            deleteImage: AppAssets.imagesRemoveUser,
          ),
        );
      },
    );
  }
}

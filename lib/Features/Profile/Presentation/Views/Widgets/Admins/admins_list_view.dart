import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/user_card.dart';

class AdminsListView extends StatelessWidget {
  const AdminsListView({
    super.key,
    required this.admins,
    required this.cubit,
  });

  final List<UserModel> admins;
  final AdminUsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: admins.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: UserCard(
            userName: admins[index].name,
            info: Text(admins[index].email),
            onDelete: () {
              cubit.deleteUser(
                user: admins[index],
              );
            },
            onEdit: () {
              OverlayController.showAddAdminDialog(
                context,
                admins[index],
              );
            },
            deleteMessage:
                'Are you sure you want to delete ${admins[index].name} from Admins',
            deleteImage: AppAssets.imagesRemoveUser,
          ),
        );
      },
    );
  }
}

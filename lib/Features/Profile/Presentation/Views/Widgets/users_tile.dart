import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/custom_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views/admin_users_view.dart';
import 'package:uccd/generated/l10n.dart';

class UsersTile extends StatelessWidget {
  const UsersTile({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomTile(
      title: S.of(context).users,
      icon: Icons.group_outlined,
      onTap: () async {
        await context.push(AdminUsersView.id);
      },
    );
  }
}

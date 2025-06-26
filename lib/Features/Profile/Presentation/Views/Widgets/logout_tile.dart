import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Login/Presentation/Views/login_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/custom_tile.dart';
import 'package:uccd/main.dart';
import 'package:uccd/generated/l10n.dart';

class LogoutTile extends StatelessWidget {
  const LogoutTile({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomTile(
      title: S.of(context).logout,
      icon: Icons.logout_outlined,
      onTap: () {
        OverlayController.showLogoutDialog(
          context,
          message: S.of(context).logoutConfirmation,
          onConfirm: () async {
            InternalStorage.setString('id', '');
            InternalStorage.setString('role', '');
            InternalStorage.setString('email', '');
            InternalStorage.setString('name', '');
            InternalStorage.setString('department', '');
            InternalStorage.setString('year', '');
            await FirebaseAuth.instance.signOut();
            context.go(LoginView.id);
          },
        );
      },
    );
  }
}

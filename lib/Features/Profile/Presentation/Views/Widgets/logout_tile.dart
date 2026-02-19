import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Login/Presentation/Views/login_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/custom_tile.dart';
import 'package:uccd/main.dart';

class LogoutTile extends StatelessWidget {
  const LogoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      title: 'Logout',
      icon: Icons.logout_outlined,
      onTap: () {
        OverlayController.showLogoutDialog(
          context,
          message: 'Are you sure you want to Logout',
          onConfirm: () async {
            InternalStorage.setString('id', '');
            await FirebaseAuth.instance.signOut();
            // ignore: use_build_context_synchronously
            context.go(LoginView.id);
          },
        );
      },
    );
  }
}

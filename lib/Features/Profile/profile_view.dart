import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/profile_data.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/language_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/logout_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/theme_mode_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/users_tile.dart';
import 'package:uccd/main.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const ProfileData(),
          Visibility(
            visible: InternalStorage.getString('role') == 'Admin',
            child: const Column(
              children: [
                UsersTile(),
                CategoryTile(),
              ],
            ),
          ),
          const LanguageTile(),
          const ThemeModeTile(),
          const LogoutTile(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

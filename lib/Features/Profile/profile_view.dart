import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/profile_data.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/admin_features_section.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/profile_account_section.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/profile_settings_section.dart';
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
      backgroundColor: AdminHomeThemeHelper.getBackgroundColor(context),
      body: Container(
        color: ThemeHelper.isDark(context)
            ? const Color(0xFF1A1A1A)
            : Colors.white,
        child: CustomScrollView(
          slivers: [
            // Profile Header Section with gradient background
            const SliverToBoxAdapter(
              child: ProfileData(),
            ),

            // Admin Features Section
            SliverToBoxAdapter(
              child: Visibility(
                visible: InternalStorage.getString('role') == 'SuperAdmin' ||
                    InternalStorage.getString('role') == 'Admin',
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
                  child: AdminFeaturesSection(),
                ),
              ),
            ),

            // Settings Section
            const SliverToBoxAdapter(
              child: ProfileSettingsSection(),
            ),

            // Account Section
            const SliverToBoxAdapter(
              child: ProfileAccountSection(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

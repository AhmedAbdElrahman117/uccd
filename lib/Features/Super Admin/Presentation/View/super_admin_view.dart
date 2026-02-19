import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_courses_view.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/admin_bottom_bar.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/admin_home_view.dart';
import 'package:uccd/Features/Community/Presentation/Views/community_tab.dart';
import 'package:uccd/Features/Profile/profile_view.dart';

class SuperAdminView extends StatefulWidget {
  const SuperAdminView({super.key});

  static String id = '/SuperAdminView';

  @override
  State<SuperAdminView> createState() => _SuperAdminViewState();
}

class _SuperAdminViewState extends State<SuperAdminView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            AdminHomeView(
              tabController: tabController,
            ),
            const AdminCoursesView(),
            const CommunityTab(),
            const ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: ThemeHelper.isDark(context)
            ? const Color(0xFF1A1A1A)
            : Colors.white,
        child: AdminBottomBar(
          tabController: tabController,
        ),
      ),
    );
  }
}

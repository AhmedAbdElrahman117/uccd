import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/admin_bottom_bar.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_courses_view.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/admin_home_view.dart';
import 'package:uccd/Features/Community/Presentation/Views/community_tab.dart';
import 'package:uccd/Features/Profile/profile_view.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  static const String id = '/adminView';

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> with TickerProviderStateMixin {
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
      bottomNavigationBar: AdminBottomBar(
        tabController: tabController,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uccd/Features/Community/Presentation/Views/community_view.dart';
import 'package:uccd/Features/Profile/profile_view.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/user_bottom_bar.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/user_home_view.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views/user_course_view.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  static const String id = '/userView';

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            UserHomeView(),
            UserCoursesView(),
            CommunityView(),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: UserBottomBar(
        tabController: tabController,
      ),
    );
  }
}

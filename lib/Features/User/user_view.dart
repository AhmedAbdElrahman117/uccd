import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/bottom_bar.dart';
import 'package:uccd/Core/providers/tab_controller_provider.dart';
import 'package:uccd/Features/Community/Presentation/Views/community_tab.dart';
import 'package:uccd/Features/Profile/profile_view.dart';
import 'package:uccd/Features/User/user_view_test_widgets/adaptive_tab_view.dart';
import 'package:uccd/Features/User/user_view_test_widgets/courses_tab/courses_tab.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/home_tab.dart';
import 'package:uccd/Features/User/user_view_test_widgets/my_courses_tab/my_courses_tab.dart';
import 'package:uccd/generated/l10n.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  static const String id = '/userView';

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final brightness = Theme.of(context).brightness;
    final isDarkMode = brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF1A1A1A) : Colors.white;

    return TabControllerProvider(
      tabController: _tabController,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: AdaptiveTabView(
            tabController: _tabController,
            children: [
              HomeTab(
                tabController: _tabController,
              ),
              const CoursesTab(),
              MyCoursesTab(
                tabController: _tabController,
              ),
              const CommunityTab(),
              const ProfileView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          tabController: _tabController,
          barButtons: {
            S.of(context).home: FontAwesomeIcons.house,
            S.of(context).courses: FontAwesomeIcons.bookOpen,
            S.of(context).myCourses: FontAwesomeIcons.graduationCap,
            S.of(context).community: FontAwesomeIcons.globe,
            S.of(context).profile: FontAwesomeIcons.solidUser,
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

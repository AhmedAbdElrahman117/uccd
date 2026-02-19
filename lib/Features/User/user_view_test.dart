import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/bottom_bar.dart';
import 'package:uccd/Core/providers/tab_controller_provider.dart';
import 'package:uccd/Features/Community/Presentation/Views/community_tab.dart';
import 'package:uccd/Features/User/user_view_test_widgets/adaptive_tab_view.dart';
import 'package:uccd/Features/User/user_view_test_widgets/courses_tab/courses_tab.dart';

class UserViewTest extends StatefulWidget {
  const UserViewTest({super.key});

  static const String id = '/userViewTest';

  @override
  State<UserViewTest> createState() => _UserViewTestState();
}

class _UserViewTestState extends State<UserViewTest>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            children: const [
              // HomeTab(),
              CoursesTab(),
              // MyCoursesTab(),
              SizedBox(),
              CommunityTab(),
              // MockProfileTab(),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          tabController: _tabController,
          barButtons: const {
            'Home': FontAwesomeIcons.house,
            'Courses': FontAwesomeIcons.bookOpen,
            'My Courses': FontAwesomeIcons.graduationCap,
            'Community': FontAwesomeIcons.globe,
            'Profile': FontAwesomeIcons.solidUser,
          },
        ),
      ),
    );
  }
}

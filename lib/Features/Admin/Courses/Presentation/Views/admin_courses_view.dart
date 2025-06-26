import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Enhanced/Components/add_course_fab.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Enhanced/Components/enhanced_tab_bar.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_archive_course_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_available_courses_view.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class AdminCoursesView extends StatefulWidget {
  const AdminCoursesView({super.key});

  @override
  State<AdminCoursesView> createState() => _AdminCoursesViewState();
}

class _AdminCoursesViewState extends State<AdminCoursesView>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController tabController;
  int currentTabIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (mounted) {
        setState(() {
          currentTabIndex = tabController.index;
        });
        // Add haptic feedback on tab change
        HapticFeedback.selectionClick();
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: CustomSliverListView(
        appBarTitle: S.of(context).coursesManagement,
        bottom: EnhancedAdminCoursesTabBar(
          tabController: tabController,
          currentIndex: currentTabIndex,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: AdminHomeThemeHelper.getBackgroundGradient(context),
          ),
          child: TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: const [
              AdminAvailbleCoursesView(),
              AdminArchiveCourseView(),
            ],
          ),
        ),
      ),
      floatingActionButton: AddCourseFab(),
    );
  }

  @override
  bool get wantKeepAlive => false;
}

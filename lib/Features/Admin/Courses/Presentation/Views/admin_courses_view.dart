import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_archive_course_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_available_courses_view.dart';

class AdminCoursesView extends StatefulWidget {
  const AdminCoursesView({super.key});

  @override
  State<AdminCoursesView> createState() => _AdminCoursesViewState();
}

class _AdminCoursesViewState extends State<AdminCoursesView>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomSliverListView(
            appBarTitle: 'Courses',
            bottom: TabBar(
              controller: tabController,
              automaticIndicatorColorAdjustment: true,
              indicatorColor: Colors.amber,
              labelColor: Colors.amber,
              tabs: const [
                Tab(text: 'Available'),
                Tab(text: 'Archive'),
              ],
            ),
            body: TabBarView(
              controller: tabController,
              children: const [
                AdminAvailbleCoursesView(),
                AdminArchiveCourseView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}

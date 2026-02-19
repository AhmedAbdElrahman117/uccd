import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_cubit.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_cubit.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/recent_courses_carousel.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/home_stats.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/home_welcome_section.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/progress_courses.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/section_header.dart';
import 'package:uccd/generated/l10n.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  late MyCoursesCubit _myCoursesCubit;
  late UserHomeCubit _userHomeCubit;

  @override
  void initState() {
    super.initState();
    _myCoursesCubit = MyCoursesCubit(
      limit: 2,
      acceptedOnly: true,
    );
    _userHomeCubit = UserHomeCubit();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _myCoursesCubit),
        BlocProvider.value(value: _userHomeCubit),
      ],
      child: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          HomeWelcomeSection(
            onAvatarTap: () => widget.tabController.animateTo(4),
            onContinueLearningTap: () => widget.tabController.animateTo(2),
          ),
          const HomeStats(),
          ProgressCourses(
            tabController: widget.tabController,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
            child: SectionHeader(
              title: S.of(context).recentCourses,
              onViewAllPressed: () {
                widget.tabController.animateTo(1);
              },
            ),
          ),
          const RecentCoursesCarousel(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _myCoursesCubit.close();
    _userHomeCubit.close();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

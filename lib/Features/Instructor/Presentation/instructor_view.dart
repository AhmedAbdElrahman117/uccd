import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/bottom_bar.dart';
import 'package:uccd/Features/Community/Presentation/Views/community_tab.dart';
import 'package:uccd/Features/Instructor/Presentation/instructor_home_view.dart';
import 'package:uccd/Features/Profile/profile_view.dart';
import 'package:uccd/Features/User/user_view_test_widgets/adaptive_tab_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Instructor/Cubit/instructor_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class InstructorView extends StatefulWidget {
  const InstructorView({super.key});

  static const String id = '/instructorView';

  @override
  State<InstructorView> createState() => _InstructorViewState();
}

class _InstructorViewState extends State<InstructorView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController tabController;
  late InstructorCubit instructorCubit;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    instructorCubit = InstructorCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => instructorCubit..getCourses(),
      child: Scaffold(
        body: SafeArea(
          child: AdaptiveTabView(
            tabController: tabController,
            children: [
              InstructorHomeView(
                tabController: tabController,
                instructorCubit: instructorCubit,
              ),
              CommunityTab(),
              ProfileView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          tabController: tabController,
          barButtons: {
            S.of(context).home: FontAwesomeIcons.house,
            S.of(context).community: FontAwesomeIcons.globe,
            S.of(context).profile: FontAwesomeIcons.solidUser,
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

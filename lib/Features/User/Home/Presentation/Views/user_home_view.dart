import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_cubit.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/App%20Bar/home_app_bar.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/user_courses_filter.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/user_courses_stream.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeAppBar(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: SectionTitle(
                title: 'Courses',
              ),
            ),
          ),
          UserCoursesFilter(),
          UserCoursesStream(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

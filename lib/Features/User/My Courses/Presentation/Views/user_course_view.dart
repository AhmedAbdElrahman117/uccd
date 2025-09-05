import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views/Widgets/my_courses_stream.dart';

class UserCoursesView extends StatefulWidget {
  const UserCoursesView({
    super.key,
  });

  @override
  State<UserCoursesView> createState() => _UserCoursesViewState();
}

class _UserCoursesViewState extends State<UserCoursesView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const CustomSliverListView(
      appBarTitle: 'My Courses',
      body: MyCoursesStream(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

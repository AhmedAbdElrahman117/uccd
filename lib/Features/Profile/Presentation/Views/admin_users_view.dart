import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Features/Profile/Presentation/Views/admin_instructors_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/admin_students_view.dart';

class AdminUsersView extends StatelessWidget {
  const AdminUsersView({super.key});

  static const String id = '/UsersView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DefaultTabController(
        length: 2,
        child: CustomSliverListView(
          appBarTitle: 'Users',
          bottom: TabBar(
            indicatorColor: AppColor.primary,
            labelColor: AppColor.primary,
            tabs: [
              Tab(
                text: 'Students',
              ),
              Tab(
                text: 'Instructors',
              )
            ],
          ),
          body: TabBarView(
            children: [
              AdminStudentsView(),
              AdminInstructorsView(),
            ],
          ),
        ),
      ),
    );
  }
}

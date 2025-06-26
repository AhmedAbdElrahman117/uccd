import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/admin_instructors_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/admin_students_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/super_admin_users_view.dart';
import 'package:uccd/generated/l10n.dart';

class AdminUsersView extends StatefulWidget {
  const AdminUsersView({super.key});

  static const String id = '/UsersView';

  @override
  State<AdminUsersView> createState() => _AdminUsersViewState();
}

class _AdminUsersViewState extends State<AdminUsersView> {
  AdminUsersCubit cubit = AdminUsersCubit();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminUsersCubit, AdminUsersStates>(
      bloc: cubit,
      listener: (context, state) {
        if (state is DeleteLoading) {
          context.pop();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            DefaultTabController(
              length: 3,
              child: CustomSliverListView(
                appBarTitle: S.of(context).users,
                bottom: TabBar(
                  indicatorColor: AppColor.primary,
                  labelColor: AppColor.primary,
                  tabs: [
                    Tab(
                      text: S.of(context).admins,
                    ),
                    Tab(
                      text: S.of(context).instructors,
                    ),
                    Tab(
                      text: S.of(context).students,
                    ),
                  ],
                ),
                body: TabBarView(
                  children: [
                    SuperAdminUsersView(
                      cubit: cubit,
                    ),
                    AdminInstructorsView(
                      cubit: cubit,
                    ),
                    AdminStudentsView(
                      cubit: cubit,
                    ),
                  ],
                ),
              ),
            ),
            BlocSelector<AdminUsersCubit, AdminUsersStates, bool>(
              bloc: cubit,
              selector: (state) {
                if (state is DeleteLoading) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return CustomLoadingIndicator(
                  isLoading: state,
                  child: const SizedBox(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

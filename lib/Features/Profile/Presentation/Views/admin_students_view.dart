import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Core/Components/custom_fab.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/students_list_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_student_view.dart';

class AdminStudentsView extends StatefulWidget {
  const AdminStudentsView({super.key, required this.cubit});

  final AdminUsersCubit cubit;

  @override
  State<AdminStudentsView> createState() => _AdminStudentsViewState();
}

class _AdminStudentsViewState extends State<AdminStudentsView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.cubit.getStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: [
            BlocConsumer<AdminUsersCubit, AdminUsersStates>(
              bloc: widget.cubit,
              listener: _listener,
              buildWhen: (previous, current) {
                return current is StudentDataLoading ||
                    current is StudentDataLoaded ||
                    current is StudentDataEmpty ||
                    current is AdminUsersInitialState ||
                    current is StudentDataFailed;
              },
              builder: (context, state) {
                switch (state) {
                  case AdminUsersInitialState():
                    return const SizedBox();
                  case StudentDataLoading():
                    return const LoadingIndicator();
                  case StudentDataFailed():
                    return const DataErrorWidget();
                  case StudentDataEmpty():
                    return const NoDataWidget(
                      message: 'No Registered Users',
                    );
                  case StudentDataLoaded():
                    return StudentsListView(
                      students: state.students,
                      cubit: widget.cubit,
                    );
                  default:
                    return Container();
                }
              },
            ),
            BlocSelector<AdminUsersCubit, AdminUsersStates, bool>(
              bloc: widget.cubit,
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
      floatingActionButton: CustomFab(
        icon: Icons.person_add,
        onPressed: () async {
          await context.push(AddStudentView.id);
        },
      ),
    );
  }

  void _listener(BuildContext context, AdminUsersStates state) {
    if (state is StudentDeleteSuccess) {
      AppBanners.showSuccess(
        message: AppException.getLocalizedMessage(
          state.successMessage,
          context,
        ),
      );
    } else if (state is StudentDeleteFailed) {
      AppBanners.showFailed(
        message: AppException.getLocalizedMessage(
          state.errorMessage,
          context,
        ),
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}

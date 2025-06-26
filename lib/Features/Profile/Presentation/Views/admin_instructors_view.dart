import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/Components/custom_fab.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Instructors/instructor_list_view.dart';

class AdminInstructorsView extends StatefulWidget {
  const AdminInstructorsView({super.key, required this.cubit});

  final AdminUsersCubit cubit;

  @override
  State<AdminInstructorsView> createState() => _AdminInstructorsViewState();
}

class _AdminInstructorsViewState extends State<AdminInstructorsView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.cubit.getInstructors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: BlocConsumer<AdminUsersCubit, AdminUsersStates>(
          bloc: widget.cubit,
          listener: _listener,
          buildWhen: (previous, current) {
            return current is InstructorDataLoading ||
                current is InstructorDataLoaded ||
                current is InstructorDataEmpty ||
                current is AdminUsersInitialState ||
                current is InstructorDataFailed;
          },
          builder: (context, state) {
            switch (state) {
              case AdminUsersInitialState():
                return const SizedBox();
              case InstructorDataLoading():
                return const LoadingIndicator();
              case InstructorDataFailed():
                return DataErrorWidget(
                  message: state.errorMessage,
                );
              case InstructorDataEmpty():
                return const NoDataWidget(
                  message: 'No Instrcutors',
                );
              case InstructorDataLoaded():
                return InstructorListView(
                  instructors: state.instructors,
                  cubit: widget.cubit,
                );
              default:
                return Container();
            }
          },
        ),
      ),
      floatingActionButton: CustomFab(
        icon: Icons.person_add,
        onPressed: () {
          OverlayController.showAddInstructorDialog(context);
        },
      ),
    );
  }

  void _listener(BuildContext context, AdminUsersStates state) {
    if (state is InstrcutorDeleteFailed) {
      AppBanners.showFailed(
        message: state.errorMessage,
      );
    } else if (state is InstrcutorDeleteSuccess) {
      AppBanners.showSuccess(
        message: state.successMessage,
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}

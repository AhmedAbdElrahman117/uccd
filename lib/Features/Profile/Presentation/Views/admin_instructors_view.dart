import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/Components/custom_fab.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Instructor%20Cubit/admin_instructor_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Instructor%20Cubit/admin_instructor_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Instructors/instructor_list_view.dart';

class AdminInstructorsView extends StatefulWidget {
  const AdminInstructorsView({super.key});

  static const String id = '/InstructorsView';

  @override
  State<AdminInstructorsView> createState() => _AdminInstructorsViewState();
}

class _AdminInstructorsViewState extends State<AdminInstructorsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => AdminInstructorCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Stack(
            children: [
              BlocConsumer<AdminInstructorCubit, AdminInstructorStates>(
                listener: _listener,
                buildWhen: (previous, current) {
                  return current is DataLoading ||
                      current is DataLoaded ||
                      current is DataEmpty ||
                      current is InstructorInitialState ||
                      current is DataFailed;
                },
                builder: (context, state) {
                  switch (state) {
                    case InstructorInitialState():
                      return const SizedBox();
                    case DataLoading():
                      return const LoadingIndicator();
                    case DataFailed():
                      return const DataErrorWidget();
                    case DataEmpty():
                      return const NoDataWidget(
                        message: 'No Instrcutors',
                      );
                    case DataLoaded():
                      return InstructorListView(
                        instructors: state.instructors,
                      );
                    default:
                      return Container();
                  }
                },
              ),
              BlocSelector<AdminInstructorCubit, AdminInstructorStates, bool>(
                selector: (state) {
                  if (state is DeleteLoading) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  return CustomLoadingIndicator(
                    isLoading: state,
                    child: const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: CustomFab(
          icon: Icons.person_add,
          onPressed: () {
            OverlayController.showAddInstructorDialog(context);
          },
        ),
      ),
    );
  }

  void _listener(BuildContext context, AdminInstructorStates state) {
    if (state is DeleteFailed) {
      AppBanners.showFailed(message: state.errorMessage);
    } else if (state is DeleteSuccess) {
      AppBanners.showSuccess(message: state.successMessage);
    }
  }

  @override
  bool get wantKeepAlive => true;
}

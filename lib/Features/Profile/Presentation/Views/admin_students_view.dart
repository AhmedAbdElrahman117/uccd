import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/Components/custom_fab.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Student%20Cubit/admin_student_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Student%20Cubit/admin_student_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/students_list_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_student_view.dart';

class AdminStudentsView extends StatefulWidget {
  const AdminStudentsView({super.key});

  static const String id = '/StudentsView';

  @override
  State<AdminStudentsView> createState() => _AdminStudentsViewState();
}

class _AdminStudentsViewState extends State<AdminStudentsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => AdminStudentCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Stack(
            children: [
              BlocConsumer<AdminStudentCubit, AdminStudentStates>(
                listener: _listener,
                buildWhen: (previous, current) {
                  return current is DataLoading ||
                      current is DataLoaded ||
                      current is DataEmpty ||
                      current is AddStudentInitialState ||
                      current is DataFailed;
                },
                builder: (context, state) {
                  switch (state) {
                    case AddStudentInitialState():
                      return const SizedBox();
                    case DataLoading():
                      return const LoadingIndicator();
                    case DataFailed():
                      return const DataErrorWidget();
                    case DataEmpty():
                      return const NoDataWidget(
                        message: 'No Registered Users',
                      );
                    case DataLoaded():
                      return StudentsListView(
                        data: state.users,
                      );
                    default:
                      return Container();
                  }
                },
              ),
              BlocSelector<AdminStudentCubit, AdminStudentStates, bool>(
                selector: (state) {
                  if (state is Loading) {
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
      ),
    );
  }

  void _listener(BuildContext context, AdminStudentStates state) {
    if (state is DeleteSuccess) {
      AppBanners.showSuccess(message: state.successMessage);
    } else if (state is DeleteFailed) {
      AppBanners.showFailed(message: state.errorMessage);
    }
  }

  @override
  bool get wantKeepAlive => true;
}

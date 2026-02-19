import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/add_course_fab.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_courses_list.dart';

class AdminAvailbleCoursesView extends StatefulWidget {
  const AdminAvailbleCoursesView({super.key});

  @override
  State<AdminAvailbleCoursesView> createState() =>
      _AdminAvailbleCoursesViewState();
}

class _AdminAvailbleCoursesViewState extends State<AdminAvailbleCoursesView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => AvailableCourseCubit(),
        child: BlocBuilder<AvailableCourseCubit, AvailableCourseStates>(
          buildWhen: (previous, current) {
            return current is DataEmpty ||
                current is AvailableCourseInitialState ||
                current is DataFailed ||
                current is DataLoaded ||
                current is DataLoading;
          },
          builder: (context, state) {
            switch (state) {
              case AvailableCourseInitialState():
                return const SizedBox();
              case DataLoading():
                return const LoadingIndicator();
              case DataEmpty():
                return const NoDataWidget(
                  message: 'No Created Course',
                );
              case DataFailed():
                return DataErrorWidget(
                  message: state.errorMessage,
                );
              case DataLoaded():
                return AdminCoursesList(
                  courses: state.courses,
                  tagID: 'AdminAvailableCourses',
                );

              default:
                return Container();
            }
          },
        ),
      ),
      floatingActionButton: const AddCourseFab(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

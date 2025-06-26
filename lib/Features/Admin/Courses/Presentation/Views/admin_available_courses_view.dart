import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Themes/admin_courses_theme_helper.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_courses_list.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/enhanced_courses_error_widget.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/enhanced_courses_loading_widget.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/enhanced_empty_courses_widget.dart';

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
    return Container(
      decoration: BoxDecoration(
        gradient: AdminCoursesThemeHelper.getBackgroundGradient(context),
      ),
      child: BlocProvider(
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
                return const Center(
                  child: EnhancedCoursesLoadingWidget(
                    message: 'Loading your courses...',
                  ),
                );
              case DataEmpty():
                return const EnhancedEmptyCoursesWidget(
                  message:
                      'Start building your course library by creating your first course.',
                );
              case DataFailed():
                return EnhancedCoursesErrorWidget(
                  message: state.errorMessage,
                );
              case DataLoaded():
                return AdminCoursesList(
                  courses: state.courses,
                  tagID: 'scscsa',
                );

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
